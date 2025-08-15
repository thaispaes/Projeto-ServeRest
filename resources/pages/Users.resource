*** Settings ***
Documentation        Acoes e elementos da Store Page

Library        Browser

Resource    ../Variables.resource

*** Variables ***
${NAME_CREATED}

*** Keywords ***
#Valida que acessou a pagina de cadastro
Access register users
    Click    css=[data-testid="cadastrarUsuarios"]    

#Keyword responsável por realizar o cadastro de usuário 
Register user
    [Arguments]    ${NAME}    ${EMAIL}    ${PASSWORD}    ${ADMIN}

    Fill Text    id=nome        ${NAME}
    Fill Text    id=email       ${EMAIL}
    Fill Text    id=password    ${PASSWORD}

    IF   ${ADMIN} == True
        Click    css=input#administrador
        Click    css=button >> text=Cadastrar
    ELSE
        Click    css=button >> text=Cadastrar  
    END

    Save data in json file
    Sleep    20

    Set Suite Variable    ${NAME_CREATED}    ${NAME}

#Valida se o usuario foi criado com sucesso
Validate register with success
    Get Text    css=h1    equals    Lista dos usuários
    Get Text    css=td >> text=${NAME_CREATED}