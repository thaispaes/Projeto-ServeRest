*** Settings ***
Documentation        Teste para acessar a tela inicial da ServeRest no WebApp 

Resource        ../resources/base.resource

Suite Setup    Generate fake data

Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***

SignIn with success in WebApp 
    Given Read data in json file    
    When SignIn    ${EMAIL_SAVED}    ${PASS_SAVED}
    Then Entry with success    ${ADMIN_SAVED}    ${NAME_SAVED}

#Uso de template de testes
Validate empty email in login 
    Given Read data in json file
    When SignIn    ${EMPTY}    ${PASS_SAVED}
    Then Attempt signIn without success     Email é obrigatório

Validate empty password in login 
    Given Read data in json file
    When SignIn    ${EMAIL_SAVED}    ${EMPTY}
    Then Attempt signIn without success     Password é obrigatório

Validate wrong email in login 
    Given Read data in json file
    When SignIn    teste@teste.com    ${PASS_SAVED}
    Then Attempt signIn without success     Email e/ou senha inválidos

Validate wrong password in login 
    Given Read data in json file
    When SignIn    ${EMAIL_SAVED}    123teste
    Then Attempt signIn without success     Email e/ou senha inválidos

Validate wrong email and password in login 
    Given Read data in json file
    When SignIn    teste@teste.com    123teste
    Then Attempt signIn without success     Email e/ou senha inválidos


