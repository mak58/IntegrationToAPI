unit uTestGetSerial;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TTestGetSerial = class
  public
    [Setup]
    procedure Setup();
    [TearDown]
    procedure TearDown();

    [Test]
    procedure ValidateInput_GetSerial_ReturnValidObject();

    [Test]
    procedure Executehandler_GetSerial_GetConfirmationMessage();
  end;

implementation

procedure TTestGetSerial.Setup();
begin
end;

procedure TTestGetSerial.TearDown();
begin
end;

procedure TTestGetSerial.ValidateInput_GetSerial_ReturnValidObject();
begin
end;

procedure TTestGetSerial.Executehandler_GetSerial_GetConfirmationMessage();
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGetSerial);

end.
