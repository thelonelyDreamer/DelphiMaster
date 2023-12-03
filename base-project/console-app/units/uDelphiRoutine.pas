unit uDelphiRoutine;

interface

uses
  System.SysUtils, uTypes;

type
  TDelphiRoutine = class(TObject)
  public
    class procedure RunDemo;

  end;

implementation


procedure SwapTest();
var
  x, y: Integer;
begin
  x := 10;
  y := 20;
  WriteLn('Before Swap: x = ', x, ', y = ', y);
  uTypes.TSingleGenericUtil<Integer>.SwapFunc(x, y);
  WriteLn('After Swap: x = ', x, ', y = ', y);
end;

class procedure TDelphiRoutine.RunDemo;
begin
  WriteLn('unit name: uDelphiRoutine');
  SwapTest;
end;

end.
