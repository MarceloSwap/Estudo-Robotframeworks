*** Settings ***
Documentation            Keywords e Variaveis para Ações do Endpoint do Produto
Library          RequestsLibrary

*** Variables ***
${nome_produto}         XP-PEN
${preco_produto}        325
${descricao_produto}    Experiência natural com a caneta na tela: a tela usa a tecnologia de gravação AG
${qtd_produto}          5

*** Keywords ***
POST Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${TOKEN_LOGIN}
    &{payload}   Create Dictionary    nome=${nome_produto}    preco=${preco_produto}    descricao=${descricao_produto}    quantidade=${qtd_produto}
    ${response}  POST On Session    serverest    /produtos    json=${payload}    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}
