unit uMain;

interface

uses
  System.SysUtils,
  uDI_GetSerial,
  uInputSerial, uGetSerial, uValidateSerial;

procedure InitiateIntegrationToAPI();


implementation

procedure InitiateIntegrationToAPI();
begin
  Writeln('InitiateIntegrationToAPI - First method...');

  var handler := uDI_GetSerial.SetDIContainer();

  var input := TInputSerial.Create('001',
    '02109855640',
    EKindRequest.Commom,
    EKindService.Registry);

  handler.Handle(input);
end;


end.
