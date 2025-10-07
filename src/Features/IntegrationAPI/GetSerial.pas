unit GetSerial;

interface

uses
  InputSerial, ValidateSerial;

type

  IGetSerialHandler = interface
    ['{840E7D01-8473-4885-B2F5-1DA963735634}']
    procedure Handle(_aInput: TInputSerial);
  end;

  TGetSerial = class(TInterfacedObject, IGetSerialHandler)
  public
    FValidate: IValidateSerial;
    procedure Handle(_aInput: TInputSerial);
    constructor Create(_aValidate: IValidateSerial);
  end;
implementation

{ TGetSerial }

constructor TGetSerial.Create(_aValidate: IValidateSerial);
begin
  FValidate := _aValidate;
end;

procedure TGetSerial.Handle(_aInput: TInputSerial);
begin
  if FValidate.ValidateSerial(_aInput) then
    Writeln('Input validated succesfully')
  else
    Writeln('Ivalid inout, please correct issues for follow-up')
end;

end.
