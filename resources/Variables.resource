*** Settings ***
Documentation    Arquivo de variaveis 

Library    FakerLibrary
Library    JSONLibrary
Library    Collections

Library    ./scripts/saveFile.py

*** Variables ***
${FAKE_NAME}
${FAKE_EMAIL}
${FAKE_PASS}
${ADMIN_FLAG}

${NAME}
${EMAIL}
${PASS}
${ADMIN}

${NAME_SAVED}
${EMAIL_SAVED}
${PASS_SAVED}
${ADMIN_SAVED}

${JSON_FILE}    users.json

## Admin Validations
${IS_NOT_ADMIN}    False
${IS_ADMIN}    True
${ADMIN_EMAIL}    
${ADMIN_NAME}    
${ADMIN_PASS}

## Product Control File
${PRODUCT}
${PRODUCT_NAME}    JBL Sem Fio
${PRICE}    224
${DESCRIPTION}    JBL Fone de Ouvido sem Fio Tune 520BT Dobrável Bateria 57h
${QUANTITY}    10
${PICTURE}    C:${/}Users${/}thais.regina.santos${/}OneDrive - Accenture${/}Documents${/}GitHub${/}Projeto-ServeRest${/}resources${/}assets${/}fone-picture.jpg

${PRODUCT_1}    Processador Intel I5 12400F
${PRODUCT_2}    Logitech MX Vertical

*** Keywords ***
#Criação de dados para utilização, como nome, email, senha e se é admin ou não
Generate fake data
    ${FAKE_NAME}    FakerLibrary.Name
    ${FAKE_EMAIL}    FakerLibrary.Email
    ${FAKE_PASS}    FakerLibrary.Password
    ${ADMIN_FLAG}    FakerLibrary.Boolean

    Set Global Variable    ${NAME}    ${FAKE_NAME}
    Set Global Variable    ${EMAIL}    ${FAKE_EMAIL}
    Set Global Variable    ${PASS}    ${FAKE_PASS}
    Set Global Variable    ${ADMIN}    ${ADMIN_FLAG}

#Keyword que chama a função para salvar os dados do usuário criado no json
Save data in json file
    ${ACCOUNT}=    Create Dictionary    name=${NAME}    email=${EMAIL}    password=${PASS}    admin=${ADMIN}
    Save_users    ${ACCOUNT}

#Essa keyword vai ler o arquivo de usuários e vai salvar aleatoriamente um usuário para logar na aplicação
Read data in json file
    ${QTD_INDEX}=    Count_users
    ${USER}    Load Json From File    ${JSON_FILE}
    ${INDEX}=     Evaluate    random.randint(0, ${QTD_INDEX}-1)    random
    Log    ${INDEX}

    ${NAME_SAVE_IN_JSON}    Get From Dictionary    ${USER[${INDEX}]}    name
    ${EMAIL_SAVE_IN_JSON}    Get From Dictionary    ${USER[${INDEX}]}    email
    ${PASS_SAVE_IN_JSON}    Get From Dictionary    ${USER[${INDEX}]}    password
    ${FLAG_SAVE_IN_JSON}    Get From Dictionary    ${USER[${INDEX}]}    admin


    Set Global Variable    ${NAME_SAVED}    ${NAME_SAVE_IN_JSON}
    Set Global Variable    ${EMAIL_SAVED}    ${EMAIL_SAVE_IN_JSON}
    Set Global Variable    ${PASS_SAVED}    ${PASS_SAVE_IN_JSON}
    Set Global Variable    ${ADMIN_SAVED}    ${FLAG_SAVE_IN_JSON}

#Responsável por salvar o nome do produto criado
Save product
    [Arguments]    ${PRODUCT_NAME}

    Set Global Variable    ${PRODUCT}    ${PRODUCT_NAME}