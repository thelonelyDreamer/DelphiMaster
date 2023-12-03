unit uOOP;

interface

type
  { ����Ԫ������� }
  TOOP = class(TObject)
  public
    { ��ڹ��� }
    class procedure RunDemo;
  end;

implementation

type
  TAnimal = class(TObject)
  private
    FName: string;
  public
    procedure Speak;virtual;
  end;

  TDog = class(TAnimal)
  private
    FName: string;
  public
    procedure Speak;override;
  end;

{ TAnimal }
procedure TAnimal.Speak;
begin
  WriteLn('Animal Speak');

end;

{ TDog }
procedure TDog.Speak;
begin
  WriteLn('Dog Speak');
end;



  { TOOP }
class procedure TOOP.RunDemo;
var
  dog:TDog;
begin
  WriteLn('unit name: uOOP');
  dog:=Tdog.Create;
  dog.Speak;
end;

end.
