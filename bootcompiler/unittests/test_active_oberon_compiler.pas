program TestActiveOberonCompiler;

{$mode objfpc}{$H+}

uses

  Classes,
  TextTestRunner,
  TestFramework,
  TestActiveOberonScanner;

  procedure RegisterTests;
  begin
    TestFramework.RegisterTest(TTestActiveOberonScanner.Suite);
  end;

begin
  
  RegisterTests;

  RunRegisteredTests;

end.