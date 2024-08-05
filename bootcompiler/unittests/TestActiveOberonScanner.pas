unit TestActiveOberonScanner;

{$mode objfpc}{$H+}

interface

uses

  TestFramework;

type
  
  TTestCaseFirst = class(TTestCase)
    published
          
      procedure TestNoError;
          
  end;


procedure RegisterTests;


implementation

uses

  SysUtils;


{ here we register all our test classes }
procedure RegisterTests;
begin
  TestFramework.RegisterTest(TTestCaseFirst.Suite);
end;

{ TTestCaseFirst }


procedure TTestCaseFirst.TestNoError;
begin
  Check(1 + 1 = 2, 'Catastrophic arithmetic failure!');
end;



end.

(* 
  Check(x / y = 0, 'Failed on 1');
  CheckEquals('Hello', s, 'Failed CheckEquals');

  procedure TTestCaseFirst.TestNoError;
  begin
    Check(1 + 1 = 2, 'Catastrophic arithmetic failure!');
  end;

*)