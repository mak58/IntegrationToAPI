unit uGetSerialRegistryAPIRepository_UTest;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TTestRepositoryRegistryAPI = class
  public

  [SetupFixture]
  procedure Setup();

  [TearDownFixture]
  procedure TearDown();

  [Test]
  procedure RepositoryRegistryAPI_AddSuccesfully_AddObjectToDatabase();

  [Test]
  procedure RepositoryRegistryAPI_MustRaiseAddWithNilObject_AddObjectToDatabase();

  [Test]
  procedure RepositoryRegistryAPI_GetItem_GettAll();

  [Test]
  procedure RepositoryRegistryAPI_GetById_GetObjectByIndex();
  end;

implementation

uses
  uRegistryAPI,
  System.SysUtils,
  uGenericRepository, uInterfaceRepository;

  var
  registry: TRegistryAPI;
  repository: IRepository<TRegistryAPI>;

{ TTestRepositoryRegistryAPI }

procedure TTestRepositoryRegistryAPI.Setup();
begin
  registry := TRegistryAPI.Create('0100',
    '3f1a9b2e-6c4d-4f8b-9a2d-1e5b7c3f0a9d',
    now);

  repository := TRepositoryListMemory<TRegistryAPI>.Create();
end;

procedure TTestRepositoryRegistryAPI.TearDown();
begin
  registry.Free;
end;

procedure TTestRepositoryRegistryAPI.RepositoryRegistryAPI_AddSuccesfully_AddObjectToDatabase();
begin
/// <summary>
///   Using registry and repository Object reuseble;
/// </summary>
  // assert
  Assert.WillNotRaise(
    procedure
    begin
      // act
      repository.Add(registry)
    end,
    EAddingErrorException,
    ADD_ERROR);
end;

procedure TTestRepositoryRegistryAPI.RepositoryRegistryAPI_MustRaiseAddWithNilObject_AddObjectToDatabase();
begin
  // assert
  Assert.WillRaise(
    procedure
    begin
      // act
      repository.Add(nil)
    end,
    EAddingErrorException,
    ADD_ERROR);
end;

procedure TTestRepositoryRegistryAPI.RepositoryRegistryAPI_GetItem_GettAll();
begin
  // arrange
  registry := TRegistryAPI.Create('0200',
    '5l3a8e2t-2c5s-4f9y-5a2d-9e5b0c3c0a9m',
    now);

  // act
  repository.Add(registry);
  var list := repository.GetAll().Count;

  // assert
  Assert.IsTrue(list > 0, 'Hello World');
end;

procedure TTestRepositoryRegistryAPI.RepositoryRegistryAPI_GetById_GetObjectByIndex();
begin
  // arrange
  registry := TRegistryAPI.Create('0300',
    '8l4a8e9t-3c7s-4f8y-4a7d-8e3b0c6c7a1m',
    now);

  // act
  repository.Add(registry);
  var list := repository.GetAll().Count;
  var id := repository.FindById(list);

  // assert
  Assert.AreEqual(id.ID, '0300');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestRepositoryRegistryAPI);

end.
