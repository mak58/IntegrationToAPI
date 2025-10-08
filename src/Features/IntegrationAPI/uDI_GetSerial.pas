unit uDI_GetSerial;

interface

uses
  Spring.Container,
  uGetSerial,
  uValidateSerial,
  n_GenericRepository_U,
  n_InterfaceRepository_U,
  uRegistryAPI;

procedure RegisterClassesAndInterfaces(var aContainer: TContainer);

implementation

procedure RegisterClassesAndInterfaces(var aContainer: TContainer);
begin
  aContainer.RegisterType<IGetSerialHandler, TGetSerial>('Handler').AsSingleton();
  aContainer.RegisterType<IValidateSerial, TValidateSerial>('Validator').AsSingleton();
  aContainer.RegisterType<IRepository<TRegistryAPI>, TRepositoryListMemory<TRegistryAPI>>();
  aContainer.Build();
end;

end.
