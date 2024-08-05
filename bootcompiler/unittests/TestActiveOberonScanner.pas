unit TestActiveOberonScanner;

{$mode objfpc}{$H+}

interface

uses

  TestFramework, ActiveOberonScanner;

type
  
  (* Test class for Scanner *)
  TTestActiveOberonScanner = class(TTestCase)
    published
      procedure TestOperatorUnEqual;
      procedure TestOperatorAnd;
      procedure TestOperatorLeftParenthesis;
      procedure TestOperatorRightParenthesis;
      procedure TestOperatorTimesTimes;
      procedure TestOperatorTimes;
      procedure TestOperatorPlusTimes;
      procedure TestOperatorPlus;
      procedure TestOperatorComma;
      procedure TestOperatorMinus;
      
          
  end;

implementation

uses

  SysUtils;

{ TTestActiveOberonScanner }

(* UnitTest: UnEqual*)
procedure TTestActiveOberonScanner.TestOperatorUnEqual;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_unequal.mod');
  scanner.GetNextSymbol(symbol, error);
  Check(symbol._symbol = Symb_Unequal, 'Expecting: #');
  scanner.Done();
end;

(* UnitTest: And*)
procedure TTestActiveOberonScanner.TestOperatorAnd;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_and.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_And, 'Expecting: &');
  scanner.Done();
end;

(* UnitTest: ( *)
procedure TTestActiveOberonScanner.TestOperatorLeftParenthesis;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_left_parenthesis.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_LeftParenthesis, 'Expecting: (');
  scanner.Done();
end;

(* UnitTest: ) *)
procedure TTestActiveOberonScanner.TestOperatorRightParenthesis;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_right_parenthesis.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_RightParenthesis, 'Expecting: )');
  scanner.Done();
end;

(* UnitTest: ** *)
procedure TTestActiveOberonScanner.TestOperatorTimesTimes;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_power.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_TimesTimes, 'Expecting: )');
  scanner.Done();
end;

(* UnitTest: ** *)
procedure TTestActiveOberonScanner.TestOperatorTimes;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_times.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Times, 'Expecting: *');
  scanner.Done();
end;

(* UnitTest: +* *)
procedure TTestActiveOberonScanner.TestOperatorPlusTimes;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_plus_mul.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_PlusTimes, 'Expecting: +*');
  scanner.Done();
end;

(* UnitTest: + *)
procedure TTestActiveOberonScanner.TestOperatorPlus;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_plus.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Plus, 'Expecting: +');
  scanner.Done();
end;

(* UnitTest: + *)
procedure TTestActiveOberonScanner.TestOperatorComma;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_comma.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Comma, 'Expecting: ,');
  scanner.Done();
end;

(* UnitTest: + *)
procedure TTestActiveOberonScanner.TestOperatorMinus;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_minus.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Minus, 'Expecting: -');
  scanner.Done();
end;

end.