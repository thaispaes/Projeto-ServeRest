*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Library        Browser

*** Keywords ***
#Valida que acessou a pagina de cadastro
Validate access to signUp page 
    Get Text    css=h2.font-robot >> text=Cadastro

#Keyword responsável por realizar o cadastro de usuário 
Register
    [Arguments]    ${NAME}    ${EMAIL}    ${PASSWORD}    ${ADMIN}

    Validate access to signUp page

    Fill Text    id=nome        ${NAME}
    Fill Text    id=email       ${EMAIL}
    Fill Text    id=password    ${PASSWORD}

    IF   ${ADMIN} == True
        Click    css=input#administrador
        Click    css=button >> text=Cadastrar
    ELSE
        Click    css=button >> text=Cadastrar  
    END
    
#Essa keyword faz a validação das mensagems de alerta caso não preencha os dados corretamente
Validations
    [Arguments]        ${ALERT}

    Wait For Elements State    
    ...    css=div .alert
    ...    visible     5
    
    Get Text    css=div .alert > span    equals    ${ALERT}

#Keyword responsável por validar caso não os campos não sejam preenchidos
Attempt signUp
  [Arguments]    ${NAME}    ${EMAIL}    ${PASSWORD}    ${ADMIN}    ${OUTPUT_MSG}


   Register                    ${NAME}    ${EMAIL}    ${PASSWORD}    ${ADMIN}
   Validations           ${OUTPUT_MSG}   

