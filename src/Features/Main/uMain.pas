unit uMain;

interface

uses
  System.SysUtils,
  uGetSerial_DI,
  uGetSerial_input,
  uGetSerial_handler,
  uGetSerial_validate;

procedure InitiateIntegrationToAPI();


implementation

procedure InitiateIntegrationToAPI();
begin
  Writeln('InitiateIntegrationToAPI - First method...');

  var input := TInputSerial.Create('001',
    '02109855640',
    EKindRequest.Commom,
    EKindService.Registry);

  var handler := uGetSerial_DI.SetDIContainer();

  var result := handler.Handle(input);

  Writeln(result.Message + 'The end....')
end;


end.
