*** Settings ***
Documentation        Acoes e elementos da Login Page

Library        Browser

*** Keywords ***
SignIn
    [Arguments]        ${EMAIL}    ${PASSWORD}
    Get Text        css=h1.font-robot    equal     Login

    Fill Text       id=email        ${EMAIL}
    Fill Text       id=password     ${PASSWORD}

    Click           css=button >> text=Entrar

    Sleep    5

Attempt signIn without success
    [Arguments]        ${OUTPUT_MESSAGE}

    Wait For Elements State    
    ...    css=div .alert
    ...    visible     5
    
    Get Text    css=div .alert > span    equals    ${OUTPUT_MESSAGE}

Access to signUp page
    Click    css=a.btn >> text=Cadastre-se
 