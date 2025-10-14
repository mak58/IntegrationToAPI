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


  Writeln('Creating input object...');

  var input := TInputSerial.Create('001',
    '02109855640',
    EKindRequest.Commom,
    EKindService.Registry);

  Writeln(Format('Id %s, #%s, Personal doc: %s, service: %s...',
  [input.Id, input.CPFCNPJ, input.KindRequest, input.Service]));

  var handler := uGetSerial_DI.SetDIContainer();

  var result := handler.Handle(input);

  Writeln(result.Message + 'The end....')
end;


end.
