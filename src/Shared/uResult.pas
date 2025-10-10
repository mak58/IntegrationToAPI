unit uResult;

interface

/// <summary>
///   Result Pattern to revert back result,messages and Data;
/// </summary>
///
type
  TResult<T> = record
    Success: Boolean;
    &Message: string;
    Value: T;

    class function Ok(AValue: T; AMessage: string = ''): TResult<T>; static;
    class function Fail(AMessage: string): TResult<T>; static;
  end;

implementation

{ TResult<T> }

class function TResult<T>.Ok(AValue: T; AMessage: string = ''): TResult<T>;
begin
  Result.Success := True;
  Result.Message := AMessage;
  Result.Value := AValue;
end;

class function TResult<T>.Fail(AMessage: string): TResult<T>;
begin
  Result.Success := False;
  Result.Message := AMessage;
  Result.Value := Default(T);
end;

end.
