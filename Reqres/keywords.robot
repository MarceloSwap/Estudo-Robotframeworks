*** Settings ***
Resource    resource.robot
Documentation    Teste API reqres.in
Library          RequestsLibrary
Library          String
Library          Collections

*** Variables ***

*** Test Cases ***
Cenario: POST Cadastrar user
    [tags]    POST
    Criar Sessao
    Cria um usuario na sessao  
   ${resposta}=     POST Endpoint /users 
    Validar Status Code    201    ${resposta.status_code}

Cenario: POST logar um usuario
    [tags]    POST
    ${resposta}=    POST Endpoint /login
    Validar Status Code    200    ${resposta.status_code} 
    
Cenario: POST Permitir logout  
    [tags]    POST
    ${resposta_login}=    POST Endpoint /login
    ${resposta_logout}=    POST Endpoint /logout
    Validar Status Code    200    ${resposta_logout.status_code}

Cenario: GET Listar usuarios
    [tags]    GET
    ${resposta}=    GET Listar Usuarios
    Validar Status Code    200    ${resposta.status_code}

Cenario: GET Obter usuario por ID
    [tags]    GET
    ${resposta}=    GET Obter Usuario por ID    _id=1
    Validar Status Code    200    ${resposta.status_code}
    ${id}=    Get From Dictionary    ${resposta.json()}[data]    id
    Should Be Equal As Strings    ${id}    1


Cenario: PUT Atualizar usuario
    [tags]    PUT
    ${payload}=    Create Dictionary
    ...    name=user001
    ...    job=jogQA
    ${resposta}=    PUT Endpoint /users/id    id=1    payload=${payload}
    Validar Status Code    200    ${resposta.status_code}

Cenario: PUT Atualizar um resource
    [tags]    PUT
    ${payload}=    Create Dictionary
    ...    name=Maycon
    ...    job=QA
    ${resposta}=    PUT Endpoint /resources/id    resource=users    id=1    payload=${payload}
    Validar Status Code    200    ${resposta.status_code}


Cenario: DELETE Deletar usuario
    ${resposta}=    DELETE Endpoint /users/id    id=15
    Validar Status Code    204    ${resposta.status_code}







    
    