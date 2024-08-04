
unit ActiveOberonScanner;

interface

uses
    contnrs, SysUtils;

const   

    (* Symbols used between scanner and parser *)
    Symb_None = 0;
    Symb_Equal = 1; Symb_DotEqual = 2; Symb_Unequal = 3; Symb_DotUnequal = 4; Symb_Less = 5; Symb_DotLess = 6; 
	Symb_LessEqual = 7; Symb_DotLessEqual = 8; Symb_Greater = 9; Symb_DotGreater = 10; Symb_GreaterEqual = 11; Symb_DotGreaterEqual = 12; 
	Symb_LessLessQ = 13; Symb_GreaterGreaterQ = 14; Symb_Questionmarks = 15; Symb_ExclamationMarks = 16; Symb_In = 17; Symb_Is = 18; 
    Symb_Times = 19; Symb_TimesTimes = 20; Symb_DotTimes = 21; Symb_PlusTimes = 22; Symb_Slash = 23; Symb_Backslash = 24; 
	Symb_DotSlash = 25; Symb_Div = 26; Symb_Mod = 27; Symb_And = 28; 
    Symb_Or = 29; Symb_Plus = 30; Symb_Minus = 31; 
    Symb_Not = 32;
    Symb_LeftParenthesis = 33; Symb_LeftBracket = 34; Symb_LeftBrace = 35; Symb_Number = 36; Symb_Character = 37; Symb_String = 38; 
	Symb_Nil = 39; Symb_Imag = 40; Symb_True = 41; Symb_False = 42; Symb_Self = 43; Symb_Result = 44; 
	Symb_Identifier = 45; 
    Symb_If = 46; Symb_Case = 47; Symb_While = 48; Symb_Repeat = 49; Symb_For = 50; Symb_Loop = 51; 
	Symb_With = 52; Symb_Exit = 53; Symb_Await = 54; Symb_Return = 55; Symb_Begin = 56; 
    Semicolon = 57; Transpose = 58; RightBrace = 59; RightBracket = 60; RightParenthesis = 61; Questionmark = 62; 
	ExclamationMark = 63; LessLess = 64; GreaterGreater = 65; Upto = 66; Arrow = 67; Period = 68; 
	Symb_Comma = 69; Symb_Colon = 70; Symb_Of = 71; Symb_Then = 72; Symb_Do = 73; Symb_To = 74; 
	Symb_By = 75; Symb_Becomes = 76; Symb_Bar = 77; Symb_End = 78; Symb_Else = 79; Symb_Elsif = 80; 
	Symb_Until = 81; Symb_Finally = 82; 
    Symb_Code = 83; Symb_Const = 84; Symb_Type = 85; Symb_Var = 86; Symb_Out = 87; Symb_Procedure = 88; 
	Symb_Operator = 89; Symb_Import = 90; Symb_Definition = 91; Symb_Module = 92; Symb_Cell = 93; Symb_CellNet = 94; 
	Symb_Extern = 95;
    Symb_Array = 96; Symb_Object = 97; Symb_Record = 98; Symb_Pointer = 99; Symb_Enum = 100; Symb_Port = 101; 
	Symb_Address = 102; Symb_Size = 103; Symb_Alias = 104; 

type

    TKeywordObject = class
        Name: string;
        Symbol: integer;
        constructor Create(AName: string; symb: integer);
    end;

    TScannerObject = class
        Keywords: TFPHashObjectList;
        constructor Create();
        destructor Done();
    end;

implementation

    constructor TKeywordObject.Create(AName: string; symb: integer);
    begin
    Name := AName;
    Symbol := symb;
    end;

    constructor TScannerObject.Create();
    begin
        (* Initialize reserved keyword table *)
        Keywords := TFPHashObjectList.Create(True);
        Keywords.Add('cell', TKeywordObject.Create('cell', Symb_Cell));
        Keywords.Add('cellnet', TKeywordObject.Create('cellnet', Symb_Cellnet));
        Keywords.Add('await', TKeywordObject.Create('await', Symb_Cellnet));
        Keywords.Add('begin', TKeywordObject.Create('begin', Symb_Cellnet));
        Keywords.Add('by', TKeywordObject.Create('by', Symb_Cellnet));
        Keywords.Add('const', TKeywordObject.Create('const', Symb_Cellnet));
        Keywords.Add('case', TKeywordObject.Create('case', Symb_Cellnet));
        Keywords.Add('code', TKeywordObject.Create('code', Symb_Cellnet));
        Keywords.Add('definition', TKeywordObject.Create('definition', Symb_Cellnet));
        Keywords.Add('do', TKeywordObject.Create('do', Symb_Cellnet));
        Keywords.Add('div', TKeywordObject.Create('div', Symb_Cellnet));
        Keywords.Add('end', TKeywordObject.Create('end', Symb_Cellnet));
        Keywords.Add('enum', TKeywordObject.Create('enum', Symb_Cellnet));
        Keywords.Add('else', TKeywordObject.Create('else', Symb_Cellnet));
        Keywords.Add('elsif', TKeywordObject.Create('elsif', Symb_Cellnet));
        Keywords.Add('exit', TKeywordObject.Create('exit', Symb_Cellnet));
        Keywords.Add('extern', TKeywordObject.Create('extern', Symb_Cellnet));
        Keywords.Add('false', TKeywordObject.Create('false', Symb_Cellnet));
        Keywords.Add('for', TKeywordObject.Create('for', Symb_Cellnet));
        Keywords.Add('finally', TKeywordObject.Create('finally', Symb_Cellnet));
        Keywords.Add('if', TKeywordObject.Create('if', Symb_Cellnet));
        Keywords.Add('imag', TKeywordObject.Create('imag', Symb_Cellnet));
        Keywords.Add('in', TKeywordObject.Create('in', Symb_Cellnet));
        Keywords.Add('is', TKeywordObject.Create('is', Symb_Cellnet));
        Keywords.Add('import', TKeywordObject.Create('import', Symb_Cellnet));
        Keywords.Add('loop', TKeywordObject.Create('loop', Symb_Cellnet));
        Keywords.Add('module', TKeywordObject.Create('module', Symb_Cellnet));
        Keywords.Add('mod', TKeywordObject.Create('mod', Symb_Cellnet));
        Keywords.Add('nil', TKeywordObject.Create('nil', Symb_Cellnet));
        Keywords.Add('of', TKeywordObject.Create('of', Symb_Cellnet));
        Keywords.Add('or', TKeywordObject.Create('or', Symb_Cellnet));
        Keywords.Add('out', TKeywordObject.Create('out', Symb_Cellnet));
        Keywords.Add('operator', TKeywordObject.Create('operator', Symb_Cellnet));
        Keywords.Add('procedure', TKeywordObject.Create('procedure', Symb_Cellnet));
        Keywords.Add('port', TKeywordObject.Create('port', Symb_Cellnet));
        Keywords.Add('repeat', TKeywordObject.Create('repeat', Symb_Cellnet));
        Keywords.Add('return', TKeywordObject.Create('return', Symb_Cellnet));
        Keywords.Add('self', TKeywordObject.Create('self', Symb_Cellnet));
        Keywords.Add('result', TKeywordObject.Create('result', Symb_Cellnet));
        Keywords.Add('then', TKeywordObject.Create('then', Symb_Cellnet));
        Keywords.Add('true', TKeywordObject.Create('true', Symb_Cellnet));
        Keywords.Add('to', TKeywordObject.Create('to', Symb_Cellnet));
        Keywords.Add('type', TKeywordObject.Create('type', Symb_Cellnet));
        Keywords.Add('until', TKeywordObject.Create('until', Symb_Cellnet));
        Keywords.Add('var', TKeywordObject.Create('var', Symb_Cellnet));
        Keywords.Add('while', TKeywordObject.Create('while', Symb_Cellnet));
        Keywords.Add('with', TKeywordObject.Create('with', Symb_Cellnet));
        Keywords.Add('array', TKeywordObject.Create('array', Symb_Cellnet));
        Keywords.Add('object', TKeywordObject.Create('object', Symb_Cellnet));
        Keywords.Add('pointer', TKeywordObject.Create('pointer', Symb_Cellnet));
        Keywords.Add('record', TKeywordObject.Create('record', Symb_Cellnet));
        Keywords.Add('address', TKeywordObject.Create('address', Symb_Cellnet));
        Keywords.Add('size', TKeywordObject.Create('size', Symb_Cellnet));
        Keywords.Add('alias', TKeywordObject.Create('alias', Symb_Cellnet));
    end;

    destructor TScannerObject.Done();
    begin
       Keywords.Free();
    end;

end.
