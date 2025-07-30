*** Settings ***
Documentation        Teste para acessar a tela inicial da ServeRest no WebApp e validar o slogan

Library        Browser


*** Test Cases ***
Deve iniciar o login do cliente 
    ${account}        Create Dictionary
    ...        email=thaisregina1901@gmail.com
    ...        password=Thais123
    

   Acessar navegador
   Realizar login na aplicacao    ${account}

Deve negar acesso devido ao email vazio
    ${account}        Create Dictionary
    ...        email=${EMPTY}
    ...        password=Thais123

    Acessar navegador
    Realizar login na aplicacao    ${account}
    Validar alerta de campo vazio        Email é obrigatório 


*** Keywords ***
Acessar navegador 
    New Browser     browser=chromium    headless=False
    New Page        https://front.serverest.dev/login

Realizar login na aplicacao
    [Arguments]        ${account}  
    Get Text        css=h1.font-robot    equal     Login

    Fill Text       id=email        ${account}[email]
    Fill Text       id=password     ${account}[password]

    Click           css=button >> text=Entrar

    Sleep    10

Validar alerta de campo vazio
    [Arguments]        ${alerta}

    Wait For Elements State    
    ...    css=div .alert
    ...    visible     5
    
    Get Text    css=div .alert > span    equals    ${alerta}