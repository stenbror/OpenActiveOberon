program test;

{$mode objfpc}{$H+}

uses
   crt, ActiveOberonScanner, ActiveOberonParser;

   var 
      scanner: TScannerObject;
      symbol: ActiveOberonScanner.Symbol;
      error: Boolean;

begin

   (* Compiler header *)
   Writeln();
   TextColor(LightGreen);
   Write(' Active Oberon (2019 Version)');
   NormVideo;
   Writeln(', version 0.1.0 [Build: 20240804]');
   Writeln('');


   (* Test code . Temporary *)
   scanner := TScannerObject.Create('/home/stenbror/OpenActiveOberon/bin/test.pas');

   if scanner = nil then Writeln('NIL!'); 
   scanner.GetNextSymbol(symbol, error);

   Write('Symbol:  '); Writeln(symbol._symbol);

   scanner.GetNextSymbol(symbol, error);

   Write('Symbol:  '); Writeln(symbol._symbol); Writeln(symbol._Identifier)

end.