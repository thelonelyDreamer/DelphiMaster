{ ******************************************************* }
{ Learning Delphi Type Unit }
{ ******************************************************* }
unit uDelphiType;

interface

uses
  system.SysUtils;

type
  { ����Ԫ������� }
  TDelphiType = class(TObject)
  public
    // ��ڷ���=���ļ�ĩβ
    class procedure RunDemo;
  end;

implementation

// ���弸������Ԫ�õĳ���
var
  MagicBoolean: Boolean;
  MagicChar: Char;
  MagicStr: string;

  // ���屾��Ԫ���õ�������
type
  { ��Integer�����йصĴ��� }
  TDelphiInteger = class(TObject)
  public
    // ��������������дд
    class procedure IntegerTest;
  end;

  { ��string�����йصĴ��� }
  TDelphiString = class(TObject)
  public
    // ����������ڵ��ó�������������
    class procedure RunStringDemo;
    // �ַ��������ķ���,���ö������ַ�������ķ�����Ҫ����system.SysUtils��Ԫ��
    class procedure RunThisStringMethod;
    // �ַ��������ķ������������ú�������
    class procedure RunSysStringMethod;
  private
    // Contains Mehthod
    class procedure testContainsMethod;
    // IndexOf������LastIndexOf����
    class procedure testIndexMethod;
    // �滻�ַ���
    class procedure testReplaceMethod;

  end;

  TDelphiChar = class(TObject)
  public
    class procedure RunDemo;
  end;

{ TDelphiInteger }
// todo
class procedure TDelphiInteger.IntegerTest;
begin
  WriteLn('TDelphiInteger.IntegerTest');
end;
{ TDelphiInteger }

{ TDelphiString }
// todo
class procedure TDelphiString.RunStringDemo;
var
  str:string;
  strNum:Integer;
begin
  str := 'Hello, World!';
  strNum := SizeOf(str);
  WriteLn(strNum);
end;

// todo
class procedure TDelphiString.RunThisStringMethod;
begin
  // TDelphiString.testContainsMethod;
  // TDelphiString.testIndexMethod;
  TDelphiString.testReplaceMethod;
end;

// todo
class procedure TDelphiString.RunSysStringMethod;
var
  sourceStr: string; // ��ʼ�ַ���
begin
  sourceStr := 'Hello';
  WriteLn('ԭʼ�ַ���Ϊ��' + sourceStr);
  WriteLn('����Length������ȡ�䳤��');
  WriteLn(sourceStr + '�ַ����ĳ���Ϊ��' + IntToStr(Length(sourceStr)));
  WriteLn('�ַ������д��' + UpperCase(sourceStr));
  WriteLn('�ַ�����Сд:' + LowerCase(sourceStr));
  WriteLn('ԭʼ�ַ�δ�ı䣺' + sourceStr);
  WriteLn('He��ԭʼ�ַ�����λ��Ϊ:' + IntToStr(Pos('He', sourceStr)));
  // Trim ɾ���ַ������˵Ŀո�,����ı�ԭ�е��ַ�����ֻ�᷵���޸ĺ�� ����
  // Copy Ҳ���          ����
  // Delete ��һ�����̻�ı�ԭ���ĺ���
  // Insert ��һ�����̻�ı�ԭ���ĺ���
  sourceStr := '  Hello World!  ';
  WriteLn(Length(sourceStr));
end;

// todo
class procedure TDelphiString.testContainsMethod;
var
  str1, str2: string;
begin
  str1 := 'Hello, world!';
  str2 := 'world1';
  if str1.Contains(str2) then
    WriteLn('str1 contains str2')
  else
  begin
    WriteLn('str1 does not contain str2');
  end;
end;

// todo
class procedure TDelphiString.testIndexMethod;
var
  targetStr, patternStr: string;
begin
  targetStr := 'Hello World! Hello.';
  patternStr := 'Hello';
  WriteLn(patternStr + '��' + targetStr + '��һ�γ��ֵ�λ�ã�' +
    IntToStr(targetStr.IndexOf(patternStr))); // 0
  WriteLn(patternStr + '��' + targetStr + '���һ�γ��ֵ�λ�ã�' +
    IntToStr(targetStr.LastIndexOf(patternStr))); // 13
end;

class procedure TDelphiString.testReplaceMethod;
var
  str: string; // �ַ���
begin
  str := 'Hello';
  // Replace ��������ı�ԭʼ�ַ����������µ�
  WriteLn(str.Replace('l', 'e'));
  WriteLn(str);
end;
{ TDelphiString }

{  TDelphiChar  }
class procedure TDelphiChar.RunDemo;
begin
  WriteLn('a'+#13#10+'b');
end;
{  TDelphiChar  }

// ��ڷ���
class procedure TDelphiType.RunDemo;
begin
  WriteLn('unit name: uDelphiType');
  // �����������Ҫ���еĹ��̡�
  // ���磺TDelphiInteger.IntegerTest;
//  TDelphiString.RunThisStringMethod; // ����string��������ķ���
  // TDelphiString.RunSysStringMethod; // ����ϵͳ���ַ����йصĺ���
  TDelphiString.RunStringDemo; //�����������������
//  TDelphiChar.RunDemo(); //Char����
end;

initialization

// ��ʼ����Ԫ����
MagicBoolean := True;
MagicChar := '$';
MagicStr := 'Hello World';

// WriteLn('uDephiType initialized:'+MagicStr);

finalization

end.
