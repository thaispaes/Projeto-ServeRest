*** Settings ***
Documentation        Teste para acessar a tela inicial da ServeRest no WebApp 

Resource        ../resources/base.resource

Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***
SignIn with success in WebApp 
    ${account}        Create Dictionary
    ...        email=thaisregina1901@gmail.com
    ...        password=Thais123
    
    SignIn    ${account}
    Validate entry with success

#Uso de template de testes
Login input validations
    [Template]    Attempt signin
    ${EMPTY}                     Thais123    Email é obrigatório
    thaisregina1901@gmail.com    ${EMPTY}    Password não pode ficar em branco
    thais@gmail.com              Thais123    Email e/ou senha inválidos
    thais@gmail.com              123         Email e/ou senha inválidos
    thaisregina1901@gmail.com    123         Email e/ou senha inválidos

SignIn with an admin access
    ${account}        Create Dictionary
    ...        email=thaisregina1901@gmail.com
    ...        password=Thais123
    
    SignIn    ${account}
    Validate entry with success

*** Keywords ***
Attempt signin 
    [Arguments]    ${email}    ${password}    ${output_message}

    ${account}        Create Dictionary
    ...        email=${email}
    ...        password=${password}
    

   SignIn                   ${account}
   SignIn validation        ${output_message}    