program ConsoleApp;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  classes,
  System.Rtti,
  UMain in 'UMain.pas',
  uExec in 'units\uExec.pas',
  uDelphiType in 'units\uDelphiType.pas',
  uPointer in 'units\uPointer.pas',
  uTypes in 'units\uTypes.pas',
  uProgramStruct in 'units\uProgramStruct.pas',
  uDelphiRoutine in 'units\uDelphiRoutine.pas',
  uOOP in 'units\uOOP.pas',
  uException in 'units\uException.pas';

procedure test(var nums: Array of Integer);
begin
  nums[1] := 100;
end;

// �շ���������ʼǰִ�У���ʱдд
procedure BeforeStarter();
var
  RelativePath: string;
  AbsolutePath: string;
  i: Integer;
begin
  RelativePath := '..\MyFolder\MyFile.txt'; // ���·��
  AbsolutePath := ExpandFileName(RelativePath); // �����·��ת��Ϊ����·��
  WriteLn(AbsolutePath); // �������·��
end;

{ ������ִ�п�ʼ�ĵط� }
begin
  BeforeStarter;
  WriteLn('progress started');
  try
    try
      // ִ���ĸ���Ԫ�Ĵ���ʹ��ĸ���Ԫ

      // uDelphiType.TDelphiType.RunDemo;  //��Delphi�������������йص�
      // uProgramStruct.TProgramStruct.RunDemo; // ��������ṹ�йص�
      // uPointer.TPointerDemo.RunDemo; // ��ָ����صĳ���
      // uDelphiRoutine.TDelphiRoutine.RunDemo; // ��������صĳ���
      // uOOP.TOOP.RunDemo; // �������������ص�
      // uExec.TExec.RunDemo;
      uException.TExceptionDemo.RunDemo;
    except
      on E: Exception do
        WriteLn('Error: ' + E.Message);
    end;
  finally
    // ������ִ���������.
  end;
  WriteLn('progress end');
  ReadLn;

end.
