unit uLogger;

interface

type
  ILogger = interface
    ['{BA236BCE-C61E-4BE4-8632-1809C7728D9B}']
    procedure Log(const aMsg: string);
  end;

  TConsoleLogger = class(TInterfacedObject, ILogger)
    procedure Log(const aMsg: string);
  end;


implementation

{ TConsoleLogger }

procedure TConsoleLogger.Log(const aMsg: string);
begin
  WriteLn(AMsg + sLineBreak);
end;

end.
