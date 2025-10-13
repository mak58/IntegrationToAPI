unit uGetSerial_input;

interface

uses
  System.SysUtils, TypInfo;

type
  EKindRequest = (Commom, Full, Reduced50, Reduced75);
  EKindService = (Registry, Cancellation, Correction, Certificate);

  TInputSerial = record
    Id: string;
    CPFCNPJ: string;
    KindRequest: string;
    Service: string;

    constructor Create(aId, aCpfCnpj: string;
      aKind: EKindRequest; aService: EKindService);
  end;

implementation

{ TSerialInput }

constructor TInputSerial.Create(aId, aCpfCnpj: string;
  aKind: EKindRequest; aService: EKindService);
begin
  Id := aId;
  CPFCNPJ := aCpfCnpj;
  KindRequest := GetEnumName(TypeInfo(EKindRequest), Ord(aKind));
  Service := GetEnumName(TypeInfo(EKindService), Ord(aService));

  Writeln('Creating input object...');

  Writeln(Format('Id %s, #%s, Personal doc: %s, service: %s...',
  [Id, CPFCNPJ, KindRequest, Service]));
end;

end.
