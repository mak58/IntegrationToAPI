unit ValidateSerial;

interface

uses
  InputSerial, System.SysUtils;

type
  IValidateSerial = interface
    ['{9EC7F3D0-01AD-4C33-99DB-12BB18FA7172}']
    function ValidateSerial(aSerialInput: TInputSerial): Boolean;
  end;

  TValidateSerial = class(TInterfacedObject, IValidateSerial)
  public
    function ValidateSerial(aSerialInput: TInputSerial): Boolean;
  end;

implementation

{ TValidateSerial }

function TValidateSerial.ValidateSerial(aSerialInput: TInputSerial): Boolean;
begin
  var LMessageValidation := TStringBuilder.Create(3);
  try
    if (aSerialInput.Id = '') then
      LMessageValidation.AppendLine('Id must be fullfilled!');

    if (aSerialInput.CPFCNPJ = '') then
      LMessageValidation.AppendLine('CPFCNPJ must be fullfilled!');

    Result := LMessageValidation.Length = 0;
  finally
    LMessageValidation.Free;
  end;
end;

end.
