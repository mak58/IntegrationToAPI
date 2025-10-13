unit uGetSerial_DI;

interface

uses
  Spring.Container,
  uGetSerial_handler,
  uGetSerial_validate,
  uGenericRepository,
  uInterfaceRepository,
  uRegistryAPI,
  uLogger,
  RestFluent;

function SetDIContainer(): IGetSerialHandler;

implementation

function SetDIContainer(): IGetSerialHandler;
/// <summary>
///   This is the registration on Spring4D Dependency Injection Container.
///   TRepositoryListMemory class is declared as a Lazy<> inicialization on Ctor and variable type in the caller class;
/// </summary>
begin
  Writeln('Setting DI container...');

  var Container := TContainer.Create();

  Container.RegisterType<IGetSerialHandler, TGetSerial>.AsSingleton();
  Container.RegisterType<IValidateSerial, TValidateSerial>.AsSingleton();
  Container.RegisterType<IRestFluent, TRestFluent>.AsSingleton();
  Container.RegisterType<IRepository<TRegistryAPI>, TRepositoryListMemory<TRegistryAPI>>.AsSingleton();
  Container.RegisterType<ILogger, TConsoleLogger>.AsSingleton();

  Container.Build();

  Result := Container.Resolve<IGetSerialHandler>;
end;

end.
