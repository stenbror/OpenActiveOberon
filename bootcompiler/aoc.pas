program test;

{$mode objfpc}{$H+}

uses
   crt, ActiveOberonScanner, ActiveOberonParser;

   var 
      parser: TParserObject;
      symbol: ActiveOberonScanner.Symbol;


begin

   (* Compiler header *)
   Writeln();
   TextColor(LightGreen);
   Write(' Active Oberon (2019 Version)');
   NormVideo;
   Writeln(', version 0.1.0 [Build: 20240804]');
   Writeln('');


   parser := TParserObject.Create('/home/stenbror/OpenActiveOberon/bin/test.pas');

end.