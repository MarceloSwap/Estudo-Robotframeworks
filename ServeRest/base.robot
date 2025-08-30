*** Settings ***
Documentation    Arquivo simples para requisições http em APIs
Library          RequestsLibrary

*** Variables ***

*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST Cadastrar Usuario 201
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenario: PUT Editar Usuario 200
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"
    
Cenario: DELETE Deletar Usuario 200
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
    &{payload}    Create Dictionary    nome=UserTest002    email=usertest_001@ail.com.br    password=123    administrador=true
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
