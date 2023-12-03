unit mainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  RelativePath: string;
  AbsolutePath: string;
begin
  RelativePath := '.\MyFile.txt'; // 相对路径
  AbsolutePath := ExpandFileName(RelativePath); // 将相对路径转换为绝对路径
  WriteLn(AbsolutePath); // 输出绝对路径
end;


end.
