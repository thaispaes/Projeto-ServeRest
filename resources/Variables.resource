*** Settings ***
Documentation    Arquivo de variaveis 

Library    FakerLibrary

*** Variables ***
${name}
${email}
${password}

*** Keywords ***
Gerar Dados Falsos 
    ${name}    FakerLibrary.Name
    ${email}    FakerLibrary.Email
    ${password}    FakerLibrary.Password

    Set Global Variable    ${NAME}    ${name}
    Set Global Variable    ${EMAIl}    ${email}
    Set Global Variable    ${PASS}    ${password}