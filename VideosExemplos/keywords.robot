*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://compass.uol/
${BROWSER}       chrome
${CLIQUE_MENU1}    xpath=//a[contains(text(), "Innovation Studios" )]

*** Test Cases ***
Validar acesso e clique em menu
    Acessar Site
    Clicar em "Innovation Studios"
    Close All Browsers

*** Keywords ***
Acessar Site
    Open Browser    ${URL}    ${BROWSER}

Clicar em "Innovation Studios"
    Click Element    ${CLIQUE_MENU1}