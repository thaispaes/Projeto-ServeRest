*** Settings ***
Documentation    Arquivo de variaveis 

Library    FakerLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    Collections
Library    BuiltIn

Library    ./scripts/saveFile.py


*** Variables ***
${name}
${email}
${password}
${admin}
${file}    users.json

*** Keywords ***
Generate fake data
    ${name}    FakerLibrary.Name
    ${email}    FakerLibrary.Email
    ${password}    FakerLibrary.Password
    ${admin}    FakerLibrary.Boolean

    Set Global Variable    ${NAME}    ${name}
    Set Global Variable    ${EMAIL}    ${email}
    Set Global Variable    ${PASS}    ${password}
    Set Global Variable    ${ADMIN}    ${admin}

Save data in json file
    ${ACCOUNT}=    Create Dictionary    name=${NAME}    email=${EMAIL}    password=${PASS}    admin=${ADMIN}
    Save_users    ${ACCOUNT}

Read data in json file
    ${qtdIndex}=    Count_users
    Log    ${qtdIndex}

    ${user}    Load Json From File    ${file}
    ${index}=     Evaluate    random.randint(0, ${qtdIndex}-1)    random
    Log    ${index}

    ${name_saved}    Get From Dictionary    ${user[${index}]}    name
    ${email_saved}    Get From Dictionary    ${user[${index}]}    email
    ${password_saved}    Get From Dictionary    ${user[${index}]}    password
    ${admin_saved}    Get From Dictionary    ${user[${index}]}    admin


    Set Global Variable    ${NAME_SAVE}    ${name_saved}
    Set Global Variable    ${EMAIL_SAVE}    ${email_saved}
    Set Global Variable    ${PASS_SAVE}    ${password_saved}
    Set Global Variable    ${ADMIN_SAVE}    ${admin_saved}

    