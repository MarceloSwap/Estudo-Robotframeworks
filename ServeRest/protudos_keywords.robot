*** Settings ***
Documentation            Keywords e Variaveis para Ações do Endpoint do Produto
Library          RequestsLibrary

*** Variables ***
${token_auth}           Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNzU2NjQ5MzIwLCJleHAiOjE3NTY2NDk5MjB9.05M-fva1zfh60pWIXVoYZzQIC3zy84DVD9BbZkXPbI0
${nome_produto}         XP-PEN
${preco_produto}        325
${descricao_produto}    Experiência natural com a caneta na tela: a tela usa a tecnologia de gravação AG
${qtd_produto}          5

*** Keywords ***
POST Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    &{payload}   Create Dictionary    nome=${nome_produto}    preco=${preco_produto}    descricao=${descricao_produto}    quantidade=${qtd_produto}
    ${response}  POST On Session    serverest    /produtos    data=${payload}    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}
