unit main;

interface

uses
  Spring.Container, Spring.Container.Common,
  InputSerial, GetSerial, ValidateSerial;

procedure InitateIntegrationToAPI();
procedure RegisterClassesAndInterfaces(var aContainer: TContainer);


implementation

procedure InitateIntegrationToAPI();
begin
  var Container := TContainer.Create();

  RegisterClassesAndInterfaces(Container);

  var Handler := Container.Resolve<IGetSerialHandler>;

  var input := TInputSerial.Create('001',
    '02109855640',
    EKindRequest.Commom,
    EKindService.Registry);

  Handler.Handle(input);
end;

procedure RegisterClassesAndInterfaces(var aContainer: TContainer);
begin
  aContainer.Create();
  aContainer.RegisterType<IGetSerialHandler, TGetSerial>('Handler').AsSingleton();
  aContainer.RegisterType<IValidateSerial, TValidateSerial>('Validator').AsSingleton;
  aContainer.Build();
end;


end.
