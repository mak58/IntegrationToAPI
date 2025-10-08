unit uMain;

interface

uses
  Spring.Container, uDI_GetSerial,
  uInputSerial, uGetSerial, uValidateSerial;

procedure InitiateIntegrationToAPI();


implementation

procedure InitiateIntegrationToAPI();
begin
  var Container := TContainer.Create();

  uDI_GetSerial.RegisterClassesAndInterfaces(Container);

  var Handler := Container.Resolve<IGetSerialHandler>;

  var input := TInputSerial.Create('001',
    '02109855640',
    EKindRequest.Commom,
    EKindService.Registry);

  Handler.Handle(input);
end;


end.
