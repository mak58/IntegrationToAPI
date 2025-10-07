program IntegrationToApi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  main in 'src\main.pas',
  GetSerial in 'src\Features\IntegrationAPI\GetSerial.pas',
  ValidateSerial in 'src\Features\IntegrationAPI\ValidateSerial.pas',
  InputSerial in 'src\Features\IntegrationAPI\InputSerial.pas';

begin
  InitateIntegrationToAPI();
  ReadLn;
end.
