*** Settings ***
Documentation    Arquivo simples para requisições http em APIs
Library          RequestsLibrary

*** Variables ***
${nome_do_usuario}        UserTest001
${senha_do_usuario}       user123

*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    [tags]    GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${1}"
    Printar Conteudo Response

Cenario: POST Cadastrar Usuario 201
    [tags]    POST
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: PUT Editar Usuario 200
    [tags]    PUT
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"
    
Cenario: DELETE Deletar Usuario 200
    [tags]    DELETE
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200"

*** Keywords ***
Criar Sessao
    Create Session    serverest    https://compassuol.serverest.dev

GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

POST Endpoint /usuarios
    &{payload}    Create Dictionary    nome=${nome_do_usuario}    email=usertest_001@mail.com.br    password=${senha_do_usuario}    administrador=true
    ${response}    POST On Session    serverest    /usuarios    json=${payload}
    Log To Console    Response: ${response.content}
    ${json}    To Json    ${response.content}
    ${id}    Set Variable    ${json["_id"]}
    Set Global Variable    ${id}
    Set Global Variable    ${response}

PUT Endpoint /usuarios
    &{payload}    Create Dictionary    nome=UserTest001Ed2    email=editado_001@mail.com.br    password=123    administrador=true
    ${response}    PUT On Session    serverest    /usuarios/${id}    json=${payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}    DELETE On Session    serverest    /usuarios/${id}
    Log To Console   Response: ${response.content}
    Set Global Variable    ${response}

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

#Verifica a quantidade de usários cadastrados é igual a 2
Validar Quantidade "${quantidade}"
    Should Be Equal    ${response.json()["quantidade"]}    ${quantidade}
    
#Verifica se tem uma palavra no response
Validar Se Mensagem Contem "${palabra}"
    Should Contain    ${response.json()["message"]}    ${palabra}

Printar Conteudo Response
    Log To Console    ${response.json()}
    #pegar um usuario específico de acordo com o indice   
    Log To Console    ${response.json()["usuarios"][0]["nome"]}


    

#robot -d ./results .\base.robot - para escolher pra onde vai os resultados
#robot -d ./results -i GET base.robot - executa por tag
