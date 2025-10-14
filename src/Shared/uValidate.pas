unit uValidate;

interface

uses
  System.Generics.Collections;

type

/// <summary>
///   Default type to use when scenario is commom.
/// </summary>
  TValidateReturn = (Valid, Invalid);

/// <summary>
///   This is an object record of return;
///   The class receives a Enum type by generics
///   Ex: TValidateDocument = (Valid, NoID, NoCPFCNPJ, Invalid);
/// </summary>
  TValidationResult<T: record> = record
  private
    FCode: T;
    FMessage: string;
    FIsValid: Boolean;
  public
    class function Ok(const SuccessCode: T;
      const AMessage: string = ''): TValidationResult<T>; static;
    class function Fail(const ErrorCode: T;
      const AMessage: string): TValidationResult<T>; static;
    function FailIf(const ACondition: Boolean; const ErrorCode: T;
    const AMessage: string): TValidationResult<T>;


    property Code: T read FCode;
    property &Message: string read FMessage;
    property IsValid: Boolean read FIsValid;
  end;

implementation

{ TValidationResult<T> }

class function TValidationResult<T>.Ok(const SuccessCode: T;
  const AMessage: string): TValidationResult<T>;
begin
  Result.FCode := SuccessCode;
  Result.FMessage := AMessage;
  Result.FIsValid := True;
end;

class function TValidationResult<T>.Fail(const ErrorCode: T;
  const AMessage: string): TValidationResult<T>;
begin
  Result.FCode := ErrorCode;
  Result.FMessage := AMessage;
  Result.FIsValid := False;
end;

function TValidationResult<T>.FailIf(const ACondition: Boolean;
  const ErrorCode: T; const AMessage: string): TValidationResult<T>;
begin
  if (not FIsValid) then
    Exit(Self);

  if (ACondition) then
    Result := Fail(ErrorCode, AMessage)
  else
    Result := Self;
end;
end.
