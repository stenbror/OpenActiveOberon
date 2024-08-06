unit TestActiveOberonParser;

{$mode objfpc}{$H+}

interface

uses

  TestFramework, ActiveOberonParser;

type

    (* Test class for Scanner *)
    TTestActiveOberonParser = class(TTestCase)
        published
            procedure TestTermExpressionTimes;


        end;

implementation

uses

  SysUtils;

{ TTestActiveOberonParser }

    (* UnitTest: UnEqual*)
    procedure TTestActiveOberonParser.TestTermExpressionTimes;
    var 
        parser: TParserObject;
        res: TNode;

    begin
        parser := TParserObject.Create('bootcompiler/unittests/data/parse_term_single_times.mod');
        parser.Advance;
        res := parser.ParseTermExpression;
        Check(res <> nil, 'Parse Error!');
        parser.Done;
        
    end;

end.