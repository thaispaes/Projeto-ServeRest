*** Settings ***
Documentation        Acoes e elementos da Store Page

Library        Browser

*** Keywords ***
Entry with success
    [Arguments]    ${admin}    ${name}
    Log    ${admin}
    IF    ${admin} == True
        Get Text    css=h1    equals    Bem Vindo ${name}
    ELSE
        Get Text    css=h1    equals    Serverest Store    
    END
    


