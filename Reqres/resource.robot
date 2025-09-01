*** Settings ***
Library       RequestsLibrary
Library       String
Library       Collections


*** Keywords ***
Cria um usuario na sessao
    Set Test Variable    ${EMAIL_TESTE}    user0011@mail.com

Criar Sessao
    ${headers}    Create Dictionary
    ...           accept=application/json
    ...           Content-Type=application/json
    ...           x-api-key=reqres-free-v1
    Create Session
    ...           alias=reqres_api
    ...           url=https://reqres.in/api
    ...           headers=${headers}

POST Endpoint /users
    Cria um usuario na sessao  
    &{payload}=    Create Dictionary
    ...           username=user0001
    ...           email=${EMAIL_TESTE}  
    ...           password=teste0001
    log to console    ${payload}
    Criar Sessao

    ${response}=    POST On Session
    ...             alias=reqres_api
    ...             url=/users
    ...             json=${payload}

    ${ID_USUARIO}=    Get From Dictionary    ${response.json()}    id
    Set Test Variable    ${ID_USUARIO}
    RETURN    ${response}
Validar Status Code
    [Arguments]    ${status_code_esperado}    ${status_code_recebido}
    [Documentation] 
    Should Be True    ${status_code_recebido} == ${status_code_esperado}

POST Endpoint /register "user001@mail.com"
    [Documentation]
    Criar Sessao
    ${payload}=    Create Dictionary    
    ...         email=user001@mail.com    
    ...         password=teste123
    ${reposta}=    POST On Session    
    ...            reqres_api    
    ...            /register    json=${payload}
    Status Should Be    
    ...    200    ${reposta}
    ${token}=    Get From Dictionary    
    ...    ${reposta.json()}    token
    Log To Console    Token gerado: ${token}
    Should Not Be Empty    ${token}
    RETURN    ${reposta}

POST Endpoint /login
    [Documentation]
    &{payload}=    Create Dictionary
    ...           email=eve.holt@reqres.in
    ...           password=teste123
    Criar Sessao
    ${response}=    POST On Session
    ...             alias=reqres_api
    ...             url=/login
    ...             json=${payload}
    ${token}=    Get From Dictionary    ${response.json()}    token
    Should Not Be Empty    ${token}
    Log To Console    Token gerado: ${token}
    RETURN    ${response}

POST Endpoint /logout
    [Documentation]    
    Criar Sessao
    &{payload}=    Create Dictionary
    ${response}=    POST On Session
    ...             alias=reqres_api
    ...             url=/logout
    ...             json=${payload}
    RETURN    ${response}



GET Listar Usuarios
    Criar Sessao
    ${response}=    GET On Session    
    ...            alias=reqres_api    
    ...            url=/users
    RETURN    ${response}

GET Obter Usuario por ID
    [Arguments]    ${_id}
    Criar Sessao
    ${response}=    GET On Session    
    ...            alias=reqres_api   
    ...            url=/users/${_id}
    RETURN    ${response}



PUT Endpoint /users/id
    [Documentation]  
    [Arguments]    ${id}    ${payload}
    Criar Sessao
    ${response}=    PUT On Session
    ...    alias=reqres_api
    ...    url=/users/${id}
    ...    json=${payload}
    RETURN    ${response}



PUT Endpoint /resources/id 
   [Arguments]    ${resource}    ${id}    ${payload}
    Criar Sessao
    ${response}=    PUT On Session
    ...    alias=reqres_api
    ...    url=/${resource}/${id}
    ...    json=${payload}
    RETURN    ${response}


DELETE Endpoint /users/id
    [Documentation]    
    [Arguments]    ${id}
    Criar Sessao
    ${response}=    DELETE On Session    
    ...    alias=reqres_api    
    ...    url=/users/${id}
    RETURN    ${response}


DELETE Endpoint /resource/id    
     [Documentation]    
    [Arguments]    ${id}    ${resource}    
    Criar Sessao
    ${response}=    DELETE On Session    
    ...    alias=reqres_api    
    ...    url=/{resource}/${id}
    RETURN    ${response}




