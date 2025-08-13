*** Settings ***
Documentation        Acoes e elementos da Store Page

Library        Browser

Resource    ../Variables.resource

*** Keywords ***

Access register users
    Click    css=[data-testid="cadastrarUsuarios"]    

Register user
    [Arguments]    ${name}    ${email}    ${password}    ${admin}

    Fill Text    id=nome        ${name}
    Fill Text    id=email       ${email}
    Fill Text    id=password    ${password}

    IF   ${admin} == True
        Click    css=input#administrador
        Click    css=button >> text=Cadastrar
    ELSE
        Click    css=button >> text=Cadastrar  
    END

    Set Suite Variable    ${NAME_CREATED}    ${name}

Validate register with success
    Get Text    css=h1    equals    Lista dos usuários
    Get Text    css=td >> text=${NAME_CREATED}