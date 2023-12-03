{ ******************************************************* }
{ Learning Delphi Type Unit }
{ ******************************************************* }
unit uDelphiType;

interface

uses
  system.SysUtils;

type
  { 本单元的入口类 }
  TDelphiType = class(TObject)
  public
    // 入口方法=在文件末尾
    class procedure RunDemo;
  end;

implementation

// 定义几个本单元用的常量
var
  MagicBoolean: Boolean;
  MagicChar: Char;
  MagicStr: string;

  // 定义本单元所用到的类型
type
  { 跟Integer类型有关的代码 }
  TDelphiInteger = class(TObject)
  public
    // 这个过程用于随便写写
    class procedure IntegerTest;
  end;

  { 跟string类型有关的代码 }
  TDelphiString = class(TObject)
  public
    // 这个过程用于调用出下列情况意外的
    class procedure RunStringDemo;
    // 字符串常见的方法,调用对象是字符串本身的方法，要引入system.SysUtils单元。
    class procedure RunThisStringMethod;
    // 字符串常见的方法，语言内置函数调用
    class procedure RunSysStringMethod;
  private
    // Contains Mehthod
    class procedure testContainsMethod;
    // IndexOf函数与LastIndexOf函数
    class procedure testIndexMethod;
    // 替换字符串
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
  sourceStr: string; // 初始字符串
begin
  sourceStr := 'Hello';
  WriteLn('原始字符串为：' + sourceStr);
  WriteLn('调用Length函数获取其长度');
  WriteLn(sourceStr + '字符串的长度为：' + IntToStr(Length(sourceStr)));
  WriteLn('字符串变大写：' + UpperCase(sourceStr));
  WriteLn('字符串变小写:' + LowerCase(sourceStr));
  WriteLn('原始字符未改变：' + sourceStr);
  WriteLn('He在原始字符串的位置为:' + IntToStr(Pos('He', sourceStr)));
  // Trim 删除字符串两端的空格,不会改变原有的字符串，只会返回修改后的 函数
  // Copy 也如此          函数
  // Delete 是一个过程会改变原来的函数
  // Insert 是一个过程会改变原来的函数
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
  WriteLn(patternStr + '在' + targetStr + '第一次出现的位置：' +
    IntToStr(targetStr.IndexOf(patternStr))); // 0
  WriteLn(patternStr + '在' + targetStr + '最后一次出现的位置：' +
    IntToStr(targetStr.LastIndexOf(patternStr))); // 13
end;

class procedure TDelphiString.testReplaceMethod;
var
  str: string; // 字符串
begin
  str := 'Hello';
  // Replace 方法不会改变原始字符串，返回新的
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

// 入口方法
class procedure TDelphiType.RunDemo;
begin
  WriteLn('unit name: uDelphiType');
  // 在这里调用想要运行的过程。
  // 例如：TDelphiInteger.IntegerTest;
//  TDelphiString.RunThisStringMethod; // 运行string类型自身的方法
  // TDelphiString.RunSysStringMethod; // 运行系统与字符串有关的函数
  TDelphiString.RunStringDemo; //出上述情况以外的情况
//  TDelphiChar.RunDemo(); //Char类型
end;

initialization

// 初始化单元常量
MagicBoolean := True;
MagicChar := '$';
MagicStr := 'Hello World';

// WriteLn('uDephiType initialized:'+MagicStr);

finalization

end.
