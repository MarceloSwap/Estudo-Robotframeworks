# Estudo Robot Framework

Repositório de estudos e projetos práticos com [Robot Framework](https://robotframework.org/), cobrindo testes de API REST e testes Web (UI). Criado para demonstrar domínio da ferramenta em diferentes contextos de automação de testes.

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-000000?style=flat&logo=robot-framework&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.13-3776AB?style=flat&logo=python&logoColor=white)
![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=flat&logo=selenium&logoColor=white)

---

## Pré-requisitos

- Python 3.8+
- Robot Framework 7+

```bash
pip install robotframework robotframework-requests robotframework-seleniumlibrary
```

Para testes Web: ChromeDriver instalado e compatível com a versão do Chrome instalada.

---

## Projetos

### 1. Reqres API (`/Reqres`)

Testes de API REST contra a API pública [reqres.in](https://reqres.in), cobrindo o ciclo completo de operações CRUD.

- Documentação interativa: https://reqres.in
- Gerenciamento de chaves: https://app.reqres.in/api-keys

| Método | Endpoint          | Cenário               | Tag    |
|--------|-------------------|-----------------------|--------|
| POST   | `/users`          | Cadastrar usuário     | `POST` |
| POST   | `/login`          | Realizar login        | `POST` |
| POST   | `/logout`         | Realizar logout       | `POST` |
| GET    | `/users`          | Listar usuários       | `GET`  |
| GET    | `/users/{id}`     | Obter usuário por ID  | `GET`  |
| PUT    | `/users/{id}`     | Atualizar usuário     | `PUT`  |
| PUT    | `/users/{id}`     | Atualizar resource    | `PUT`  |
| DELETE | `/users/{id}`     | Deletar usuário       | `DELETE` |

**Pré-requisito:** Gere uma chave gratuita em [app.reqres.in/api-keys](https://app.reqres.in/api-keys) e defina a variável de ambiente:

```bash
export REQRES_API_KEY=sua_chave_aqui
```

**Executar todos:**
```bash
robot -d Reqres/reports Reqres/keywords.robot
```

**Executar por tag:**
```bash
robot -d Reqres/reports -i GET Reqres/keywords.robot
robot -d Reqres/reports -i POST Reqres/keywords.robot
robot -d Reqres/reports -i PUT Reqres/keywords.robot
robot -d Reqres/reports -i DELETE Reqres/keywords.robot
```

---

### 2. ServeRest API (`/ServeRest`)

Testes de API REST contra a API pública [ServeRest](https://serverest.dev), com estrutura modular separada por domínio.

- Documentação / Swagger UI: https://serverest.dev/#/
- Repositório oficial: https://github.com/ServeRest/ServeRest

| Módulo     | Arquivo                   | Endpoints cobertos     | Tag           |
|------------|---------------------------|------------------------|---------------|
| Usuários   | `usuarios_keywords.robot` | GET, POST, PUT, DELETE | `GET` `POST` `PUT` `DELETE` |
| Login      | `login_keywords.robot`    | POST `/login`          | `POSTLOGIN`   |
| Produtos   | `produtos_keywords.robot` | POST `/produtos`       | `POSTPRODUTO` |
| Carrinho   | `carrinho_keywords.robot` | (em desenvolvimento)   | —             |

> O token de autenticação para produtos é obtido automaticamente via login antes de cada execução — não é necessário configurar variável de ambiente.

**Executar todos:**
```bash
robot -d ServeRest/base_reports ServeRest/base.robot
```

**Executar por tag:**
```bash
robot -d ServeRest/login_report -i POSTLOGIN ServeRest/base.robot
robot -d ServeRest/produto_report -i POSTPRODUTO ServeRest/base.robot
```

---

### 3. Blog Test (`/BlogTest`)

Testes Web (UI) com [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/) no blog [Robotizando Testes](https://robotizandotestes.blogspot.com/).

| Caso de Teste | Descrição                                   |
|---------------|---------------------------------------------|
| 01            | Pesquisar um post pelo título               |
| 02            | Acessar um post e validar conteúdo e imagem |

**Executar:**
```bash
robot -d BlogTest BlogTest/TestBlobTest.robot
```

---

### 4. Exemplos Didáticos

#### Estruturas de Controle (`/ExemplosEstruturas`)

Exemplos práticos das estruturas de controle do Robot Framework:

| Arquivo              | Conteúdo                        |
|----------------------|---------------------------------|
| `UsandoBlocosIF.robot` | IF, ELSE, ELSE IF aninhados   |
| `UsandoLogs.robot`   | Diferentes formas de log        |
| `UsandoLoops.robot`  | FOR loops (IN, IN RANGE, IN ENUMERATE) |
| `UsandoWhile.robot`  | WHILE loops                     |

```bash
robot ExemplosEstruturas/
```

#### Variáveis, Escopos e Argumentos (`/VariaveisEscoposArgumentos`)

| Arquivo                       | Conteúdo                                      |
|-------------------------------|-----------------------------------------------|
| `ExemplosTiposVariaveis.robot` | Tipos `${}`, `@{}`, `&{}`                   |
| `ExemplosEscoposVariaveis.robot` | Escopos: Test, Suite, Global, Local        |
| `ExemplosArgumentos.robot`    | Keywords com argumentos, retorno e dicionários |

```bash
robot VariaveisEscoposArgumentos/
```

#### Primeiro Teste (`/PrimeiroTesteComRobot`)

Projeto inicial com a estrutura mínima de um teste Robot Framework — ponto de partida para quem está começando.

```bash
robot PrimeiroTesteComRobot/
```

---

## Estrutura do Repositório

```
.
├── Reqres/                          # Testes API reqres.in
│   ├── keywords.robot               # Casos de teste (CRUD completo)
│   └── resource.robot               # Keywords e configurações de sessão
├── ServeRest/                       # Testes API ServeRest
│   ├── base.robot                   # Suite principal
│   ├── usuarios_keywords.robot      # Keywords de usuários
│   ├── login_keywords.robot         # Keywords de login
│   ├── produtos_keywords.robot      # Keywords de produtos
│   └── carrinho_keywords.robot      # Keywords de carrinho (em desenvolvimento)
├── BlogTest/                        # Testes Web (UI)
│   ├── TestBlobTest.robot           # Casos de teste
│   └── ResourceBlobTest.robot       # Keywords e locators
├── ExemplosEstruturas/              # Exemplos de IF, loops e logs
├── VariaveisEscoposArgumentos/      # Exemplos de variáveis e argumentos
├── PrimeiroTesteComRobot/           # Hello World Robot Framework
└── VideosExemplos/                  # Exemplos de vídeos/tutoriais
```

---

## Variáveis de Ambiente

| Variável        | Projeto | Descrição                                              |
|-----------------|---------|--------------------------------------------------------|
| `REQRES_API_KEY` | Reqres  | Chave de API gerada em [app.reqres.in/api-keys](https://app.reqres.in/api-keys) |
