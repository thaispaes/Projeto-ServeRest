*** Settings ***
Documentation        Acoes e elementos da Login Page

Library        Browser

*** Keywords ***

#Keyword responsável por fazer login com sucesso na aplicação 
SignIn
    [Arguments]        ${EMAIL}    ${PASSWORD}
    Get Text        css=h1.font-robot    equal     Login

    Fill Text       id=email        ${EMAIL}
    Fill Text       id=password     ${PASSWORD}

    Click           css=button >> text=Entrar

    Sleep    5

#Valida as mensagens de alerta quando preenchemos um campo incorretamente 
Attempt signIn without success
    [Arguments]        ${OUTPUT_MESSAGE}

    Wait For Elements State    
    ...    css=div .alert
    ...    visible     5
    
    Get Text    css=div .alert > span    equals    ${OUTPUT_MESSAGE}

#Responsável por seguir para pagina de cadastro de usuários
Access to signUp page
    Click    css=a.btn >> text=Cadastre-se
 