"""*** Test Cases ***
Cenário: GET Todos os Usuarios 200
    GET Endpoint /Usuarios
    Validar Todos os Usuaros na Response
    Validar Status Code "200"

Cenário: GET Usuario Especifico 200
    GET Endpoint /usuarios com id "/GTTTwearsdw223"
    Validar o Usuario com id "/GTTTwearsdw223"
    Validar Status Code "200"
    Validar Mensagem "Nome = Fulando da Silva"

Cenário: POST Criar Novo Usuario 201
    Criar Usuário Dinâmico
    POST Usuario Dinâmico no Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenário: PUT Editar Usuario Existente 200
    PUT Editar Usuário com id "GTTTwearsdw223" usando os Dados Dinâmicos
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenário: DELETE Usuário Existente 200
    DELETE Usuário Específico com id "/GTTTwearsdw223"
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso | Nenhum registro excluído"


"""