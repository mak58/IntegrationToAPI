unit uGetSerialRest_ITest;

interface

uses
  DUnitX.TestFramework,
  RestFluent;

type
  [TestFixture]
  TTestRestRequest = class
  public
    [Setup]
    procedure Setup;

    [Test]
    [Category('Integration')]
    procedure ExecuteRequest_GetSerial_ReturnGuidValid();

    [Test]
    [Category('Integration')]
    procedure ExecuteRequest_GetSerial_ReturnFailWithURLEmpty();

  end;

const
  URL_GUID = 'https://www.uuidgenerator.net/api/guid';

implementation

uses
  System.SysUtils,
  uMyUtils;

procedure TTestRestRequest.Setup;
begin
end;

procedure TTestRestRequest.ExecuteRequest_GetSerial_ReturnGuidValid();
begin
  // arrange
  var restRequest := TRestFluent.Create();
  // act
  var response := restRequest.MapGet(URL_GUID);
  // assert
  Assert.IsTrue(TMyUtilsGUID.IsValidGuid(response.Data));
end;

procedure TTestRestRequest.ExecuteRequest_GetSerial_ReturnFailWithURLEmpty;
begin
  // arrange
  var restRequest := TRestFluent.Create();
  // act
  var response := restRequest.MapGet('');
  // assert
  Assert.IsTrue(not response.IsSuccessful);
end;


initialization
  TDUnitX.RegisterTestFixture(TTestRestRequest);

end.
