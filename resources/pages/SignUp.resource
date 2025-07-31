*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Library        Browser

*** Keywords ***
Validate access to correct page 
    Get Text    css=h2.font-robot >> text=Cadastro

Register
    [Arguments]    ${name}    ${email}    ${password}

    Validate access to correct page

    Fill Text    id=nome        ${name}
    Fill Text    id=email       ${email}
    Fill Text    id=password    ${password}

    Click    css=button >> text=Cadastrar



