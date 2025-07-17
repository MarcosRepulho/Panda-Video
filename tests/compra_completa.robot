*** Settings ***
Documentation       Teste automatizado de compra completa no Saucedemo
Library               SeleniumLibrary
Resource              ../resources/elementos.robot

*** Test Cases ***
TC01 - Compra Completa com Sucesso
    [Documentation]   Realiza login, adiciona produto ao carrinho e finaliza a compra
    Open Browser To Login Page
    Realizar Login
    Adicionar Produto ao Carrinho
    Finalizar Compra

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id=user-name    timeout=10s

Realizar Login
    Input Text      user-name    ${USERNAME}
    Input Text      password     ${PASSWORD}
    Click Button    login-button
    Wait Until Element Is Visible    id=inventory_container

Adicionar Produto ao Carrinho
    Click Element    xpath=//div[text()='${PRODUTO}']/../../..//button
    Click Element    class:shopping_cart_link
    Capture Page Screenshot   # Verifica se está na página do carrinho
Finalizar Compra
    # Ir para checkout
    Click Element    id=checkout
    Location Should Be    https://www.saucedemo.com/checkout-step-one.html 

    # Preencher dados com esperas
    Wait Until Element Is Visible    id=first-name    timeout=10s
    Input Text    id=first-name    ${NOME}
     Capture Page Screenshot   # Vê como está a tela antes da validação
    Textfield Value Should Be    id=first-name    ${NOME}

    Wait Until Element Is Visible    id=last-name    timeout=20s
    Input Text    id=last-name    ${SOBRENOME}
    Textfield Value Should Be    id=last-name    ${SOBRENOME}

    Input Text    id=postal-code   ${CEP}
    Textfield Value Should Be    id=postal-code   ${CEP}

    # Garantir que o botão Continue esteja clicável
    Wait Until Element Is Visible    id=continue    timeout=10s
    Wait Until Element Is Enabled    id=continue    timeout=10s
    Click Element    id=continue

    # Valida navegação para step two
    Location Should Be    https://www.saucedemo.com/checkout-step-two.html 

    # Clicar em Finish
    Click Element    id=finish

    # Aguardar página final
    Wait Until Location Is    https://www.saucedemo.com/checkout-complete.html     timeout=10s
    Wait Until Element Is Visible    css=.complete-header    timeout=10s

    # Validar finalização
    Page Should Contain    Thank you for your order!