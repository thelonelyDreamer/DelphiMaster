{ ******************************************************* }
{ �������ṹ Unit }
{ ******************************************************* }

unit uProgramStruct;

interface

uses
  System.SysUtils, uTypes;

type
  { ����Ԫ������� }
  TProgramStruct = class(TObject)
  public
    // ��ڷ���
    class procedure RunDemo();
  end;

implementation

type
  { ˳��ṹ }
  TSeqStruct = class(TObject)
  public
    // ˳��ṹ�Ƚϼ򵥣������Ψһ����
    class procedure RunDemo();
  end;

  { ��֧�ṹ }
  TBranchStruct = class(TObject)
  public
    // �������������������˽�к���
    class procedure RunDemo();
  private
    // if��֧
    class procedure RunIfDemo();
    // case��֧
    class procedure RunCaseDemo();
  end;

  { ѭ���ṹ }
  TLoopStruct = class(TObject)
  public
    // ���������������ʾʾ��
    class procedure RunDemo();
  private
    // for ѭ��
    class procedure RunForDemo();
    // while ѭ��
    class procedure RunWhileDemo();
    // repeat ѭ��
    class procedure RunRepeatDemo();
  end;

  { TSeqStruct }
  // todo
  // ˳��ṹ���ϵ���ִ��
class procedure TSeqStruct.RunDemo();
begin
  Write('��һ��');
  Write(#13#10 + '�ڶ���');
end;

{ TBranchStruct }
// todo
class procedure TBranchStruct.RunDemo;
begin
  WriteLn('TBranchStruct::RunDemo');
  // TBranchStruct.RunIfDemo;   //if��֧
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
    WriteLn('������ֵ����');
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
  // TLoopStruct.RunForDemo; // for ѭ��
  // TLoopStruct.RunWhileDemo; // while ѭ��
  TLoopStruct.RunRepeatDemo; // repaet ѭ��
end;

class procedure TLoopStruct.RunForDemo;
var
  i: Integer;
begin
  for i := 1 to 5 do
  begin
    // ִ�д����
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

{ goto ��� }
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
  // TSeqStruct.RunDemo(); // ˳��ṹ
  // TBranchStruct.RunDemo; // ��֧�ṹ
  // TLoopStruct.RunDemo; // ѭ���ṹ
  GoToDemo;
end;

end.
