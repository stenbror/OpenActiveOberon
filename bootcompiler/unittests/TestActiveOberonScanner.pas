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

      procedure TestKeywordCell;
      procedure TestKeywordCellNet;
      procedure TestKeywordAwait;
      procedure TestKeywordBegin;
      procedure TestKeywordBy;
      procedure TestKeywordConst;
      procedure TestKeywordCase;
      procedure TestKeywordCode;
      procedure TestKeywordDefinition;
      procedure TestKeywordDo;
      procedure TestKeywordDiv;
      procedure TestKeywordEnd;
      procedure TestKeywordEnum;
      procedure TestKeywordElse;
      procedure TestKeywordElsif;
      procedure TestKeywordExit;
      procedure TestKeywordExtern;
      procedure TestKeywordFalse;
      procedure TestKeywordFor;
      procedure TestKeywordFinally;
      procedure TestKeywordIf;
      procedure TestKeywordImag;
      procedure TestKeywordIn;
      procedure TestKeywordIs;
      procedure TestKeywordImport;
      procedure TestKeywordLoop;
      procedure TestKeywordModule;
      procedure TestKeywordMod;
      procedure TestKeywordNil;
      procedure TestKeywordOf;
      procedure TestKeywordOr;
      procedure TestKeywordOut;
      procedure TestKeywordOperator;
      procedure TestKeywordProcedure;
      procedure TestKeywordPort;
      procedure TestKeywordRepeat;
      procedure TestKeywordReturn;
      procedure TestKeywordSelf;
      procedure TestKeywordResult;
      procedure TestKeywordThen;
      procedure TestKeywordTrue;
      procedure TestKeywordTo;
      procedure TestKeywordType;
      procedure TestKeywordUntil;
      procedure TestKeywordVar;
      procedure TestKeywordWhile;
      procedure TestKeywordWith;
      procedure TestKeywordArray;
      procedure TestKeywordObject;
      procedure TestKeywordPointer;
      procedure TestKeywordRecord;
      procedure TestKeywordAddress;
      procedure TestKeywordSize;
      procedure TestKeywordAlias;
          
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

(* UnitTest: cell *)
procedure TTestActiveOberonScanner.TestKeywordCell;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_cell.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Cell, symbol._symbol, 'Expecting: cell');
  scanner.Done();
end;

(* UnitTest: cellnet *)
procedure TTestActiveOberonScanner.TestKeywordCellNet;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_cellnet.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_CellNet, symbol._symbol, 'Expecting: cellnet');
  scanner.Done();
end;

(* UnitTest: await *)
procedure TTestActiveOberonScanner.TestKeywordAwait;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_await.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Await, symbol._symbol, 'Expecting: await');
  scanner.Done();
end;

(* UnitTest: begin *)
procedure TTestActiveOberonScanner.TestKeywordBegin;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_begin.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Begin, symbol._symbol, 'Expecting: begin');
  scanner.Done();
end;

(* UnitTest: by *)
procedure TTestActiveOberonScanner.TestKeywordBy;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_by.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_By, symbol._symbol, 'Expecting: by');
  scanner.Done();
end;

(* UnitTest: const *)
procedure TTestActiveOberonScanner.TestKeywordConst;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_const.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Const, symbol._symbol, 'Expecting: const');
  scanner.Done();
end;

(* UnitTest: case *)
procedure TTestActiveOberonScanner.TestKeywordCase;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_case.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Case, symbol._symbol, 'Expecting: case');
  scanner.Done();
end;

(* UnitTest: code *)
procedure TTestActiveOberonScanner.TestKeywordCode;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_code.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Code, symbol._symbol, 'Expecting: code');
  scanner.Done();
end;

(* UnitTest: definition *)
procedure TTestActiveOberonScanner.TestKeywordDefinition;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_definition.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Definition, symbol._symbol, 'Expecting: definition');
  scanner.Done();
end;

(* UnitTest: do *)
procedure TTestActiveOberonScanner.TestKeywordDo;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_do.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Do, symbol._symbol, 'Expecting: do');
  scanner.Done();
end;

(* UnitTest: div *)
procedure TTestActiveOberonScanner.TestKeywordDiv;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_div.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Div, symbol._symbol, 'Expecting: div');
  scanner.Done();
end;

(* UnitTest: end *)
procedure TTestActiveOberonScanner.TestKeywordEnd;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_end.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_End, symbol._symbol, 'Expecting: end');
  scanner.Done();
end;

(* UnitTest: enum *)
procedure TTestActiveOberonScanner.TestKeywordEnum;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_enum.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Enum, symbol._symbol, 'Expecting: enum');
  scanner.Done();
end;

(* UnitTest: else *)
procedure TTestActiveOberonScanner.TestKeywordElse;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_else.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Else, symbol._symbol, 'Expecting: ');
  scanner.Done();
end;

(* UnitTest: elsif *)
procedure TTestActiveOberonScanner.TestKeywordElsif;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_elsif.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Elsif, symbol._symbol, 'Expecting: elsif');
  scanner.Done();
end;

(* UnitTest: exit *)
procedure TTestActiveOberonScanner.TestKeywordExit;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_exit.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Exit, symbol._symbol, 'Expecting: exit');
  scanner.Done();
end;

(* UnitTest: extern *)
procedure TTestActiveOberonScanner.TestKeywordExtern;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_extern.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Extern, symbol._symbol, 'Expecting: extern');
  scanner.Done();
end;

(* UnitTest: false *)
procedure TTestActiveOberonScanner.TestKeywordFalse;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_false.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_False, symbol._symbol, 'Expecting: false');
  scanner.Done();
end;

(* UnitTest: for *)
procedure TTestActiveOberonScanner.TestKeywordFor;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_for.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_For, symbol._symbol, 'Expecting: for');
  scanner.Done();
end;

(* UnitTest: finally *)
procedure TTestActiveOberonScanner.TestKeywordFinally;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_finally.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Finally, symbol._symbol, 'Expecting: finally');
  scanner.Done();
end;

(* UnitTest: if *)
procedure TTestActiveOberonScanner.TestKeywordIf;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_if.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_If, symbol._symbol, 'Expecting: if');
  scanner.Done();
end;

(* UnitTest: imag *)
procedure TTestActiveOberonScanner.TestKeywordImag;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_imag.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Imag, symbol._symbol, 'Expecting: imag');
  scanner.Done();
end;

(* UnitTest: in *)
procedure TTestActiveOberonScanner.TestKeywordIn;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_in.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_In, symbol._symbol, 'Expecting: in');
  scanner.Done();
end;

(* UnitTest: is *)
procedure TTestActiveOberonScanner.TestKeywordIs;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_is.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Is, symbol._symbol, 'Expecting: is');
  scanner.Done();
end;

(* UnitTest: import *)
procedure TTestActiveOberonScanner.TestKeywordImport;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_import.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Import, symbol._symbol, 'Expecting: import');
  scanner.Done();
end;

(* UnitTest: loop *)
procedure TTestActiveOberonScanner.TestKeywordLoop;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_loop.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Loop, symbol._symbol, 'Expecting: loop');
  scanner.Done();
end;

(* UnitTest: module *)
procedure TTestActiveOberonScanner.TestKeywordModule;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_module.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Module, symbol._symbol, 'Expecting: module');
  scanner.Done();
end;

(* UnitTest: mod *)
procedure TTestActiveOberonScanner.TestKeywordMod;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_mod.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Mod, symbol._symbol, 'Expecting: mod');
  scanner.Done();
end;

(* UnitTest: nil *)
procedure TTestActiveOberonScanner.TestKeywordNil;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_nil.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Nil, symbol._symbol, 'Expecting: nil');
  scanner.Done();
end;

(* UnitTest: of *)
procedure TTestActiveOberonScanner.TestKeywordOf;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_of.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Of, symbol._symbol, 'Expecting: of');
  scanner.Done();
end;

(* UnitTest: or *)
procedure TTestActiveOberonScanner.TestKeywordOr;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_or.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Or, symbol._symbol, 'Expecting: or');
  scanner.Done();
end;

(* UnitTest: out *)
procedure TTestActiveOberonScanner.TestKeywordOut;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_out.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Out, symbol._symbol, 'Expecting: out');
  scanner.Done();
end;

(* UnitTest: operator *)
procedure TTestActiveOberonScanner.TestKeywordOperator;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_operator.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Operator, symbol._symbol, 'Expecting: operator');
  scanner.Done();
end;

(* UnitTest: procedure *)
procedure TTestActiveOberonScanner.TestKeywordProcedure;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_procedure.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Procedure, symbol._symbol, 'Expecting: procedure');
  scanner.Done();
end;

(* UnitTest: port *)
procedure TTestActiveOberonScanner.TestKeywordPort;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_port.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Port, symbol._symbol, 'Expecting: port');
  scanner.Done();
end;

(* UnitTest: repeat *)
procedure TTestActiveOberonScanner.TestKeywordRepeat;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_repeat.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Repeat, symbol._symbol, 'Expecting: repeat');
  scanner.Done();
end;

(* UnitTest: return *)
procedure TTestActiveOberonScanner.TestKeywordReturn;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_return.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Return, symbol._symbol, 'Expecting: return');
  scanner.Done();
end;

(* UnitTest: self *)
procedure TTestActiveOberonScanner.TestKeywordSelf;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_self.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Self, symbol._symbol, 'Expecting: self');
  scanner.Done();
end;

(* UnitTest: result *)
procedure TTestActiveOberonScanner.TestKeywordResult;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_result.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Result, symbol._symbol, 'Expecting: result');
  scanner.Done();
end;

(* UnitTest: then *)
procedure TTestActiveOberonScanner.TestKeywordThen;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_then.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Then, symbol._symbol, 'Expecting: then');
  scanner.Done();
end;

(* UnitTest: true *)
procedure TTestActiveOberonScanner.TestKeywordTrue;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_true.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_True, symbol._symbol, 'Expecting: true');
  scanner.Done();
end;

(* UnitTest: to *)
procedure TTestActiveOberonScanner.TestKeywordTo;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_to.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_To, symbol._symbol, 'Expecting: to');
  scanner.Done();
end;

(* UnitTest: type *)
procedure TTestActiveOberonScanner.TestKeywordType;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_type.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Type, symbol._symbol, 'Expecting: type');
  scanner.Done();
end;

(* UnitTest: until *)
procedure TTestActiveOberonScanner.TestKeywordUntil;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_until.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Until, symbol._symbol, 'Expecting: until');
  scanner.Done();
end;

(* UnitTest: var *)
procedure TTestActiveOberonScanner.TestKeywordVar;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_var.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Var, symbol._symbol, 'Expecting: var');
  scanner.Done();
end;

(* UnitTest: while *)
procedure TTestActiveOberonScanner.TestKeywordWhile;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_while.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_While, symbol._symbol, 'Expecting: while');
  scanner.Done();
end;

(* UnitTest: with *)
procedure TTestActiveOberonScanner.TestKeywordWith;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_with.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_With, symbol._symbol, 'Expecting: with');
  scanner.Done();
end;

(* UnitTest: array *)
procedure TTestActiveOberonScanner.TestKeywordArray;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_array.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Array, symbol._symbol, 'Expecting: array');
  scanner.Done();
end;

(* UnitTest: object *)
procedure TTestActiveOberonScanner.TestKeywordObject;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_object.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Object, symbol._symbol, 'Expecting: object');
  scanner.Done();
end;

(* UnitTest: pointer *)
procedure TTestActiveOberonScanner.TestKeywordPointer;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_pointer.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Pointer, symbol._symbol, 'Expecting: pointer');
  scanner.Done();
end;

(* UnitTest: record *)
procedure TTestActiveOberonScanner.TestKeywordRecord;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_record.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Record, symbol._symbol, 'Expecting: record');
  scanner.Done();
end;

(* UnitTest: address *)
procedure TTestActiveOberonScanner.TestKeywordAddress;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_address.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Address, symbol._symbol, 'Expecting: address');
  scanner.Done();
end;

(* UnitTest: size *)
procedure TTestActiveOberonScanner.TestKeywordSize;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_size.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Size, symbol._symbol, 'Expecting: size');
  scanner.Done();
end;

(* UnitTest: alias *)
procedure TTestActiveOberonScanner.TestKeywordAlias;
var 
    scanner: TScannerObject;
    symbol: ActiveOberonScanner.Symbol;
    error: Boolean;

begin
  scanner := TScannerObject.Create('bootcompiler/unittests/data/keyword_alias.mod');
  scanner.GetNextSymbol(symbol, error);
  CheckEquals(Symb_Alias, symbol._symbol, 'Expecting: alias');
  scanner.Done();
end;

end.