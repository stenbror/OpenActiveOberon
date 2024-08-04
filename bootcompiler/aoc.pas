program test;

uses
   ActiveOberonScanner, ActiveOberonParser;

   var scanner: TScannerObject;

begin
Writeln();
Writeln(' Active Oberon (2019 Version), version 0.1.0 [Build: 20240804]');
Writeln('');

scanner.Create('test.pas');

end.