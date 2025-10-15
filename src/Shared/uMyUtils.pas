unit uMyUtils;

interface

type
  TMyUtilsGUID = class
  public
    class function IsValidGUID(const aGUIDStr: string): Boolean;

  end;

implementation

uses
  System.SysUtils, System.StrUtils;

{ TMyUtilsGUID }

class function TMyUtilsGUID.IsValidGUID(const aGUIDStr: string): Boolean;
begin
  Result := True;
  try
    var defaultGuid := '';

    if not(aGUIDStr.StartsWith('{')) then
      defaultGuid := '{' + aGUIDStr + '}'
    else
      defaultGuid := aGuidStr;

    System.SysUtils.StringToGUID(defaultGuid);
  except
    Result := False;
  end;
end;

end.
