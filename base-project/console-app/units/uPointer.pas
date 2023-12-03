{ ******************************************************* }
{ Learning Delphi Unit }
{ ******************************************************* }
unit uPointer;

interface

uses
  uTypes;

type
  { ����Ԫ���� }
  TPointerDemo = class(TObject)
  public
    // �õ�Ԫ�����в��Է����������￪ʼ
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

  { 1. ������ָ����ʾ�йص��� }
  TClassPointer = class(TObject)
  public
    class procedure RunClassPointerDemo;
  private

  end;

  { ����Ԫ������ }
function Func(addrPtr: Pointer): Boolean;
var
  addr: uTypes.RAddress;
begin
  Move(addrPtr^, addr, SizeOf(uTypes.RAddress));
  addr.FCity := '���';
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
  address.FProvince := '����';
  address.FCity := '����';
  address.FDistinct := '������';
  addressPtr := @address;
  WriteLn(addressPtr.FProvince);
  Func(addressPtr);
  WriteLn(addressPtr.FCity);
end;

{ TClassPointer }
// ������ָ����صĺ���
class procedure TClassPointer.RunClassPointerDemo;
var
  myClassType: Pointer;
  myClassObj: TFirstObject;
begin
  myClassType := TypeInfo(TFirstObject);
//  WriteLn(myClassType.ClassName);
end;

// ����Ԫ��������
class procedure TPointerDemo.RunDemo;
begin
  WriteLn('unit name: uPointer');
  // TPointerDemo.RunRPointerDemo;
  TClassPointer.RunClassPointerDemo;
end;

end.
