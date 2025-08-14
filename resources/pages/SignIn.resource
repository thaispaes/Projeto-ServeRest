*** Settings ***
Documentation        Acoes e elementos da Login Page

Library        Browser

*** Keywords ***
SignIn
    [Arguments]        ${email}    ${password}
    Get Text        css=h1.font-robot    equal     Login

    Fill Text       id=email        ${email}
    Fill Text       id=password     ${password}

    Click           css=button >> text=Entrar

    Sleep    20

Attempt signIn without success
    [Arguments]        ${output_message}

    Wait For Elements State    
    ...    css=div .alert
    ...    visible     5
    
    Get Text    css=div .alert > span    equals    ${output_message}

Access to signUp page
    Click    css=a.btn >> text=Cadastre-se
 