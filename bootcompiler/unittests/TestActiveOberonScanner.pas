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
      procedure TestOperatorPeriod;
      procedure TestOperatorUpto;
      procedure TestOperatorDotEqual;
      procedure TestOperatorDotUnEqual;
      procedure TestOperatorDotGreaterEqual;
      procedure TestOperatorDotGreater;
      procedure TestOperatorDotLessEqual;
      procedure TestOperatorDotLess;
      procedure TestOperatorBecomes;
      procedure TestOperatorSlash;
      procedure TestOperatorColon;
      procedure TestOperatorSemiColon;
      procedure TestOperatorEqual;
      procedure TestOperatorLess;
      procedure TestOperatorLessEqual;
      procedure TestOperatorLessLess;
      procedure TestOperatorLessLessQ;
      procedure TestOperatorGreater;
      procedure TestOperatorGreaterEqual;
      procedure TestOperatorGreaterGreater;
      procedure TestOperatorGreaterGreaterQ;
          
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

(* UnitTest: . *)
procedure TTestActiveOberonScanner.TestOperatorPeriod;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_period.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Period, 'Expecting: .');
  scanner.Done();
end;

(* UnitTest: .. *)
procedure TTestActiveOberonScanner.TestOperatorUpto;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_upto.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Upto, 'Expecting: ..');
  scanner.Done();
end;

(* UnitTest: .= *)
procedure TTestActiveOberonScanner.TestOperatorDotEqual;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_dot_equal.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_DotEqual, 'Expecting: .=');
  scanner.Done();
end;

(* UnitTest: .# *)
procedure TTestActiveOberonScanner.TestOperatorDotUnEqual;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_dot_unequal.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_DotUnEqual, 'Expecting: .#');
  scanner.Done();
end;

(* UnitTest: .>= *)
procedure TTestActiveOberonScanner.TestOperatorDotGreaterEqual;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_dot_greater_equal.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_DotGreaterEqual, 'Expecting: .>=');
  scanner.Done();
end;

(* UnitTest: .> *)
procedure TTestActiveOberonScanner.TestOperatorDotGreater;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_dot_greater.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_DotGreater, 'Expecting: .>');
  scanner.Done();
end;

(* UnitTest: .<= *)
procedure TTestActiveOberonScanner.TestOperatorDotLessEqual;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_dot_less_equal.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_DotLessEqual, 'Expecting: .<=');
  scanner.Done();
end;

(* UnitTest: .< *)
procedure TTestActiveOberonScanner.TestOperatorDotLess;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_dot_less.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_DotLess, 'Expecting: .<');
  scanner.Done();
end;

(* UnitTest: / *)
procedure TTestActiveOberonScanner.TestOperatorSlash;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_slash.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Slash, 'Expecting: /');
  scanner.Done();
end;

(* UnitTest: := *)
procedure TTestActiveOberonScanner.TestOperatorBecomes;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_becomes.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Becomes, 'Expecting: :=');
  scanner.Done();
end;

(* UnitTest: : *)
procedure TTestActiveOberonScanner.TestOperatorColon;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_colon.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Colon, 'Expecting: :');
  scanner.Done();
end;

(* UnitTest: ; *)
procedure TTestActiveOberonScanner.TestOperatorSemiColon;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_semicolon.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_SemiColon, 'Expecting: :');
  scanner.Done();
end;

(* UnitTest: = *)
procedure TTestActiveOberonScanner.TestOperatorEqual;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_equal.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Equal, 'Expecting: =');
  scanner.Done();
end;

(* UnitTest: < *)
procedure TTestActiveOberonScanner.TestOperatorLess;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_less.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Less, 'Expecting: <');
  scanner.Done();
end;

(* UnitTest: << *)
procedure TTestActiveOberonScanner.TestOperatorLessLess;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_lessless.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_LessLess, 'Expecting: <<');
  scanner.Done();
end;

(* UnitTest: <<? *)
procedure TTestActiveOberonScanner.TestOperatorLessLessQ;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_lesslessQ.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_LessLessQ, 'Expecting: <<?');
  scanner.Done();
end;

(* UnitTest: <= *)
procedure TTestActiveOberonScanner.TestOperatorLessEqual;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_less_equal.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_LessEqual, 'Expecting: <=');
  scanner.Done();
end;

(* UnitTest: > *)
procedure TTestActiveOberonScanner.TestOperatorGreater;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_greater.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_Greater, 'Expecting: >');
  scanner.Done();
end;

(* UnitTest: >> *)
procedure TTestActiveOberonScanner.TestOperatorGreaterGreater;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_greatergreater.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_GreaterGreater, 'Expecting: >>');
  scanner.Done();
end;

(* UnitTest: >>? *)
procedure TTestActiveOberonScanner.TestOperatorGreaterGreaterQ;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_greatergreaterQ.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_GreaterGreaterQ, 'Expecting: >>?');
  scanner.Done();
end;

(* UnitTest: <= *)
procedure TTestActiveOberonScanner.TestOperatorGreaterEqual;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_greater_equal.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(symbol._symbol, Symb_GreaterEqual, 'Expecting: >=');
  scanner.Done();
end;

end.