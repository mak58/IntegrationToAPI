unit uGetSerialInputValidation_Test;

interface

uses
  DUnitX.TestFramework,
  System.Generics.Collections, TypInfo,
  uGetSerial_input,
  uGetSerial_validate, uValidate;

type
  [TestFixture]
  TTestGetSerialInputValidation = class
  public
    [Test]
    procedure ValidateInput_GetSerial_ReturnValidObject();
    [Test]
    procedure ValidateInput_GetSerial_ReturnInvalidID();
    [Test]
    procedure ValidateInput_GetSerial_ReturnInvalidCPFCNPJ();
  end;

implementation

procedure TTestGetSerialInputValidation.ValidateInput_GetSerial_ReturnValidObject();
begin
  // arrange
  var inputTest := TInputSerial.Create('000',
    '02109855640',
    EKindRequest.Commom,
    EKindService.Registry);

  // act
  var validate := TValidateSerial.Create();
  var return := validate.ValidateEntry(inputTest);

  // assert
  Assert.AreEqual(
    GetEnumName(TypeInfo(TValidateReturn), Ord(Valid)),
    GetEnumName(TypeInfo(TValidateReturn), Ord(return.Code)));

  Assert.AreEqual('', return.Message);
end;

procedure TTestGetSerialInputValidation.ValidateInput_GetSerial_ReturnInvalidID();
begin
  // arrange
  var inputTest := TInputSerial.Create('',
    '02109855640',
    EKindRequest.Commom,
    EKindService.Registry);

  // act
  var validate := TValidateSerial.Create();
  var return := validate.ValidateEntry(inputTest);

  // assert
  Assert.AreEqual(
    GetEnumName(TypeInfo(TValidateReturn), Ord(NoID)),
    GetEnumName(TypeInfo(TValidateReturn), Ord(return.Code)));

  Assert.AreEqual('Id must be fullfilled!', return.Message);
end;

procedure TTestGetSerialInputValidation.ValidateInput_GetSerial_ReturnInvalidCPFCNPJ;
begin
  // arrange
  var inputTest := TInputSerial.Create('999',
    '',
    EKindRequest.Commom,
    EKindService.Registry);

  // act
  var validate := TValidateSerial.Create();
  var return := validate.ValidateEntry(inputTest);

  // assert
  Assert.AreEqual(
    GetEnumName(TypeInfo(TValidateReturn), Ord(NoCPFCNPJ)),
    GetEnumName(TypeInfo(TValidateReturn), Ord(return.Code)));

  Assert.AreEqual('CPFCNPJ must be fullfilled!', return.Message);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGetSerialInputValidation);

end.
