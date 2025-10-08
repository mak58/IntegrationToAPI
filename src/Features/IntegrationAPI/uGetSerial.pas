unit uGetSerial;

interface

uses
  System.SysUtils,
  uInputSerial, uValidateSerial,
  RestFluent,
  uRegistryAPI, n_InterfaceRepository_U, System.Generics.Collections;

type

  IGetSerialHandler = interface
    ['{840E7D01-8473-4885-B2F5-1DA963735634}']
    procedure Handle(_aInput: TInputSerial);
  end;

  TGetSerial = class(TInterfacedObject, IGetSerialHandler)
  public
    FValidate: IValidateSerial;
    FRepository: IRepository<TRegistryAPI>;
    procedure Handle(_aInput: TInputSerial);
    constructor Create(_aValidate: IValidateSerial;
      _aRepository: IRepository<TRegistryAPI>);
  end;
implementation

{ TGetSerial }

constructor TGetSerial.Create(_aValidate: IValidateSerial;
  _aRepository: IRepository<TRegistryAPI>);
begin
  FValidate := _aValidate;
  FRepository := _aRepository;
  Writeln('TGetSerial creating....')
end;

procedure TGetSerial.Handle(_aInput: TInputSerial);
begin
  if not (FValidate.ValidateSerial(_aInput)) then Exit;

  var client := TRestFluent.Create();

  var response := client.MapGet('https://www.uuidgenerator.net/api/guid');

  Writeln('GUID #: ' + response.Data);

  var registryApi := TRegistryAPI.Create('0001',
    response.Data,
    Now);

  FRepository.Add(registryApi);

  Writeln(FRepository.GetAll[0].RegistryNumber);
end;

end.
