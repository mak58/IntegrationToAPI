unit uResult;

interface

/// <summary>
///   Result Pattern to revert back result, messages and Data;
/// </summary>
///
type
  TResult<T> = record
    StatusCode: Integer;
    Success: Boolean;
    &Message: string;
    Value: T;

    class function Ok(AValue: T; AMessage: string = '';
      AStatusCode: Integer = 0): TResult<T>; static;
    class function Fail(AMessage: string;
      AStatusCode: Integer = 0): TResult<T>; static;
  end;

implementation

{ TResult<T> }

class function TResult<T>.Ok(AValue: T; AMessage: string = '';
  AStatusCode: Integer = 0): TResult<T>;
begin
  Result.StatusCode := AStatusCode;
  Result.Success := True;
  Result.Message := AMessage;
  Result.Value := AValue;
end;

class function TResult<T>.Fail(AMessage: string;
  AStatusCode: Integer = 0): TResult<T>;
begin
  if (AStatusCode > 0) then
    Result.StatusCode := AStatusCode
  else
    Result.StatusCode := 500;
  Result.Success := False;
  Result.Message := AMessage;
  Result.Value := Default(T);
end;

end.
