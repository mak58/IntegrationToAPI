# 🧠 TRepositoryListMemory<T>

Uma implementação **genérica de repositório em memória** desenvolvida em **Delphi**, que segue o padrão de repositório (*Repository Pattern*).  
Essa classe facilita o armazenamento, manipulação e recuperação de objetos durante a execução da aplicação, sem a necessidade de persistência em banco de dados.

---

## 🚀 Objetivo

A `TRepositoryListMemory<T>` foi criada para dois principais cenários:

1. **Projetos de estudo:** Permitir testar a arquitetura de camadas, 
    injeção de dependência e padrões de repositório, sem precisar configurar banco de dados.
2. **Aplicações em tempo de execução:** Gerenciar listas temporárias de objetos 
    (ex.: buffers, cache, cadastros momentâneos) mantendo um código limpo e reutilizável.

---

## 🧩 Estrutura

```delphi
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

🗂️ Principais Métodos

Método	                            Descrição
Add(_AItem: T)	                    Adiciona um novo objeto do tipo T na lista.
GetAll()	                          Retorna todos os itens armazenados.
FindById(_AId: Integer)	            Localiza um item pelo identificador (Id).
Update(_AIndex: Integer; _AItem: T)	Atualiza o item no índice informado.
Delete(_AId: Integer)	              Remove um item com base no seu Id.

⚙️ Observação: Para que FindById e Delete funcionem corretamente, 
    o tipo T deve possuir uma propriedade Id: Integer.

🧠 Exemplo de Uso

type
  TUser = class
  public
    Id: Integer;
    Name: string;
  end;

var
  Repo: IRepository<TUser>;
  User: TUser;
begin
  Repo := TRepositoryListMemory<TUser>.Create;

  // Adicionando
  User := TUser.Create;
  User.Id := 1;
  User.Name := 'João';
  Repo.Add(User);

  // Buscando
  ShowMessage(Repo.FindById(1).Name); // Resultado: João

  // Atualizando
  User := TUser.Create;
  User.Id := 1;
  User.Name := 'Maria';
  Repo.Update(0, User);

  // Listando
  for var U in Repo.GetAll do
    ShowMessage(U.Name);

  // Excluindo
  Repo.Delete(1);
end;


🧱 Benefícios

💡 Reuso: Um único repositório genérico serve para qualquer classe.

🧪 Ideal para testes e protótipos.

🔄 Fácil integração com injeção de dependência (Spring4D, por exemplo).

🧰 Substituível futuramente por um repositório persistente (ex.: banco de dados) 
    sem alterar as camadas superiores.

📦 Integração com Interfaces

A classe implementa IRepository<T>, o que facilita a substituição por outras implementações 
    (por exemplo, TRepositoryDatabase<T>).
Isso promove baixo acoplamento e alta testabilidade da aplicação.

📜 Licença

Este projeto é licenciado sob a Apache License 2.0 — veja o arquivo LICENSE
para mais detalhes.

👨‍💻 Autor

Marcio Koehler
💼 Desenvolvedor Delphi
📧 marcio_koehler.@live.com
