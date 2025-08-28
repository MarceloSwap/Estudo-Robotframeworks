*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                https://robotizandotestes.blogspot.com/
${BROWSER}            chrome
${BTN_PESQUISAR}      css=button.search-expand.touch-icon-button
${TITLE}              Robotizando Testes
${INPUT_PESQUISAR}    name=q
${SUBMIT_PESQUISAR}   css=input.search-action.flat-button
${LINK_POST}          xpath=//a[contains(text(), "Season Running - Ep. 08: Executando seus testes no Docker" )]
${IMG_ROBO}           xpath=//img[contains(@src,"R29vZ2xl")]

*** Keywords ***
Acessar a página do blog
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    ${TITLE}

Pesquisar por um post com "${TEXTO_PESQUISA}"
    Wait Until Element Is Visible    ${BTN_PESQUISAR}
    Click Button    ${BTN_PESQUISAR}
    Input Text      ${INPUT_PESQUISAR}    ${TEXTO_PESQUISA}
    Click Element   ${SUBMIT_PESQUISAR} 

Conferir mensagem de pesquisa por "${MSG_DESEJADA}"
    Page Should Contain    ${MSG_DESEJADA}

Acessar o post "${TEXTO_PESQUISA}"
    Pesquisar por um post com "${TEXTO_PESQUISA}"

Conferir se a imagem do robô aparece
    Page Should Contain Image    ${IMG_ROBO}

Conferir se o texto "${TEXTO_DESEJADO}" aparece
    Page Should Contain    ${TEXTO_DESEJADO}

Fechar o Navegador
    Close Browser
