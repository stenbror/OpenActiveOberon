
unit ActiveOberonScanner;

{$mode objfpc}{$H+}

interface

uses
    contnrs, SysUtils;

const   

    MaxIdentifierLength = 128;

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
    Symb_Semicolon = 57; Symb_Transpose = 58; Symb_RightBrace = 59; Symb_RightBracket = 60; Symb_RightParenthesis = 61; Symb_Questionmark = 62;
    Symb_ExclamationMark = 63; Symb_LessLess = 64; Symb_GreaterGreater = 65; Symb_Upto = 66; Symb_Arrow = 67; Symb_Period = 68;
    Symb_Comma = 69; Symb_Colon = 70; Symb_Of = 71; Symb_Then = 72; Symb_Do = 73; Symb_To = 74;
    Symb_By = 75; Symb_Becomes = 76; Symb_Bar = 77; Symb_End = 78; Symb_Else = 79; Symb_Elsif = 80;
    Symb_Until = 81; Symb_Finally = 82;
    Symb_Code = 83; Symb_Const = 84; Symb_Type = 85; Symb_Var = 86; Symb_Out = 87; Symb_Procedure = 88;
    Symb_Operator = 89; Symb_Import = 90; Symb_Definition = 91; Symb_Module = 92; Symb_Cell = 93; Symb_CellNet = 94;
    Symb_Extern = 95;
    Symb_Array = 96; Symb_Object = 97; Symb_Record = 98; Symb_Pointer = 99; Symb_Enum = 100; Symb_Port = 101;
    Symb_Address = 102; Symb_Size = 103; Symb_Alias = 104;

    (* Number types *)
    Shortint = 108; Integer = 109; Longint = 110; Hugeint = 111; Real = 112; Longreal = 113; 
	Comment = 114; EndOfText = 115; 

type

    IdentifierString = array [0..MaxIdentifierLength] of Char;

    Token = Int64; (* Symbol Code *)

    (* Symbol: Data structure for transfer of data between scanner and parser *)
    Symbol = record 
        _start, _end, _line: Int64; 
        _symbol: Token;
        _identifier: IdentifierString;
        _string: string;
        _stringLength: Int64;
        _numberType: Int64;
        _integer: Int64;
        _hugeint: Int64;
        _character: char;
        _real: Double;
    end;


    TKeywordObject = class
        Name: string;
        Symbol: Token;
        constructor Create(AName: string; symb: Token);
    end;

    TScannerObject = class
        Keywords: TFPHashObjectList;
        constructor Create(fileName: string);
        destructor Done();

        procedure GetNextCharacter;
        procedure SkipBlanks;
        procedure GetNextSymbol(var symbol: Symbol; var error: Boolean);
        procedure GetIdentifier(var symbol: Symbol);
    end;

var

    reader: file of char;

    ch: char;
    position: Int64;
    line: Int64;

implementation

    constructor TKeywordObject.Create(AName: string; symb: Token);
    begin
    Name := AName;
    Symbol := symb;
    end;

    constructor TScannerObject.Create(fileName: string);
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

        Assign(reader, fileName);
        Reset(reader); 
    end;

    destructor TScannerObject.Done();
    begin
       Keywords.Free();
       Close(reader);
    end;

    (* Get next character from file and handle line shift *)
    procedure TScannerObject.GetNextCharacter;
    var
        pos: Int64;
    begin
        Read(reader, ch);
        if ch = '\n' then inc(line);
        if ch = '\r' then
            begin
                pos := FilePos(reader);
                Read(reader, ch);
                if ch <> '\n' then 
                    Seek(reader, pos);
                inc(line);
            end;
    end;


    procedure TScannerObject.GetIdentifier(var symbol: Symbol);
    var i : Int64;

        function IsReservedKeywordCharacter() : Boolean;
        var res : Boolean;
        begin
            case ch of
                'a' .. 'z' : res := true;
                'A' .. 'Z' : res := true;
                '0' .. '9' : res := true;
                '_' : res := true
                else res := false
            end;
            result := res;
        end;


    begin
        i := 0;
        while IsReservedKeywordCharacter() do
            begin
                symbol._identifier[i] := ch; GetNextCharacter;
                if i = MaxIdentifierLength then exit 
            end;
        symbol._identifier[i] := 0;
    end;
            
    


    procedure TScannerObject.SkipBlanks;
    begin
        while  (ch <= ' ') and (ch <> '\0') do
        begin
            GetNextCharacter;
        end
    end;

    (* Get next symbol for parser *)
    procedure TScannerObject.GetNextSymbol(var symbol: Symbol; var error: Boolean);
    VAR 
        s, token: Int64;

    begin
        
        SkipBlanks;
        symbol._start := position; symbol._line := line;

        case ch of
        '#' :   begin s := Symb_Unequal; GetNextCharacter; end;
        '&' :   begin s := Symb_And; GetNextCharacter; end;
        '(' :   begin 
                        GetNextCharacter;   
                        if ch = '*' then begin
                            // Handle comment
                            s := Comment;
                        end
                        else
                            s := Symb_LeftParenthesis;
                    end;
            ')' :   begin s := Symb_RightParenthesis; GetNextCharacter; end;
            '*' :   begin GetNextCharacter; if ch = '*' then begin GetNextCharacter; s := Symb_TimesTimes; end else s := Symb_Times; end;
            '+' :   begin GetNextCharacter; if ch = '*' then begin GetNextCharacter; s := Symb_PlusTimes; end else s := Symb_Plus; end;
            ',' :   begin s := Symb_Comma; GetNextCharacter; end;
            '-' :   begin s := Symb_Minus; GetNextCharacter; end;
            ';' :   begin s := Symb_Semicolon; GetNextCharacter; end;
            '.' :   begin 
                        if ch = '.' then begin GetNextCharacter; s := Symb_Upto; end
                        else if ch = '*' then begin GetNextCharacter; s := Symb_DotTimes; end
                        else if ch = '/' then begin GetNextCharacter; s := Symb_DotSlash; end
                        else if ch = '=' then begin GetNextCharacter; s := Symb_DotEqual; end
                        else if ch = '#' then begin GetNextCharacter; s := Symb_DotUnequal; end
                        else if ch = '>' then begin 
                            GetNextCharacter;
                            if ch = '=' then begin GetNextCharacter; s := Symb_DotGreaterEqual; end
                            else s := Symb_DotGreater;
                        end
                        else if ch = '<' then begin 
                            GetNextCharacter;
                            if ch = '=' then begin GetNextCharacter; s := Symb_DotLessEqual; end
                            else s := Symb_DotLess;
                        end
                        else begin s := Symb_Period; end;
                    end;
            '/' :   begin s := Symb_Slash; GetNextCharacter; end;
            ':' :   begin GetNextCharacter; if ch = '=' then begin GetNextCharacter; s := Symb_Becomes; end else s := Symb_Colon; end;
            '=' :   begin s := Symb_Equal; GetNextCharacter; end;
            '<' :   begin 
                        GetNextCharacter;
                        if ch = '=' then begin GetNextCharacter; s := Symb_LessEqual end
                        else if ch = '<' then begin
                            GetNextCharacter;
                            if ch = '?' then begin 
                                GetNextCharacter;
                                s := Symb_LessLessQ;
                            end
                            else s := Symb_LessLess;
                        end
                        else s := Symb_Less;
                    end;
            '>' :   begin 
                        GetNextCharacter();
                        if ch = '=' then begin GetNextCharacter; s := Symb_GreaterEqual end
                        else if ch = '>' then begin
                            GetNextCharacter;
                            if ch = '?' then begin 
                                GetNextCharacter;
                                s := Symb_GreaterGreaterQ;
                            end
                            else s := Symb_GreaterGreater;
                        end
                        else s := Symb_Less;
                    end;
            '[' :   begin s := Symb_LeftBracket; GetNextCharacter; end;
            ']' :   begin s := Symb_RightBracket; GetNextCharacter; end;
            '{' :   begin s := Symb_LeftBrace; GetNextCharacter; end;
            '}' :   begin s := Symb_RightBrace; GetNextCharacter; end;
            '|' :   begin s := Symb_Bar; GetNextCharacter; end;
            '^' :   begin s := Symb_Arrow; GetNextCharacter; end;
            '~' :   begin s := Symb_Not; GetNextCharacter; end;
            '`' :   begin s := Symb_Transpose; GetNextCharacter; end;
            '!' :   begin GetNextCharacter; if ch = '!' then begin GetNextCharacter; s := Symb_ExclamationMarks; end else s := Symb_ExclamationMark; end;
            '?' :   begin GetNextCharacter; if ch = '?' then begin GetNextCharacter; s := Symb_Questionmarks; end else s := Symb_Questionmark; end;
            'A' .. 'Z' :    begin end;
            'a' .. 'z' :    begin end;
            '0' .. '9' :    begin end;


        else s := Symb_None;
        end;

        symbol._symbol := s;
        symbol._end := position;
    end;

end.
