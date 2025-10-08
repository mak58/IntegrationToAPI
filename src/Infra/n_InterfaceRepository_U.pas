unit n_InterfaceRepository_U;

interface

uses
  System.Generics.Collections;

type
  IRepository<T: class> = interface
    ['{07FBF5EA-3862-4EA7-8A2D-6DD1FBC4C7A1}']
    procedure Add(_AItem: T);
    function GetAll: TObjectList<T>;
    function FindById(_AId: Integer): T;
    procedure Update(_AIndex: Integer; _AItem: T);
  end;

implementation

end.
