program IntegrationToApi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uGetSerial_validate in 'src\Features\IntegrationAPI\uGetSerial_validate.pas',
  uGetSerial_input in 'src\Features\IntegrationAPI\uGetSerial_input.pas',
  uGetSerial_DI in 'src\Features\IntegrationAPI\uGetSerial_DI.pas',
  uRegistryAPI in 'src\Models\uRegistryAPI.pas',
  uResult in 'src\Shared\uResult.pas',
  uMain in 'src\Features\Main\uMain.pas',
  uLogger in 'src\Shared\uLogger.pas',
  uGetSerial_handler in 'src\Features\IntegrationAPI\uGetSerial_handler.pas',
  uGenericRepository in 'modules\genericrepositorylistinmemory\uGenericRepository.pas',
  uInterfaceRepository in 'modules\genericrepositorylistinmemory\uInterfaceRepository.pas',
  RestFluent in 'modules\restclient\v12.1.2\RestFluent.pas';

begin
  Writeln('Running app...');
  InitiateIntegrationToAPI();
  ReadLn;
end.
