program project1;

{$mode objfpc}{$H+}

uses
  Classes,
  TextTestRunner,
  TestActiveOberonScanner;

begin
  // Register all tests
  TestActiveOberonScanner.RegisterTests;

  RunRegisteredTests;
end.