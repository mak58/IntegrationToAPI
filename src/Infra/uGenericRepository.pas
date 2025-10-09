unit uGenericRepository;

interface

uses
  System.Generics.Collections, System.SysUtils,
  uInterfaceRepository;

type
/// <summary>
///   This is an implementation of memory Repository pattern with TObjectList;
///   It's a good implementation to simulate a Database for study or test's projects.
///  Copyright (C) 2025 Marcio Koehler
/// </summary>

  TRepositoryListMemory<T: class, constructor> = class(TInterfacedObject, IRepository<T>)
  private
    FListItems: TObjectList<T>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(_AItem: T);
    function GetAll(): TObjectList<T>;
    function FindById(_AId: Integer): T;
    procedure Update(_AIndex: Integer; _AItem: T);
    procedure Delete(_AId: Integer);
  end;

implementation

{ TRepositoryListMemory<T> }

constructor TRepositoryListMemory<T>.Create;
begin
  FListItems := TObjectList<T>.Create(True);
end;

destructor TRepositoryListMemory<T>.Destroy;
begin
  FListItems.Free;
  inherited;
end;

procedure TRepositoryListMemory<T>.Add(_AItem: T);
begin
  FListItems.Add(_AItem);
end;

function TRepositoryListMemory<T>.GetAll(): TObjectList<T>;
begin
  Result := FListItems;
end;

procedure TRepositoryListMemory<T>.Update(_AIndex: Integer; _AItem: T);
begin
  FListItems[_AIndex] := _AItem;
end;

function TRepositoryListMemory<T>.FindById(_AId: Integer): T;
begin
  if (FListItems.Count > 0) then
    Result := FListItems[_AId - 1]
  else
    Result := nil;
end;

procedure TRepositoryListMemory<T>.Delete(_AId: Integer);
begin
  FListItems.Delete(_AId);
end;

end.
