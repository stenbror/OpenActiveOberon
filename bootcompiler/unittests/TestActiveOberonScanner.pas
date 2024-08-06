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
      procedure TestOperatorLeftBracket;
      procedure TestOperatorRightBracket;
      procedure TestOperatorArrow;
      procedure TestOperatorLeftBrace;
      procedure TestOperatorRightBrace;
      procedure TestOperatorBar;
      procedure TestOperatorNot;
      procedure TestOperatorBackSlash;
      procedure TestOperatorTranspose;
      procedure TestOperatorQuestionMark;
      procedure TestOperatorQuestionMarks;
      procedure TestOperatorExplanationMark;
      procedure TestOperatorExplanationMarks;
          
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
  CheckEquals(Symb_Unequal, symbol._symbol, 'Expecting: #');
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
  CheckEquals(Symb_And, symbol._symbol, 'Expecting: &');
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
  CheckEquals(Symb_LeftParenthesis, symbol._symbol, 'Expecting: (');
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
  CheckEquals(Symb_RightParenthesis, symbol._symbol, 'Expecting: )');
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
  CheckEquals(Symb_TimesTimes, symbol._symbol, 'Expecting: )');
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
  CheckEquals(Symb_Times, symbol._symbol, 'Expecting: *');
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
  CheckEquals(Symb_PlusTimes, symbol._symbol, 'Expecting: +*');
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
  CheckEquals(Symb_Plus, symbol._symbol, 'Expecting: +');
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
  CheckEquals(Symb_Comma, symbol._symbol, 'Expecting: ,');
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
  CheckEquals(Symb_Minus, symbol._symbol, 'Expecting: -');
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
  CheckEquals(Symb_Period, symbol._symbol, 'Expecting: .');
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
  CheckEquals(Symb_Upto, symbol._symbol, 'Expecting: ..');
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
  CheckEquals(Symb_DotEqual, symbol._symbol, 'Expecting: .=');
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
  CheckEquals(Symb_DotUnEqual, symbol._symbol, 'Expecting: .#');
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
  CheckEquals(Symb_DotGreaterEqual, symbol._symbol, 'Expecting: .>=');
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
  CheckEquals(Symb_DotGreater, symbol._symbol, 'Expecting: .>');
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
  CheckEquals(Symb_DotLessEqual, symbol._symbol, 'Expecting: .<=');
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
  CheckEquals(Symb_DotLess, symbol._symbol, 'Expecting: .<');
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
  CheckEquals(Symb_Slash, symbol._symbol, 'Expecting: /');
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
  CheckEquals(Symb_Becomes, symbol._symbol, 'Expecting: :=');
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
  CheckEquals(Symb_Colon, symbol._symbol, 'Expecting: :');
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
  CheckEquals(Symb_SemiColon, symbol._symbol, 'Expecting: :');
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
  CheckEquals(Symb_Equal, symbol._symbol, 'Expecting: =');
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
  CheckEquals(Symb_Less, symbol._symbol, 'Expecting: <');
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
  CheckEquals(Symb_LessLess, symbol._symbol, 'Expecting: <<');
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
  CheckEquals(Symb_LessLessQ, symbol._symbol, 'Expecting: <<?');
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
  CheckEquals(Symb_LessEqual, symbol._symbol, 'Expecting: <=');
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
  CheckEquals(Symb_Greater, symbol._symbol, 'Expecting: >');
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
  CheckEquals(Symb_GreaterGreater, symbol._symbol, 'Expecting: >>');
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
  CheckEquals(Symb_GreaterGreaterQ, symbol._symbol, 'Expecting: >>?');
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
  CheckEquals(Symb_GreaterEqual, symbol._symbol, 'Expecting: >=');
  scanner.Done();
end;

(* UnitTest: [ *)
procedure TTestActiveOberonScanner.TestOperatorLeftBracket;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_left_bracket.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_LeftBracket, symbol._symbol, 'Expecting: [');
  scanner.Done();
end;

(* UnitTest: ] *)
procedure TTestActiveOberonScanner.TestOperatorRightBracket;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_right_bracket.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_RightBracket, symbol._symbol, 'Expecting: ]');
  scanner.Done();
end;

(* UnitTest: { *)
procedure TTestActiveOberonScanner.TestOperatorLeftBrace;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_left_brace.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_LeftBrace, symbol._symbol, 'Expecting: {');
  scanner.Done();
end;

(* UnitTest: } *)
procedure TTestActiveOberonScanner.TestOperatorRightBrace;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_right_brace.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_RightBrace, symbol._symbol, 'Expecting: }');
  scanner.Done();
end;

(* UnitTest: ^ *)
procedure TTestActiveOberonScanner.TestOperatorArrow;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_arrow.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Arrow, symbol._symbol, 'Expecting: ^');
  scanner.Done();
end;

(* UnitTest: | *)
procedure TTestActiveOberonScanner.TestOperatorBar;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_bar.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Bar, symbol._symbol, 'Expecting: |');
  scanner.Done();
end;

(* UnitTest: ~ *)
procedure TTestActiveOberonScanner.TestOperatorNot;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_not.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Not, symbol._symbol, 'Expecting: ~');
  scanner.Done();
end;

(* UnitTest: \ *)
procedure TTestActiveOberonScanner.TestOperatorBackSlash;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_backslash.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Backslash, symbol._symbol, 'Expecting: \');
  scanner.Done();
end;

(* UnitTest: ` *)
procedure TTestActiveOberonScanner.TestOperatorTranspose;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_transpose.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Transpose, symbol._symbol, 'Expecting: `');
  scanner.Done();
end;

(* UnitTest: ? *)
procedure TTestActiveOberonScanner.TestOperatorQuestionMark;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_questionmark.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Questionmark, symbol._symbol, 'Expecting: ?');
  scanner.Done();
end;

(* UnitTest: ?? *)
procedure TTestActiveOberonScanner.TestOperatorQuestionMarks;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_questionmarks.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Questionmarks, symbol._symbol, 'Expecting: ??');
  scanner.Done();
end;

(* UnitTest: ! *)
procedure TTestActiveOberonScanner.TestOperatorExplanationMark;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_explanationmark.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_ExclamationMark, symbol._symbol, 'Expecting: !');
  scanner.Done();
end;

(* UnitTest: !! *)
procedure TTestActiveOberonScanner.TestOperatorExplanationMarks;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/operator_explanationmarks.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_ExclamationMarks, symbol._symbol, 'Expecting: !!');
  scanner.Done();
end;

end.