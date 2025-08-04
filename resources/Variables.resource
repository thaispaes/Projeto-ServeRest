*** Settings ***
Documentation    Arquivo de variaveis 

Library    FakerLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    Collections


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

Salvar Dados em Arquivo
    Create File    dados.json    {"name": "${NAME}", "email": "${EMAIL}", "password": "${PASS}"}

Ler Dados do Arquivo
    ${dados}    Load Json From File    dados.json
    ${name_saved}    Get From Dictionary    ${dados}    name
    ${email_saved}    Get From Dictionary    ${dados}    email
    ${password_saved}    Get From Dictionary    ${dados}    password

    Set Global Variable    ${NAME_SAVE}    ${name_saved}
    Set Global Variable    ${EMAIL_SAVE}    ${email_saved}
    Set Global Variable    ${PASS_SAVE}    ${password_saved}

    