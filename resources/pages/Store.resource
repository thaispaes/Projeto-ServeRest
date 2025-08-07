*** Settings ***
Documentation        Acoes e elementos da Store Page

Library        Browser

*** Keywords ***
Entry with success
    Get Text    css=h1    equals    Serverest Store

login application with admin
    [Arguments]    ${name}
    Get Text    css=h1    equals    Bem Vindo ${name}