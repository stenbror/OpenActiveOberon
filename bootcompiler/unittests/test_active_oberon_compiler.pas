program TestActiveOberonCompiler;

{$mode objfpc}{$H+}

uses

  Classes,
  TextTestRunner,
  TestActiveOberonScanner;

begin
  
  TestActiveOberonScanner.RegisterTests;

  RunRegisteredTests;

end.