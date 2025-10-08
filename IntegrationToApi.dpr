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
  n_GenericRepository_U in 'src\Infra\n_GenericRepository_U.pas',
  n_InterfaceRepository_U in 'src\Infra\n_InterfaceRepository_U.pas',
  uRegistryAPI in 'src\Models\uRegistryAPI.pas';

begin
  InitiateIntegrationToAPI();
  ReadLn;
end.
