*** Settings ***
Documentation            Keywords e Variaveis para Ações do Endpoint do Login
Library          RequestsLibrary

*** Variables ***
${email_para_loggin}        fulano@qa.com
${password_para_login}     teste


*** Keywords ***
POST Endpoint /login
    &{payload}    Create Dictionary    email=${email_para_loggin}    password=${password_para_login}
    ${response}    POST On Session    serverest    /login    data=${payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}