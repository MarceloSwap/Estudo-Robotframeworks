*** Settings ***
Documentation    Keywords e Variaveis para Ações do Endpoint do Usuarios
Library          RequestsLibrary

*** Variables ***
${username}      UserTest000
${email}         usertest000@mail.com.br
${password}      test000serverest


*** Keywords ***
GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

POST Endpoint /usuarios
    &{payload}    Create Dictionary    nome=UserTest000    email=usertest000@mail.com.br   password=test000serverest    administrador=true
    ${response}    POST On Session    serverest    /usuarios    json=${payload}
    Log To Console    Response: ${response.content}
    ${json}    To Json    ${response.content}
    ${id}    Set Variable    ${json["_id"]}
    Set Global Variable    ${id}
    Set Global Variable    ${response}

PUT Endpoint /usuarios
    &{payload}    Create Dictionary    nome=UserTest001    email=editado_001@mail.com.br    password=123    administrador=true
    ${response}    PUT On Session    serverest    /usuarios/${id}    json=${payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}    DELETE On Session    serverest    /usuarios/${id}
    Log To Console   Response: ${response.content}
    Set Global Variable    ${response}




