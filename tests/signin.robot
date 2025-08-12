*** Settings ***
Documentation        Teste para acessar a tela inicial da ServeRest no WebApp 

Resource        ../resources/base.resource

Suite Setup    Generate fake data

Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***

SignIn with success in WebApp 
    Given Read data in json file    
    When SignIn    ${EMAIL_SAVE}    ${PASS_SAVE}
    Then Entry with success    ${ADMIN_SAVE}    ${NAME_SAVE}

#Uso de template de testes
Validate empty email in login 
    Given Read data in json file
    When SignIn    ${EMPTY}    ${PASS_SAVE}
    Then Attempt signIn without success     Email é obrigatório

Validate empty password in login 
    Given Read data in json file
    When SignIn    ${EMAIL_SAVE}    ${EMPTY}
    Then Attempt signIn without success     Password é obrigatório

Validate wrong email in login 
    Given Read data in json file
    When SignIn    teste@teste.com    ${PASS_SAVE}
    Then Attempt signIn without success     Email e/ou senha inválidos

Validate wrong password in login 
    Given Read data in json file
    When SignIn    ${EMAIL_SAVE}    123teste
    Then Attempt signIn without success     Email e/ou senha inválidos

Validate wrong email and password in login 
    Given Read data in json file
    When SignIn    teste@teste.com    123teste
    Then Attempt signIn without success     Email e/ou senha inválidos

*** Keywords ***
