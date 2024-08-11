
unit ActiveOberonParser;

{$mode objfpc}{$H+}

interface

uses
    SysUtils, ActiveOberonScanner;

const

    (* Abstract Syntax Three node types *)
    nk_none = 0; nk_identifier = 1; nk_nil = 2; nk_imag = 3; nk_true = 4; nk_false = 5; nk_self = 6; nk_result = 7; 
    nk_address = 8; nk_address_of = 9; nk_size = 10; nk_size_of = 11; nk_alias = 12; nk_number = 13; nk_character = 14;
    nk_string = 15; nk_unary_plus = 16; nk_unary_minus = 17; nk_unary_not = 18; nk_times = 19; nk_slash = 20; nk_div = 21;
    nk_mod = 22; nk_and = 23; nk_dot_times = 24; nk_dot_slash = 25; nk_back_slash = 26; nk_times_times = 27; nk_plus_times = 28;

type

    // Abstract Syntax Tree nodes /////////////////////////////////////////////////////////////////

    EParserException = class(Exception)
        strict private
            _fileName: string;
            _line, _col: Int64;

        public
            constructor Create(line, col: Int64; const fileName, msg: string); reintroduce;

            property FileName: string read _fileName;
            property Line: Int64 read _line;
            property Col: Int64 read _col;

    end;

    NodeKind = Int64;

    TSyntaxNodeClass = class of TSyntaxNode;

    TSyntaxNode = class
        private
            _col, _line: Int64;
            _kind: NodeKind;
            _parent: TSyntaxNode;
            _childNodes: specialize TArray<TSyntaxNode>;
            _hasChildren: Boolean;
            _fileName: string;


        public
            constructor Create(nodeKind: NodeKind);
            destructor Destroy; override;
            function Clone: TSyntaxNode; virtual;

            function AddChild(node: TSyntaxNode) : TSyntaxNode; overload;
            procedure DeleteChild(node: TSyntaxNode);
            procedure ExtractChild(node: TSyntaxNode);
            function FindChild(kind: NodeKind) : TSyntaxNode; overload;


            property Kind: Int64 read _kind;
            property Col: Int64 read _col write _col;
            property Line: Int64 read _line write _line;
            property Parent: TSyntaxNode read _parent;
            property ChildNodes: specialize TArray<TSyntaxNode> read _childNodes;
            property HasChildNodes: Boolean read _hasChildren;
            property FileName: string read _fileName write _fileName;
    end;

    TCompoundSyntaxNode = class(TSyntaxNode)
        private
            _endCol, _endLine: Int64;

        public
            function Clone: TSyntaxNode; override;

            property EndCol: Int64 read _endCol write _endCol;
            property EndLine: Int64 read _endLine write _endLine;

    end;

    TValuedSyntaxNode = class(TSyntaxNode)
        private
            _value: string;

        public
            function Clone: TSyntaxNode; override;

            property Value: string read _value write _value;
    end;

    TCommentNode = class(TSyntaxNode)
        private
            _text: string;

        public
            function Clone: TSyntaxNode; override;

            property Text: string read _text write _text;
            
    end;

    







    TNode = class
        _startPos, _endPos: Int64;
        _line: Int64;
        _kind: NodeKind;
        constructor Create(startPos, endPos, line: Int64; kind: NodeKind);
    end;

    TPrimaryNode = class (TNode)
        _symbol: ActiveOberonScanner.Symbol;
        constructor Create(startPos, endPos, line: Int64; kind: NodeKind; symbol: ActiveOberonScanner.Symbol); 
    end;

    TUnaryNode = class (TNode)
        _left: TNode;
        constructor Create(startPos, endPos, line: Int64; kind: NodeKind; left: TNode); 
    end;

    TBinaryNode = class (TNode)
        _left, _right: TNode;
        constructor Create(startPos, endPos, line: Int64; kind: NodeKind; left, right: TNode); 
    end;




    ///////////////////////////////////////////////////////////////////////////////////////////////

    TParserObject = class
        lexer: TScannerObject;
        symbol: ActiveOberonScanner.Symbol;
        error: Boolean;
        constructor Create(fileName: string);
        destructor Done;
        procedure Advance;

        (* Expression rules *)
        function ParsePrimaryExpression : TNode;
        function ParseUnaryExpression : TNode;
        function ParseFactorExpression : TNode;
        function ParseTermExpression : TNode;
    end;


implementation


    // TSyntaxError ///////////////////////////////////////////////////////////////////////////////

    { TSyntaxNode }

    function TSyntaxNode.AddChild(node: TSyntaxNode): TSyntaxNode;
    begin
        Assert(Assigned(node));

        SetLength(_childNodes, Length(_childNodes) + 1);
        _childNodes[Length(_childNodes) - 1] := node;

        node._parent := Self;

        Result := node;
    end;

    function TSyntaxNode.Clone: TSyntaxNode;
        var
            i: Int64;
        begin
            Result := TSyntaxNodeClass(Self.ClassType).Create(_kind);

            SetLength(Result._childNodes, Length(_childNodes));
            for i := 0 to High(_childNodes) do
            begin
                Result._childNodes[i] := _childNodes[i].Clone;
                Result._childNodes[i]._parent := Result;
            end;

            //Result.FAttributes := Copy(FAttributes);
            //Result.AssignPositionFrom(Self);
    end;

    constructor TSyntaxNode.Create(nodeKind: NodeKind);
    begin
        inherited Create;
        _kind := nodeKind;
    end;

    procedure TSyntaxNode.ExtractChild(node: TSyntaxNode);
    var
        i: Int64;
    begin
        for i := 0 to High(_childNodes) do
            if _childNodes[i] = node then
            begin
            if i < High(_childNodes) then
                Move(_childNodes[i + 1], _childNodes[i], SizeOf(TSyntaxNode) * (Length(_childNodes) - i - 1));
            SetLength(_childNodes, High(_childNodes));
            Break;
            end;
    end;

    procedure TSyntaxNode.DeleteChild(node: TSyntaxNode);
    begin
        ExtractChild(node);
        node.Free;
    end;

    destructor TSyntaxNode.Destroy;
    var
        i: Int64;
    begin
        for i := 0 to High(_childNodes) do
            FreeAndNil(_childNodes[i]);
        inherited;
    end;

    function TSyntaxNode.FindChild(kind: NodeKind): TSyntaxNode;
    var
        i: Int64;
    begin
        for i := 0 to High(_childNodes) do
            if _childNodes[i]._kind = kind then
            Exit(_childNodes[i]);
        Result := nil;
    end;

    function TCompoundSyntaxNode.Clone: TSyntaxNode;
    begin;
        Result := inherited;

        TCompoundSyntaxNode(Result).EndLine := Self.EndLine;
        TCompoundSyntaxNode(Result).EndCol := Self.EndCol;
    end;

    { TValuedSyntaxNode }

    function TValuedSyntaxNode.Clone: TSyntaxNode;
    begin;
        Result := inherited;

        TValuedSyntaxNode(Result).Value := Self.Value;
    end; 

    { TCommentSyntaxNode }

    function TCommentNode.Clone: TSyntaxNode;
    begin;
        Result := inherited;

        TCommentNode(Result).Text := Self.Text;
    end;

    { EParserException }

    constructor EParserException.Create(line, col: Int64; const fileName, msg: string);
    begin;
        inherited Create(msg);

        _fileName := fileName;
        _line := line;
        _col := col;
    end;


    ///////////////////////////////////////////////////////////////////////////////////////////////

    constructor TNode.Create(startPos, endPos, line: Int64; kind: NodeKind);
    begin
        _startPos := startPos; _endPos := endPos; _line := line; _kind := kind; 
    end;

    constructor TPrimaryNode.Create(startPos, endPos, line: Int64; kind: NodeKind; symbol: ActiveOberonScanner.Symbol);
    begin
        inherited Create(startPos, endPos, line, kind);
        _symbol := symbol;
    end;

    constructor TUnaryNode.Create(startPos, endPos, line: Int64; kind: NodeKind; left: TNode);
    begin
        inherited Create(startPos, endPos, line, kind);
        _left := left;
    end;

    constructor TBinaryNode.Create(startPos, endPos, line: Int64; kind: NodeKind; left, right: TNode); 
    begin
        inherited Create(startPos, endPos, line, kind);
        _left := left; _right := right;
    end;






    // Parser /////////////////////////////////////////////////////////////////////////////////////

    constructor TParserObject.Create(fileName: string);
    begin
        lexer := TScannerObject.Create(fileName);
    end;

    destructor TParserObject.Done;
    begin
        lexer.Done();
    end;

    procedure TParserObject.Advance;
    begin
        lexer.GetNextSymbol(symbol, error);
    end;

    (* Primary Expression *)
    function TParserObject.ParsePrimaryExpression : TNode;
    begin
        case symbol._symbol of
            Identifier:     begin   
                                result := TPrimaryNode.Create(symbol._start, symbol._end, symbol._line, nk_identifier, symbol); 
                                Advance;
                            end;
            Symb_Nil:       begin   
                                result := TPrimaryNode.Create(symbol._start, symbol._end, symbol._line, nk_nil, symbol); 
                                Advance;
                            end;
            Symb_Imag:      begin   
                                result := TPrimaryNode.Create(symbol._start, symbol._end, symbol._line, nk_imag, symbol); 
                                Advance;
                            end;
            Symb_True:      begin   
                                result := TPrimaryNode.Create(symbol._start, symbol._end, symbol._line, nk_true, symbol); 
                                Advance;
                            end;
            Symb_False:     begin   
                                result := TPrimaryNode.Create(symbol._start, symbol._end, symbol._line, nk_false, symbol); 
                                Advance;
                            end;
            Symb_Self:      begin   
                                result := TPrimaryNode.Create(symbol._start, symbol._end, symbol._line, nk_self, symbol); 
                                Advance;
                            end;
            Symb_Result:    begin   
                                result := TPrimaryNode.Create(symbol._start, symbol._end, symbol._line, nk_result, symbol); 
                                Advance;
                            end;
            Symb_Number:    begin   
                                result := TPrimaryNode.Create(symbol._start, symbol._end, symbol._line, nk_number, symbol); 
                                Advance;
                            end;
            Symb_Character: begin   
                                result := TPrimaryNode.Create(symbol._start, symbol._end, symbol._line, nk_character, symbol); 
                                Advance;
                            end;
            Symb_String:     begin   
                                result := TPrimaryNode.Create(symbol._start, symbol._end, symbol._line, nk_string, symbol); 
                                Advance;
                            end;
           

            else
        end;
    end;

    (* Unary Expression *)
    function TParserObject.ParseUnaryExpression : TNode;
    begin
        result := ParseFactorExpression();
    end;

    (* Factor Expression *)
    function TParserObject.ParseFactorExpression : TNode;
    var
        right: TNode;
        start, line: Int64;
        node: TSyntaxNode;
    begin
        start := symbol._start; line := symbol._line;
        
        case symbol._symbol of
            Symb_Plus:
                        begin
                            Advance;
                            right := ParseFactorExpression;
                            result := TUnaryNode.Create(start, symbol._start, line, nk_unary_plus, right);
                        end;
            Symb_Minus: begin
                            Advance;
                            right := ParseFactorExpression;
                            result := TUnaryNode.Create(start, symbol._start, line, nk_unary_minus, right);
                        end;
            Symb_Not:   begin
                            Advance;
                            right := ParseFactorExpression;
                            result := TUnaryNode.Create(start, symbol._start, line, nk_unary_not, right);
                        end;
            else result := ParseUnaryExpression;
        end;
    end;

    (* Parse Term Expression *)
    function TParserObject.ParseTermExpression : TNode;
    var
        left, right: TNode;
        start, line: Int64;
    begin
        start := symbol._start; line := symbol._line;
        left := ParseFactorExpression;

        while symbol._symbol in [ Symb_Times, Symb_Slash, Symb_Div, Symb_Mod, Symb_And, Symb_DotTimes, Symb_DotSlash, Symb_Backslash, Symb_TimesTimes, Symb_PlusTimes ] do
            begin
                case symbol._symbol of
                    Symb_Times:     begin
                                        Advance;
                                        right := ParseFactorExpression;
                                        left := TBinaryNode.Create(start, symbol._end, line, nk_times, left, right);
                                    end;
                    Symb_slash:     begin
                                        Advance;
                                        right := ParseFactorExpression;
                                        left := TBinaryNode.Create(start, symbol._end, line, nk_slash, left, right);
                                    end;
                    Symb_Div:       begin
                                        Advance;
                                        right := ParseFactorExpression;
                                        left := TBinaryNode.Create(start, symbol._end, line, nk_div, left, right);
                                    end;
                    Symb_Mod:       begin
                                        Advance;
                                        right := ParseFactorExpression;
                                        left := TBinaryNode.Create(start, symbol._end, line, nk_mod, left, right);
                                    end;
                    Symb_And:       begin
                                        Advance;
                                        right := ParseFactorExpression;
                                        left := TBinaryNode.Create(start, symbol._end, line, nk_and, left, right);
                                    end;
                    Symb_DotTimes:  begin
                                        Advance;
                                        right := ParseFactorExpression;
                                        left := TBinaryNode.Create(start, symbol._end, line, nk_dot_times, left, right);
                                    end;
                    Symb_DotSlash:  begin
                                        Advance;
                                        right := ParseFactorExpression;
                                        left := TBinaryNode.Create(start, symbol._end, line, nk_dot_slash, left, right);
                                    end;
                    Symb_BackSlash: begin
                                        Advance;
                                        right := ParseFactorExpression;
                                        left := TBinaryNode.Create(start, symbol._end, line, nk_back_slash, left, right);
                                    end;
                    Symb_TimesTimes:begin
                                        Advance;
                                        right := ParseFactorExpression;
                                        left := TBinaryNode.Create(start, symbol._end, line, nk_times_times, left, right);
                                    end;
                    Symb_PlusTimes:begin
                                        Advance;
                                        right := ParseFactorExpression;
                                        left := TBinaryNode.Create(start, symbol._end, line, nk_plus_times, left, right);
                                    end;
                end;
            end;

        result := left;
    end;

end.
