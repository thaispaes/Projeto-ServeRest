*** Settings ***
Documentation        Teste para acessar a tela inicial da ServeRest no WebApp 

Resource        ../resources/base.resource

Test Setup        Start session 
Test Teardown     Take Screenshot
*** Comments ***
O Test Setup e o Test Teardown foram usando visto que todos os nossos testes 
fazem o mesmo fluxo de iniciar o navegador e no final tirar um print, entao para deixar mais fluxo o codigo
o recomendado e utilizar essa configuracao 

*** Test Cases ***
SignIn with success in WebApp 
    ${account}        Create Dictionary
    ...        email=thaisregina1901@gmail.com
    ...        password=Thais123
    

   SignIn    ${account}
   Login with success    


# Deve negar acesso devido ao email vazio
#    ${account}        Create Dictionary
#    ...        email=${EMPTY}
#    ...        password=Thais123
#
#    SignIn    ${account}
#    SignIn validation        Email é obrigatório    

#Uso de template de testes
Login validations
    [Template]    Attempt signin
    ${EMPTY}                     Thais123    Email é obrigatório
    thaisregina1901@gmail.com    ${EMPTY}    Password não pode ficar em branco
    thais@gmail.com              Thais123    Email e/ou senha inválidos
    thais@gmail.com              123         Email e/ou senha inválidos
    thaisregina1901@gmail.com    123         Email e/ou senha inválidos

*** Keywords ***
Attempt signin 
    [Arguments]    ${email}    ${password}    ${output_message}

    ${account}        Create Dictionary
    ...        email=${email}
    ...        password=${password}
    

   SignIn                   ${account}
   SignIn validation        ${output_message}    