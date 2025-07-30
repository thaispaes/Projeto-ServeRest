*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Library        Browser

*** Keywords ***
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