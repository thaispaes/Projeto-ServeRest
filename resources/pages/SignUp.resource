*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Library        Browser

*** Keywords ***
Validate access to correct page 
    Get Text    css=h2.font-robot >> text=Cadastro

Register
    [Arguments]    ${name}    ${email}    ${password}    ${admin}

    Validate access to correct page

    Fill Text    id=nome        ${name}
    Fill Text    id=email       ${email}
    Fill Text    id=password    ${password}

    IF   ${admin} == True
        Click    css=input#administrador
        Click    css=button >> text=Cadastrar
    ELSE
        Click    css=button >> text=Cadastrar  
    END

Validations
    [Arguments]        ${alert}

    Wait For Elements State    
    ...    css=div .alert
    ...    visible     5
    
    Get Text    css=div .alert > span    equals    ${alert}

Attempt signUp
  [Arguments]    ${name}    ${email}    ${password}    ${admin}    ${output_message}


   Register                    ${name}    ${email}    ${password}    ${admin}
   Validations           ${output_message}   

