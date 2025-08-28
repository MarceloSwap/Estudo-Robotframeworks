*** Settings ***
Resource  ResourceBlobTest.robot

*** Test Cases ***
Caso de Teste 01: Pesquisar um post
    Acessar a página do blog
    Pesquisar por um post com "Season Running - Ep. 08: Executando seus testes no Docker"
    Conferir mensagem de pesquisa por "Mostrando postagens que correspondem à pesquisa por Season Running - Ep. 08: Executando seus testes no Docker"
    Fechar o Navegador

Caso de Teste 02: Ler um post
    Acessar a página do blog
    Acessar o post "Season Running - Ep. 08: Executando seus testes no Docker"
    Conferir se a imagem do robô aparece
    Conferir se o texto "Olááá robotizadores!" aparece
    Conferir mensagem de pesquisa por "Mostrando postagens que correspondem à pesquisa por Season Running - Ep. 08: Executando seus testes no Docker"
    Fechar o Navegador
