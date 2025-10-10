program IntegrationToApi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uGetSerial in 'src\Features\IntegrationAPI\uGetSerial.pas',
  uValidateSerial in 'src\Features\IntegrationAPI\uValidateSerial.pas',
  uInputSerial in 'src\Features\IntegrationAPI\uInputSerial.pas',
  uDI_GetSerial in 'src\Features\IntegrationAPI\uDI_GetSerial.pas',
  uGenericRepository in 'src\Infra\uGenericRepository.pas',
  uInterfaceRepository in 'src\Infra\uInterfaceRepository.pas',
  uRegistryAPI in 'src\Models\uRegistryAPI.pas',
  uResult in 'src\Shared\uResult.pas',
  uMain in 'src\Features\Main\uMain.pas',
  uLogger in 'src\Shared\uLogger.pas';

begin
  Writeln('Running app...');
  InitiateIntegrationToAPI();
  ReadLn;
end.
