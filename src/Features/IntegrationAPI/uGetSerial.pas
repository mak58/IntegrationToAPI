unit uGetSerial;

interface

uses
  System.SysUtils,
  uInputSerial, uValidateSerial,
  RestFluent,
  uRegistryAPI, uInterfaceRepository,
  System.Generics.Collections,
  Spring, Spring.Collections;

type

  IGetSerialHandler = interface
    ['{840E7D01-8473-4885-B2F5-1DA963735634}']
    procedure Handle(_aInput: TInputSerial);
  end;

  TGetSerial = class(TInterfacedObject, IGetSerialHandler)
  private
    function GetRepository: IRepository<TRegistryAPI>;
  public
    FValidate: IValidateSerial;
    FRepository: Lazy<IRepository<TRegistryAPI>>;

    property Repository: IRepository<TRegistryAPI> read GetRepository;

    procedure Handle(_aInput: TInputSerial);

    constructor Create(_aValidate: IValidateSerial;
      _aRepository: Lazy<IRepository<TRegistryAPI>>);
  end;

const
  URL_GUID = 'https://www.uuidgenerator.net/api/guid';

implementation

{ TGetSerial }

constructor TGetSerial.Create(_aValidate: IValidateSerial;
  _aRepository: Lazy<IRepository<TRegistryAPI>>);
begin
  FValidate := _aValidate;
  FRepository := _aRepository;
  Writeln('Class that receives DI creating - TGetSerial....');
end;

function TGetSerial.GetRepository(): IRepository<TRegistryAPI>;
/// <summary>
///   Since Repository class uses Lazy injection,
///  - Reposytory is just used if validation succesfull -
///   it's encapsulated the use of ".value" in order to call the property;
/// </summary>
begin
  Result := FRepository.Value;
end;

procedure TGetSerial.Handle(_aInput: TInputSerial);
begin
  Writeln('Handling feature - Handler method....');

  if not (FValidate.ValidateSerial(_aInput)) then Exit;

  var client := TRestFluent.Create();

  var response := client.MapGet(URL_GUID);

  Writeln('Requesting API GUID -Rest- #: ' + response.Data);

  var registryApi := TRegistryAPI.Create('0456',
    response.Data,
    Now);

  Writeln('TRepository creating lately (Lazy) by container due input validation method successful....');

  Writeln('Adding to repository....');
  Repository.Add(registryApi);

  var item := Repository.FindById(1);

  Writeln(Format('Fetching Database registry #%s, Serial #%s, Date %s',
    [item.ID, item.RegistryNumber, DateToStr(item.Date)]));

  Writeln('The end....')
end;

end.
