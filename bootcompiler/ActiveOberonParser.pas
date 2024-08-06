
unit ActiveOberonParser;

{$mode objfpc}{$H+}

interface

uses
    ActiveOberonScanner;

const

    (* Abstract Syntax Three node types *)
    nk_none = 0; nk_identifier = 1; nk_nil = 2; nk_imag = 3; nk_true = 4; nk_false = 5; nk_self = 6; nk_result = 7; 
    nk_address = 8; nk_address_of = 9; nk_size = 10; nk_size_of = 11; nk_alias = 12; nk_number = 13; nk_character = 14;
    nk_string = 15;

type

    // Abstract Syntax Tree nodes /////////////////////////////////////////////////////////////////

    NodeKind = Int64;

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
    end;


implementation

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
        result := TNode.Create(0, 0, 0, nk_none);
    end;


end.
