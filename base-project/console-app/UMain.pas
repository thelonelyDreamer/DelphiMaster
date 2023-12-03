unit uMain;

interface

uses
  System.IOUtils,
  System.SysUtils;

var
  name, test: string;
  tes1: Integer;

type
  TMyClass = class(TObject)
  public
    procedure MyProcedure;
    function test(aString: string): Integer;
    constructor Create();
    destructor Destroy; override;
  end;

  TMyEnum = (zero, one, two);

  TStudent = record
    name: string;
    Age: Integer;
  end;

implementation

type
  TAnimal = class(TObject)
  private
    FName: string;
  public
    procedure Speak;
  end;

  TDog = class(TAnimal)
  private
    FName: string;
  public
    procedure Speak;
  end;

{ TMyClass }
procedure TMyClass.MyProcedure;
var
  templateStr: string;
  subString: string;
begin
  templateStr := 'Hello World!';
  subString := Copy(templateStr, 2); // 'ello World!';
  WriteLn(subString);
  subString := Copy(templateStr, 2, 3); // 'llo'
  WriteLn(subString);
  subString := Copy(templateStr, 1, 3);
  WriteLn(subString);
end;

function TMyClass.test(aString: string): Integer;
begin
  Result := Length(aString);
end;

constructor TMyClass.Create();
begin

end;

destructor TMyClass.Destroy;
begin
  WriteLn('Destroy');
  inherited
end;

{ TAnimal }
procedure TAnimal.Speak;
begin
  WriteLn('Animal Speak');

end;

{ TDog }
procedure TDog.Speak;
begin
  inherited;
  WriteLn('Dog Speak');
end;



end.
