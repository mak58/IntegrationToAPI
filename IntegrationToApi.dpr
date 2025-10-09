program IntegrationToApi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uMain in 'src\uMain.pas',
  uGetSerial in 'src\Features\IntegrationAPI\uGetSerial.pas',
  uValidateSerial in 'src\Features\IntegrationAPI\uValidateSerial.pas',
  uInputSerial in 'src\Features\IntegrationAPI\uInputSerial.pas',
  uDI_GetSerial in 'src\Features\IntegrationAPI\uDI_GetSerial.pas',
  uGenericRepository in 'src\Infra\uGenericRepository.pas',
  uInterfaceRepository in 'src\Infra\uInterfaceRepository.pas',
  uRegistryAPI in 'src\Models\uRegistryAPI.pas';

begin
  Writeln('Running app...');
  InitiateIntegrationToAPI();
  ReadLn;
end.
