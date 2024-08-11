
unit ActiveOberonParser;

{$mode objfpc}{$H+}

interface

uses
    SysUtils, Generics.Collections, ActiveOberonScanner;

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

    TAttributeName = specialize TArray<string>;

    TAttributeEntry = specialize TPair<TAttributeName, string>;
    PAttributeEntry = ^TAttributeEntry;

    TSyntaxNodeClass = class of TSyntaxNode;

    TSyntaxNode = class
        private
            _col, _line: Int64;
            _kind: NodeKind;
            _parent: TSyntaxNode;
            _childNodes: specialize TArray<TSyntaxNode>;
            _attributes: specialize TArray<TAttributeEntry>;
            _hasChildren: Boolean;
            _fileName: string;

        
            function TryGetAttributeEntry(const key: TAttributeName; var attributeEntry: PAttributeEntry): Boolean;
            function GetHasAttributes: Boolean;

        public
            constructor Create(nodeKind: NodeKind);
            destructor Destroy; override;
            function Clone: TSyntaxNode; virtual;
            procedure AssignPositionFrom(const node: TSyntaxNode);

            function AddChild(node: TSyntaxNode) : TSyntaxNode; overload;
            procedure DeleteChild(node: TSyntaxNode);
            procedure ExtractChild(node: TSyntaxNode);
            function FindChild(kind: NodeKind) : TSyntaxNode; overload;

            function GetAttribute(const key: TAttributeName): string;
            function HasAttribute(const key: TAttributeName): Boolean;
            procedure SetAttribute(const key: TAttributeName; const value: string);
            procedure ClearAttributes;

            property Kind: Int64 read _kind;
            property Col: Int64 read _col write _col;
            property Line: Int64 read _line write _line;
            property Parent: TSyntaxNode read _parent;
            property ChildNodes: specialize TArray<TSyntaxNode> read _childNodes;
            property Attributes: specialize TArray<TAttributeEntry> read _attributes;
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

    
    TParserObject = class
        lexer: TScannerObject;
        symbol: ActiveOberonScanner.Symbol;
        error: Boolean;
        constructor Create(fileName: string);
        destructor Done;
        procedure Advance;

        (* Expression rules *)
        function ParsePrimaryExpression : TSyntaxNode;
        function ParseUnaryExpression : TSyntaxNode;
        function ParseFactorExpression : TSyntaxNode;
        function ParseTermExpression : TSyntaxNode;
    end;


implementation

    { TSyntaxNode }

    function TSyntaxNode.AddChild(node: TSyntaxNode): TSyntaxNode;
    begin
        Assert(Assigned(node));

        SetLength(_childNodes, Length(_childNodes) + 1);
        _childNodes[Length(_childNodes) - 1] := node;

        node._parent := Self;

        Result := node;
    end;

    procedure TSyntaxNode.SetAttribute(const key: TAttributeName; const value: string);
    var
        attributeEntry: PAttributeEntry;
        len: Int64;
    begin
        if not TryGetAttributeEntry(key, attributeEntry) then
        begin
            len := Length(_attributes);
            SetLength(_attributes, len + 1);
            attributeEntry := @_attributes[len];
            AttributeEntry^.key := key;
        end;
        AttributeEntry^.Value := value;
    end; 

    function TSyntaxNode.TryGetAttributeEntry(const key: TAttributeName; var attributeEntry: PAttributeEntry): boolean;
        var
            i: Int64;
        begin
            for i := 0 to High(_attributes) do
                if _attributes[i].Key = Key then
                begin
                attributeEntry := @_attributes[i];
                Exit(True);
            end;

        Result := False;
    end;

    function TSyntaxNode.GetAttribute(const key: TAttributeName): string;
    var
        attributeEntry: PAttributeEntry;
    begin
        if TryGetAttributeEntry(key, attributeEntry) then
            Result := attributeEntry^.Value
        else
            Result := '';
    end;
    

    function TSyntaxNode.GetHasAttributes: Boolean;
    begin
        Result := Length(_attributes) > 0;
    end;
    
    procedure TSyntaxNode.ClearAttributes;
    begin
        SetLength(_attributes, 0);
    end;

    function TSyntaxNode.HasAttribute(const key: TAttributeName): Boolean;
    var
        attributeEntry: PAttributeEntry;
    begin
        Result := TryGetAttributeEntry(key, attributeEntry);
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

            Result._attributes := Copy(_attributes);
            Result.AssignPositionFrom(Self);
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

    procedure TSyntaxNode.AssignPositionFrom(const Node: TSyntaxNode);
    begin
        _col := node._col;
        _line := node._line;
        _fileName := node._fileName;
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


    





    { TParserObject }

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
    function TParserObject.ParsePrimaryExpression : TSyntaxNode;
    begin
        Result := TSyntaxNode.Create(nk_none);
    end;

    (* Unary Expression *)
    function TParserObject.ParseUnaryExpression : TSyntaxNode;
    begin
        result := ParseFactorExpression();
    end;

    (* Factor Expression *)
    function TParserObject.ParseFactorExpression : TSyntaxNode;
    begin
        Result := TSyntaxNode.Create(nk_none);
    end;

    (* Parse Term Expression *)
    function TParserObject.ParseTermExpression : TSyntaxNode;
    begin
        Result := TSyntaxNode.Create(nk_none);
    end;

end.
