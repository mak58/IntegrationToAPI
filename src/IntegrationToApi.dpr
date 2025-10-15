program IntegrationToApi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uMain in 'Features\Main\uMain.pas',
  uRegistryAPI in 'Models\uRegistryAPI.pas',
  uGetSerial_DI in 'Features\IntegrationAPI\uGetSerial_DI.pas',
  uGetSerial_handler in 'Features\IntegrationAPI\uGetSerial_handler.pas',
  uGetSerial_input in 'Features\IntegrationAPI\uGetSerial_input.pas',
  uGetSerial_validate in 'Features\IntegrationAPI\uGetSerial_validate.pas',
  uLogger in 'Shared\uLogger.pas',
  uResult in 'Shared\uResult.pas',
  uGenericRepository in '..\modules\genericrepositorylistinmemory\uGenericRepository.pas',
  uInterfaceRepository in '..\modules\genericrepositorylistinmemory\uInterfaceRepository.pas',
  uValidate in 'Shared\uValidate.pas',
  RestFluent in '..\modules\restclient\v12.1.3\RestFluent.pas';

begin
  Writeln('Running app...');
  InitiateIntegrationToAPI();
  ReadLn;
end.
