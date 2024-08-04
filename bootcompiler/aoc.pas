program test;

uses
   ActiveOberonScanner, ActiveOberonParser;

   var 
      scanner: TScannerObject;
      symbol: ActiveOberonScanner.Symbol;
      error: Boolean;

begin
Writeln();
Writeln(' Active Oberon (2019 Version), version 0.1.0 [Build: 20240804]');
Writeln('');

scanner := TScannerObject.Create('/home/stenbror/OpenActiveOberon/bin/test.pas');

if scanner = nil then Writeln('NIL!'); 
scanner.GetNextSymbol(symbol, error);

Write('Symbol:  '); Writeln(symbol._symbol);

scanner.GetNextSymbol(symbol, error);

Write('Symbol:  '); Writeln(symbol._symbol);

end.