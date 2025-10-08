unit n_GenericRepository_U;

interface

uses
  System.Generics.Collections, System.SysUtils,
  n_InterfaceRepository_U;

type
  TRepositoryListMemory<T: class, constructor> = class(TInterfacedObject, IRepository<T>)
  private
    FListaItens: TObjectList<T>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(_AItem: T);
    function GetAll(): TObjectList<T>;
    function FindById(_AId: Integer): T;
    procedure Update(_AIndex: Integer; _AItem: T);
  end;

implementation

{ TRepository<T> }

constructor TRepositoryListMemory<T>.Create;
begin
  FListaItens := TObjectList<T>.Create(True);
end;

destructor TRepositoryListMemory<T>.Destroy;
begin
  FListaItens.Free;
  inherited;
end;

procedure TRepositoryListMemory<T>.Add(_AItem: T);
begin
  FListaItens.Add(_AItem);
end;

function TRepositoryListMemory<T>.GetAll(): TObjectList<T>;
begin
  Result := FListaItens;
end;

procedure TRepositoryListMemory<T>.Update(_AIndex: Integer; _AItem: T);
begin
  FListaItens[_AIndex] := _AItem;
end;

function TRepositoryListMemory<T>.FindById(_AId: Integer): T;
begin
  if (FListaItens.Count > 0) then
    Result := FListaItens[_AId - 1]
  else
    Result := nil;
end;

end.
