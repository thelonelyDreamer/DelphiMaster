{ ******************************************************* }
{ Learning Delphi Unit }
{ ******************************************************* }
unit uExec;

interface

uses
  System.SysUtils;

type
  { ��ע�ͣ�������ϰ }
  TExec = class(TObject)
  public
    // ���ô���Ĵ���
    class procedure RunDemo();
  private
    procedure Test;

  end;

  Buffer = array of Byte;

implementation

type
  { �ַ����йص��� }
  TStringTest = class(TObject)
  public
    // �ַ���ģʽƥ��
    class procedure PatternMatch;
  end;

class procedure TStringTest.PatternMatch;
var
  text: string; // Ŀ���ַ���
  index: Integer;
begin
  text := 'The quick brown fox jumps over the lazy dog';
  index := Pos('fox', text);
  WriteLn(index);
  WriteLn(text.Contains('fox'));
end;

{ ����demo�йص��� }
type
  TArrayTest = class(TObject)
  public
    class procedure Test;
    // ��������
    class procedure FixedArrayTest;
    // ����������
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
  // ���������ڴ�
  SetLength(arr, 3);

  // ���Ԫ�ص�����
  arr[0] := 10;
  arr[1] := 20;
  arr[2] := 30;
  // arr[4] :=20;

  // �������Ԫ��
  for i := 0 to Length(arr) - 1 do
  begin
    Write(arr[i]);
    Write(' ');
  end;
  WriteLn(Length(arr));
  ReadLn;
end;


{  TExec  }
// ������
class procedure TExec.RunDemo();
begin
  TArrayTest.IndefiniteArrayTest;
end;

procedure TExec.Test;
begin
  WriteLn('Hello Test');
end;

end.
