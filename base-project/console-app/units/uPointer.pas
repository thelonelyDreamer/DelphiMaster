{ ******************************************************* }
{ Learning Delphi Unit }
{ ******************************************************* }
unit uPointer;

interface

uses
  uTypes;

type
  { 本单元主类 }
  TPointerDemo = class(TObject)
  public
    // 该单元的所有测试方法都从这里开始
    class procedure RunDemo();
  private
    class procedure RunPointerDemo();
    class procedure RunRPointerDemo;
  end;

implementation

type
  Student = record
    name: string;
    age: Integer;
  end;

  TFirstObject = class(TObject)
  private
    fMessage: string;
  public
//    constructor Create() default;
    property Message: string read fMessage write fMessage;
  end;

  { 1. 与类型指针演示有关的类 }
  TClassPointer = class(TObject)
  public
    class procedure RunClassPointerDemo;
  private

  end;

  { 本单元函数区 }
function Func(addrPtr: Pointer): Boolean;
var
  addr: uTypes.RAddress;
begin
  Move(addrPtr^, addr, SizeOf(uTypes.RAddress));
  addr.FCity := '天津';
  Result := True;
end;

{ TPointerDemo }
// todo
class procedure TPointerDemo.RunPointerDemo;
var
  i: Integer;
  iPtr: ^Integer;
begin
  iPtr := @i;
  WriteLn(iPtr^);
end;

class procedure TPointerDemo.RunRPointerDemo;
var
  address: uTypes.RAddress;
  addressPtr: ^uTypes.RAddress;
begin
  address.FProvince := '北京';
  address.FCity := '北京';
  address.FDistinct := '朝阳区';
  addressPtr := @address;
  WriteLn(addressPtr.FProvince);
  Func(addressPtr);
  WriteLn(addressPtr.FCity);
end;

{ TClassPointer }
// 与类型指针相关的函数
class procedure TClassPointer.RunClassPointerDemo;
var
  myClassType: Pointer;
  myClassObj: TFirstObject;
begin
  myClassType := TypeInfo(TFirstObject);
//  WriteLn(myClassType.ClassName);
end;

// 本单元的主方法
class procedure TPointerDemo.RunDemo;
begin
  WriteLn('unit name: uPointer');
  // TPointerDemo.RunRPointerDemo;
  TClassPointer.RunClassPointerDemo;
end;

end.
