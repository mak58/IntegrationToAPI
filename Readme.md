# 🧩 IntegrationToAPI

**IntegrationToAPI** é um projeto em **Delphi** que demonstra o uso de **injeção de dependência** com o **Spring4D**, seguindo uma arquitetura limpa e modular.  
O objetivo principal é receber um input, validá-lo e realizar uma integração REST para obter um serial (GUID), armazenando o resultado em um banco de dados em memória.

Disclaimer: 
Este projeto de teste é resultado de um projeto real colocado em produção numa aplicação híbrida Delphi 7-10.2;
A funcionalidade integra um sistema em andamento a uma busca por numeração regulatória em uma API externa.
Foi utilizado DI manual e devido ás praticas da app foi utilizado métodos de validação, Rest e Repository junto a classe de services.
Porém, eu queria aplicar boas práticas e arquitetura moderna, então decidi criar este projeto estudo baseado na mesma necessidade.

---

## 🚀 Funcionalidades

- ✅ Recebe um input e processa via handler
- ✅ Valida a entrada antes de prosseguir
- ✅ Realiza chamada REST para obter um serial (GUID)
- ✅ Armazena o resultado em um repositório em memória
- ✅ Utiliza injeção de dependência via **Spring4D**
- ✅ Arquitetura modular com separação entre camadas (`features`, `infra`, etc.)
- ✅ Testes unitários dedicados na pasta `tests`

---

## 🏗️ Estrutura do Projeto

A estrutura do projeto segue uma aboradagem **vertical slices**, facilitando a organização por recursos (features):

IntegrationToAPI/
│
├── src/
│ ├── features/
│ │ ├── GetSerial/
│ │ │ ├── GetSerial.Handler.pas
│ │ │ ├── GetSerial.Validation.pas
│ │ │ ├── GetSerial.Repository.pas
│ │ │ └── ...
│ │
│ ├── infra/
│ │ ├── Repository/
│ │ │ ├── GenericRepository.pas
│ │ │ └── InMemoryRepository.pas
│ │ └── ...
│ │
│ └── IntegrationToAPI.dpr
│
├── tests/
│ ├── GetSerialTests.pas
│ └── ...
│
├── boss.json
├── README.md
└── LICENSE

---

## 🧱 Arquitetura e Componentes Principais

### 🔹 `GetSerial` (Feature principal)
- **Handler**: Responsável por orquestrar o fluxo — recebe o input, chama o validador e o repositório.
- **Validation**: Executa as validações de entrada antes da chamada REST.
- **Repository**: Implementa um repositório que é **lazy loaded**, ou seja, é criado apenas quando sua propriedade é acessada pela primeira vez.

### 🔹 `Infra`
- Contém implementações genéricas e suporte de infraestrutura.
- Inclui um **repositório genérico** em memória usado para simular persistência de dados.

---

## 💉 Injeção de Dependência

A injeção de dependência é feita com o **Spring4D**.  
O container é configurado para resolver automaticamente as dependências entre as classes:

```delphi
TGetSerialHandler = class
private
  FValidator: ISerialValidator;
  FRepository: Lazy<ISerialRepository>;
public
  constructor Create(const AValidator: ISerialValidator; const ARepository: Lazy<ISerialRepository>);
  procedure Handle(const Input: string);
end;

* O validador e o repositório são injetados no ctor (construtor).

* O repositório é instanciado somente quando a propriedade é acessada.


🌐 Dependências

O projeto depende das seguintes bibliotecas:

Spring4D
 – Injeção de dependência e containers IoC.
    https://bitbucket.org/sglienke/spring4d/src/master/

RestFluent
 – Biblioteca de requisições REST fluente.

GenericRepository
 – Implementação genérica de repositórios em memória.

Essas dependências podem ser instaladas facilmente via BOSS

boss install github.com/mak58/RestClient
boss install github.com/mak58/GenericRepositoryListMemory

use path bellow on Delphi SearchPath;
..\..\Delphi-libs\spring4d\Source;
..\..\Delphi-libs\spring4d\Source\Base;
..\..\Delphi-libs\spring4d\Source\Base\Logging;
..\..\Delphi-libs\spring4d\Source\Base\Patches;
..\..\Delphi-libs\spring4d\Source\Base\Patterns;
..\..\Delphi-libs\spring4d\Source\Core\Container;
..\..\Delphi-libs\spring4d\Source\Core\Interception;
..\..\Delphi-libs\spring4d\Source\Core\Services;
..\..\Delphi-libs\spring4d\Source\Base\Collections;
..\..\Delphi-libs\RestClient\v12.1.2
..\..\Delphi-libs\GenericRepositoryListMemory

🧪 Testes

Os testes unitários estão localizados na pasta tests/ e cobrem:

Validação de entrada

Criação e persistência de serial

Integração entre handler, validador e repositório

Execute os testes diretamente do Delphi Test Insight ou via DUnitX.

⚙️ Execução
Clone o repositório:

git clone https://github.com/mak58/IntegrationToAPI.git
Abra o projeto no Delphi.

Compile e execute o projeto principal IntegrationToAPI.dpr.

Insira o input e acompanhe a integração REST retornando um GUID.


📖 Referência

Livro Injeção de dependência com Delphi - Nick Hodges
https://leanpub.com/dependencyinjectionindelphi

📜 Licença

Este projeto é licenciado sob a Apache License 2.0 — veja o arquivo LICENSE
 para mais detalhes.

✨ Autor

Desenvolvido por Marcio Koehler

💬 Contribuições, sugestões e PRs são bem-vindos!

UML

                                           +********************************************+
                                           |           TGetSerial  class                |
                                           |********************************************|
                                           | - FValidator: IValidateSerial              |
                                           | - FRepository: Lazy<ISerialRepository>     |
                                           | - FRestClient: TRestClient                 |
                                           |--------------------------------------------|
                                           | + Create(AValidator, ARepository)          |
                                           | + Handle(Input: string): void              |
                                           +********************************************+
                                                          |      ^
                                                          |      |
                                                          |      |
                                                          |      |
                                                          |      |  Lazy Injection
                                                          |      |
                                                          V      |
                                +********************************************+     
                                |          ISerialRepository (interface)     |     
                                |********************************************|     
                                | + Add(Serial: string): void                |     
                                | + GetAll(): TList<string>                  |     
                                +********************************************+     
                                                          ^
                                                          | Implements
                                                          |
                                                          |
                                +********************************************+
                                |        TInMemoryRepository class           |
                                |********************************************|
                                | - FData: TListObject<T>                     |
                                |--------------------------------------------|
                                | + Add(Serial: T): void               |
                                | + GetAll(): TListObject<T>                  |
                                +********************************************+

                                                          ^
                                                          |
                                                          | DI (ctor)
                                                          |
                                                          |
                                +********************************************+
                                |          TValidateSerial  class            |
                                |********************************************|
                                | Implements: IValidateSerial                |
                                |--------------------------------------------|
                                | + Validate(Input: string): Boolean         |
                                +********************************************+

                                                          ^
                                                          |
                                                          |  creates internally
                                                          |
                                                          |
                                +********************************************+
                                |             TRestClient  class             |
                                |********************************************|
                                | + MapGet(): TResult                      |
                                |--------------------------------------------|
                                | Custom class (not injected by DI)          |
                                +********************************************+


Input ──> TGetSerial ──> TValidateSerial ──> (validação ok?)
                                  │
                                  └──> TRestClient ──> GUID ──> Lazy<ISerialRepository>.Save()
