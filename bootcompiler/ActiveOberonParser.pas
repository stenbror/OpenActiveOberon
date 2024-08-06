
unit ActiveOberonParser;

{$mode objfpc}{$H+}

interface

uses
    ActiveOberonScanner;

type 

    TParserObject = class
        lexer: TScannerObject;
        symbol: ActiveOberonScanner.Symbol;
        error: Boolean;
        constructor Create(fileName: string);
        destructor Done;
        procedure Advance;
    end;


implementation

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


end.

