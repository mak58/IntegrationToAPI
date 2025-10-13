unit uGetSerial_handler;

interface

uses
  System.SysUtils,
  uGetSerial_input, uGetSerial_validate,
  RestFluent,
  uRegistryAPI, uInterfaceRepository,
  System.Generics.Collections,
  Spring, Spring.Collections,
  uResult, uLogger;

type

  IGetSerialHandler = interface
    ['{840E7D01-8473-4885-B2F5-1DA963735634}']
    function Handle(aInput: TInputSerial): TResult<string>;
  end;

  TGetSerial = class(TInterfacedObject, IGetSerialHandler)
  private
    function GetRepository: IRepository<TRegistryAPI>;
  public
    FValidate: IValidateSerial;
    FServiceApi: IRestFluent;
    FRepository: Lazy<IRepository<TRegistryAPI>>;
    FLogger: ILogger;

    property Repository: IRepository<TRegistryAPI> read GetRepository;

    function Handle(aInput: TInputSerial): TResult<string>;

    constructor Create(aValidate: IValidateSerial;
      aServiceApi: IRestFluent;
      aRepository: Lazy<IRepository<TRegistryAPI>>;
      aLogger: ILogger);
  end;

const
  URL_GUID = 'https://www.uuidgenerator.net/api/guid';

implementation

{ TGetSerial }

constructor TGetSerial.Create(aValidate: IValidateSerial;
  aServiceApi: IRestFluent;
  aRepository: Lazy<IRepository<TRegistryAPI>>;
  aLogger: ILogger);
/// <summary>
///   Ctor that uses Dependency injection.
///   Spring4D is the container responsible for managing and creating the classes.
/// </summary>
begin
  FValidate := aValidate;
  FServiceApi := aServiceApi;
  FRepository := aRepository;
  FLogger := aLogger;
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

function TGetSerial.Handle(aInput: TInputSerial): TResult<string>;
begin
  FLogger.Log('Handling feature - Handler method....');

  if not (FValidate.ValidateSerial(aInput)) then
    Exit(TResult<string>.Fail('Input invalid!'));

  var response := FServiceApi.MapGet(URL_GUID);

  FLogger.Log('Requesting API GUID -Rest- #: ' + response.Data);

  var registryApi := TRegistryAPI.Create('0456',
    response.Data,
    Now);

  FLogger.Log('TRepository creating lately (Lazy) by container due input validation method successful....');

  FLogger.Log('Adding to repository....');
  Repository.Add(registryApi);

  var item := Repository.FindById(1);

  FLogger.Log(Format('Fetching Database registry #%s, Serial #%s, Date %s',
    [item.ID, item.RegistryNumber, DateToStr(item.Date)]));

  Result := TResult<string>.Ok(item.RegistryNumber, 'It''s Done! ');
end;

end.
