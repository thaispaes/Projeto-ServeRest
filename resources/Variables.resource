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
${admin}
${file}    dados.json

*** Keywords ***
Generate fake data
    ${name}    FakerLibrary.Name
    ${email}    FakerLibrary.Email
    ${password}    FakerLibrary.Password
    ${admin}    FakerLibrary.Boolean

    Set Global Variable    ${NAME}    ${name}
    Set Global Variable    ${EMAIl}    ${email}
    Set Global Variable    ${PASS}    ${password}
    Set Global Variable    ${ADMIN}    ${admin}

Save data in json file
    
    ${created}=    Run Keyword And Ignore Error    File Should Exist    dados.json
    IF    ${created} == 'FAIL'
        ${json}=    Load Json From File    ${file}
        Add Object To Json    ${json}    ${file}    {"name": "${NAME}", "email": "${EMAIL}", "password": "${PASS}", "Admin": "${ADMIN}"}
   
    ELSE
        Create File    ${file}    {"name": "${NAME}", "email": "${EMAIL}", "password": "${PASS}, "Admin: "${ADMIN}}    
    END
    Log    Dados:${NAME},${EMAIl},${PASS} 

Read data in json file
    ${dados}    Load Json From File    dados.json
    ${name_saved}    Get From Dictionary    ${dados}    name
    ${email_saved}    Get From Dictionary    ${dados}    email
    ${password_saved}    Get From Dictionary    ${dados}    password

    Log    ${name_saved} ${email_saved} ${password_saved}

    Set Global Variable    ${NAME_SAVE}    ${name_saved}
    Set Global Variable    ${EMAIL_SAVE}    ${email_saved}
    Set Global Variable    ${PASS_SAVE}    ${password_saved}

    