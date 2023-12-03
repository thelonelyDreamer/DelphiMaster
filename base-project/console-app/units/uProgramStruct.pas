{ ******************************************************* }
{ 三大程序结构 Unit }
{ ******************************************************* }

unit uProgramStruct;

interface

uses
  System.SysUtils, uTypes;

type
  { 本单元的入口类 }
  TProgramStruct = class(TObject)
  public
    // 入口方法
    class procedure RunDemo();
  end;

implementation

type
  { 顺序结构 }
  TSeqStruct = class(TObject)
  public
    // 顺序结构比较简单，这个是唯一方法
    class procedure RunDemo();
  end;

  { 分支结构 }
  TBranchStruct = class(TObject)
  public
    // 从这个方法运行这个类的私有函数
    class procedure RunDemo();
  private
    // if分支
    class procedure RunIfDemo();
    // case分支
    class procedure RunCaseDemo();
  end;

  { 循环结构 }
  TLoopStruct = class(TObject)
  public
    // 从这个代码运行演示示例
    class procedure RunDemo();
  private
    // for 循环
    class procedure RunForDemo();
    // while 循环
    class procedure RunWhileDemo();
    // repeat 循环
    class procedure RunRepeatDemo();
  end;

  { TSeqStruct }
  // todo
  // 顺序结构从上到下执行
class procedure TSeqStruct.RunDemo();
begin
  Write('第一行');
  Write(#13#10 + '第二行');
end;

{ TBranchStruct }
// todo
class procedure TBranchStruct.RunDemo;
begin
  WriteLn('TBranchStruct::RunDemo');
  // TBranchStruct.RunIfDemo;   //if分支
  TBranchStruct.RunCaseDemo;
end;

// todo
class procedure TBranchStruct.RunIfDemo;
var
  i: Integer;
begin
  Randomize;
  i := Random(10);
  if (i < 3) and (i >= 0) then
    WriteLn(IntToStr(i) + '<3')
  else if (i >= 3) and (i < 6) then
    WriteLn('3<=' + IntToStr(i) + '<6')
  else if (i < 10) then
    WriteLn('6<=' + IntToStr(i) + '<10')
  else
  begin
    WriteLn('不会出现的情况');
  end;

end;

class procedure TBranchStruct.RunCaseDemo;
var
  num: Integer;
begin
  Write('Enter an integer: ');
  ReadLn(num);

  if num mod 2 = 0 then
    Write('You entered an even number.')
  else
    Write('You entered an odd number.');

  WriteLn;

  case num of
    1:
      WriteLn('You entered 1.');
    2:
      WriteLn('You entered 2.');
    3:
      WriteLn('You entered 3.');
  else
    WriteLn('You entered a number other than 1, 2, or 3.');
  end;
end;

{ TLoopStruct }
class procedure TLoopStruct.RunDemo;
begin
  WriteLn('TLoopStruct::RunDemo');
  // TLoopStruct.RunForDemo; // for 循环
  // TLoopStruct.RunWhileDemo; // while 循环
  TLoopStruct.RunRepeatDemo; // repaet 循环
end;

class procedure TLoopStruct.RunForDemo;
var
  i: Integer;
begin
  for i := 1 to 5 do
  begin
    // 执行代码块
    if i = 2 then
    begin
      continue;
    end;
    if i = 4 then
    begin
      break;
    end;

  end;
  WriteLn(i);
end;

class procedure TLoopStruct.RunWhileDemo;
var
  i: Integer;
begin
  i := 1;
  while i <= 5 do
  begin
    i := i + 1;
    if i = 2 then
    begin
      continue;
    end;
    if i = 4 then
    begin
      break;
    end;

  end;
  WriteLn(i); // 4
end;

class procedure TLoopStruct.RunRepeatDemo;
var
  i: Integer;
begin
  i := 1;
  repeat
    i := i + 1;
    if i = 3 then
    begin
      continue;
    end;
    if i = 4 then
    begin
      break;
    end;
  until i > 10;
  WriteLn(i); // 4
end;

{ goto 语句 }
procedure GoToDemo;
var
  i: Integer;
label EndLoop;
begin
  for i := 1 to 10 do
  begin
    if i = 5 then
      goto EndLoop;
    WriteLn(i);
  end;

EndLoop:
  WriteLn('Loop ended');
end;

class procedure TProgramStruct.RunDemo();
begin
  WriteLn('unit name: uProgramStruct.');
  // TSeqStruct.RunDemo(); // 顺序结构
  // TBranchStruct.RunDemo; // 分支结构
  // TLoopStruct.RunDemo; // 循环结构
  GoToDemo;
end;

end.
