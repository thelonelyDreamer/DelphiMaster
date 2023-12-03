unit uException;

interface

uses
  system.SysUtils;

type
  TExceptionDemo = class(TObject)
  public
    class procedure RunDemo;
  end;

  TMyException1 = class(Exception)
  public
    constructor Create(const Msg: string);
  end;

  TMyException2 = class(Exception)
  public
    constructor Create(const Msg: string);
  end;

implementation

type
  TMultiException = class(TObject)
  public
    class procedure RunDemo;
  private
    class procedure RunMultiDemo;
  end;

  { TMyException1 }

constructor TMyException1.Create(const Msg: string);
begin
  inherited Create(Msg);
end;

{ TMyException2 }

constructor TMyException2.Create(const Msg: string);
begin
  inherited Create(Msg);
end;

{ TMultiException }
class procedure TMultiException.RunMultiDemo;
begin
  try
    try
      raise TMyException1.Create('Error Message');
    except
      on TMyException1 do
        WriteLn('Hello1');
      on Exception do
        WriteLn('Hello2');
    end;
  finally
  end;
end;

class procedure TMultiException.RunDemo;
begin
  TMultiException.RunMultiDemo; // 同时捕获多个异常
end;

class procedure TExceptionDemo.RunDemo;
begin
  WriteLn('unit name: uException');
  TMultiException.RunDemo; // TMultiException
end;

end.
