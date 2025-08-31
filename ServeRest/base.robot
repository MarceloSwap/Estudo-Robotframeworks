*** Settings ***
Documentation    Arquivo base para estudo do Robotframeworks para teste de APIs
Library          RequestsLibrary
Resource         ./usuarios_keywords.robot
Resource         ./login_keywords.robot
Resource         ./protudos_keywords.robot

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

Cenario: POST Realizar Login 200
    [tags]    POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenario: POST Cadastrar Produto 201
    [tags]    POSTPRODUTO
    Criar Sessao
    POST Endpoint /produtos
    Validar Status Code "201"

*** Keywords ***
Criar Sessao
    Create Session    serverest    https://compassuol.serverest.dev

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

#Rodar o login: robot -d ./login_report -i POSTLOGIN base.robot
