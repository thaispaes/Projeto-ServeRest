*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Library        Browser

*** Keywords ***
Validate access to signUp page 
    Get Text    css=h2.font-robot >> text=Cadastro

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
    

Validations
    [Arguments]        ${ALERT}

    Wait For Elements State    
    ...    css=div .alert
    ...    visible     5
    
    Get Text    css=div .alert > span    equals    ${ALERT}

Attempt signUp
  [Arguments]    ${NAME}    ${EMAIL}    ${PASSWORD}    ${ADMIN}    ${OUTPUT_MSG}


   Register                    ${NAME}    ${EMAIL}    ${PASSWORD}    ${ADMIN}
   Validations           ${OUTPUT_MSG}   

