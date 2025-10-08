unit uRegistryAPI;

interface

type
  TRegistryAPI = class
  public
    ID: string;
    RegistryNumber: string;
    Date: TDateTime;

    constructor Create(aId, aRegistryNumber: string; aDate: TDateTime);
  end;

implementation

{ TRegistryAPI }

constructor TRegistryAPI.Create(aId, aRegistryNumber: string; aDate: TDateTime);
begin
  ID := aID;
  RegistryNumber := aRegistryNumber;
  Date := aDate;
end;

end.
