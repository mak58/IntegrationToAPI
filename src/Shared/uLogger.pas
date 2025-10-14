unit uLogger;

interface

uses
  System.Generics.Collections;

type
  TLogLevel = (Info, Warn, Error);

  ILogger = interface
    ['{BA236BCE-C61E-4BE4-8632-1809C7728D9B}']
    procedure Info(const AMessage: string);
    procedure Warn(const AMessage: string);
    procedure Error(const AMessage: string);
  end;

  TMemoryLogger = class(TInterfacedObject, ILogger)
  private
    FLogs: TList<string>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Info(const AMessage: string);
    procedure Warn(const AMessage: string);
    procedure Error(const AMessage: string);

    function GetLogs(): TArray<string>;
  end;

implementation


{ TMemoryLogger }

constructor TMemoryLogger.Create();
begin
  FLogs := TList<string>.Create;
end;

destructor TMemoryLogger.Destroy;
begin
  FLogs.Free;
  inherited;
end;

procedure TMemoryLogger.Info(const AMessage: string);
begin
  FLogs.Add('[INFO] ' + AMessage);
  Writeln(AMessage);
end;

procedure TMemoryLogger.Warn(const AMessage: string);
begin
  FLogs.Add('[WARN] ' + AMessage);
  Writeln(AMessage);
end;

procedure TMemoryLogger.Error(const AMessage: string);
begin
  FLogs.Add('[ERROR] ' + AMessage);
  Writeln(AMessage);
end;

function TMemoryLogger.GetLogs(): TArray<string>;
begin
  Result := FLogs.ToArray;
end;

end.
