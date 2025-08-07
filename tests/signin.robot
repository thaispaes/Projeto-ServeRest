*** Settings ***
Documentation        Teste para acessar a tela inicial da ServeRest no WebApp 

Resource        ../resources/base.resource

Suite Setup    Generate fake data

Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***

SignIn with success in WebApp 
    Given Read data in json file
    ${account}    Create Dictionary    
    ...    email=${EMAIL_SAVE}
    ...    password=${PASS_SAVE}
    
    When SignIn    ${account}
    Then Entry with success

#Uso de template de testes
Login input validations
    [Template]    Attempt signin
    ${EMPTY}                     ${PASS_SAVE}    Email é obrigatório
    ${EMAIL_SAVE}    ${EMPTY}    Password não pode ficar em branco
    thais@gmail.com              ${PASS_SAVE}    Email e/ou senha inválidos
    thais@gmail.com              123         Email e/ou senha inválidos
    ${EMAIL_SAVE}    123         Email e/ou senha inválidos

*** Keywords ***
Attempt signin 
    [Arguments]    ${email}    ${password}    ${output_message}

    ${account}        Create Dictionary
    ...        email=${email}
    ...        password=${password}
    

   SignIn                   ${account}
   SignIn validation        ${output_message}    