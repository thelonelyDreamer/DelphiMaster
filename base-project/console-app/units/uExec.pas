{ ******************************************************* }
{ Learning Delphi Unit }
{ ******************************************************* }
unit uExec;

interface

uses
  System.SysUtils;

type
  { 类注释，用于练习 }
  TExec = class(TObject)
  public
    // 调用此类的代码
    class procedure RunDemo();
  private
    procedure Test;

  end;

  Buffer = array of Byte;

implementation

type
  { 字符串有关的类 }
  TStringTest = class(TObject)
  public
    // 字符串模式匹配
    class procedure PatternMatch;
  end;

class procedure TStringTest.PatternMatch;
var
  text: string; // 目标字符串
  index: Integer;
begin
  text := 'The quick brown fox jumps over the lazy dog';
  index := Pos('fox', text);
  WriteLn(index);
  WriteLn(text.Contains('fox'));
end;

{ 数组demo有关的类 }
type
  TArrayTest = class(TObject)
  public
    class procedure Test;
    // 定长数组
    class procedure FixedArrayTest;
    // 不定长数组
    class procedure IndefiniteArrayTest;
  end;

class procedure TArrayTest.Test;
begin

end;

class procedure TArrayTest.FixedArrayTest;

var
  arr: array [0 .. 99] of Integer;
  i, sum: Integer;
begin
  for i := 0 to 99 do
  begin
    arr[i] := i + 1;
  end;
  sum := 0;
  for i := 0 to 99 do
  begin
    sum := sum + arr[i];
  end;
  WriteLn('The sum of numbers from 1 to 100 is: ', sum);
  ReadLn;
end;

class procedure TArrayTest.IndefiniteArrayTest;
var
  arr: array of Integer;
  i: Integer;
begin
  // 分配数组内存
  SetLength(arr, 3);

  // 添加元素到数组
  arr[0] := 10;
  arr[1] := 20;
  arr[2] := 30;
  // arr[4] :=20;

  // 输出数组元素
  for i := 0 to Length(arr) - 1 do
  begin
    Write(arr[i]);
    Write(' ');
  end;
  WriteLn(Length(arr));
  ReadLn;
end;


{  TExec  }
// 主方法
class procedure TExec.RunDemo();
begin
  TArrayTest.IndefiniteArrayTest;
end;

procedure TExec.Test;
begin
  WriteLn('Hello Test');
end;

end.
