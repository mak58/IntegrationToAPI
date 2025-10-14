unit uGetSerial_validate;

interface

uses
  uGetSerial_input, System.SysUtils, uValidate;

type
  TValidateReturn = (Valid, NoID, NoCPFCNPJ, Invalid);

  IValidate = interface
    ['{9EC7F3D0-01AD-4C33-99DB-12BB18FA7172}']
    function ValidateEntry(aSerialInput: TInputSerial):
      TValidationResult<TValidateReturn>;
  end;

  TValidateSerial = class(TInterfacedObject, IValidate)
  public
    function ValidateEntry(
      aSerialInput: TInputSerial): TValidationResult<TValidateReturn>;
  end;

  const
  ID_ERROR = 'Id must be fullfilled!';
  CPFCNPJ_ERROR = 'CPFCNPJ must be fullfilled!';

implementation

{ TValidateSerial }

function TValidateSerial.ValidateEntry(
  aSerialInput: TInputSerial): TValidationResult<TValidateReturn>;
begin
  Result := Result.Ok(Valid)
              .FailIf(aSerialInput.Id = '', NoID, ID_ERROR)
              .FailIf(aSerialInput.CPFCNPJ = '', NoCPFCNPJ, CPFCNPJ_ERROR);
end;

end.
