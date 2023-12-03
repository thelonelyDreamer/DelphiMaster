unit uTypes;

interface

uses
  classes;

type
   {  AddressRecord  }
   RAddress=record
     FProvince:string;
     FCity:string;
     FDistinct:string;
   end;
  { IRunDemo接口 }
  IRunDemo = interface(IInterface)
    procedure RunDemo;
  end;

  { 一个学生类 }
  TStudent = class(TObject)
  private
    // 学生名字
    FName: string;
    // 学生年龄
    FAge: Integer;
    // 学生爱好
    FHobbies: TStringList;
  public
    property Name: string read FName write FName;
    property Age: Integer read FAge write FAge;
    property Hobbies: TStringList read FHobbies;
    constructor Create(const Name: string);
    destructor Destroy; override;
  end;

  TSingleGenericUtil<T> = class(TObject)
  public
    class procedure Swap(var param1, param2: T);
    class function SwapFunc(var param1, param2: T): Boolean;
  end;

implementation

{ TStudent }
constructor TStudent.Create(const Name: string);
begin
  inherited Create;
  FHobbies := TStringList.Create;
  FName := Name;
end;

destructor TStudent.Destroy;
begin
  FHobbies.Free;
  inherited Destroy;
end;

{ TSingleGenericUtil<T> }
class procedure TSingleGenericUtil<T>.Swap(var param1, param2: T);
var
  temp: T;
begin
  temp := param1;
  param1 := param2;
  param2 := temp;
end;

class function TSingleGenericUtil<T>.SwapFunc(var param1, param2: T): Boolean;
var
  temp: T;
begin
  temp := param1;
  param1 := param2;
  param2 := temp;
  Result:=False;
end;
end.
