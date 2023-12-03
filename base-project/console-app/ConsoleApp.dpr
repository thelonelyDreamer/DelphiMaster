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

// 空方法，程序开始前执行，有时写写
procedure BeforeStarter();
var
  RelativePath: string;
  AbsolutePath: string;
  i: Integer;
begin
  RelativePath := '..\MyFolder\MyFile.txt'; // 相对路径
  AbsolutePath := ExpandFileName(RelativePath); // 将相对路径转换为绝对路径
  WriteLn(AbsolutePath); // 输出绝对路径
end;

{ 主程序执行开始的地方 }
begin
  BeforeStarter;
  WriteLn('progress started');
  try
    try
      // 执行哪个单元的代码就打开哪个单元

      // uDelphiType.TDelphiType.RunDemo;  //与Delphi内置数据类型有关的
      // uProgramStruct.TProgramStruct.RunDemo; // 程序三大结构有关的
      // uPointer.TPointerDemo.RunDemo; // 与指针相关的程序
      // uDelphiRoutine.TDelphiRoutine.RunDemo; // 与例程相关的程序
      // uOOP.TOOP.RunDemo; // 与面向对象编程相关的
      // uExec.TExec.RunDemo;
      uException.TExceptionDemo.RunDemo;
    except
      on E: Exception do
        WriteLn('Error: ' + E.Message);
    end;
  finally
    // 在这里执行清理代码.
  end;
  WriteLn('progress end');
  ReadLn;

end.
