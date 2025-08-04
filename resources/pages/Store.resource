*** Settings ***
Documentation        Acoes e elementos da Store Page

Library        Browser

*** Keywords ***
Validate entry with success
    Get Text    css=h1    equals    Serverest Store

Validate login with admin
    [Arguments]    ${name}
    Get Text    css=h1    equals    Bem Vindo ${name}