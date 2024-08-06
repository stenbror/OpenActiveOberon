program TestActiveOberonCompiler;

{$mode objfpc}{$H+}

uses

  Classes,
  TextTestRunner,
  TestFramework,
  TestActiveOberonScanner,
  TestActiveOberonParser;

  procedure RegisterTests;
  begin
    TestFramework.RegisterTest(TTestActiveOberonScanner.Suite);
    TestFramework.RegisterTest(TTestActiveOberonParser.Suite);
  end;

begin
  
  RegisterTests;

  RunRegisteredTests;

end.