*** Settings ***
Documentation        Teste para acessar a tela inicial da ServeRest no WebApp 

Resource        ../resources/base.resource

*** Test Cases ***
Deve iniciar o login do cliente 
    ${account}        Create Dictionary
    ...        email=thaisregina1901@gmail.com
    ...        password=Thais123
    

   Start session
   Realizar login na aplicacao    ${account}

Deve negar acesso devido ao email vazio
    ${account}        Create Dictionary
    ...        email=${EMPTY}
    ...        password=Thais123

    Start session
    Realizar login na aplicacao    ${account}
    Validar alerta de campo vazio        Email é obrigatório 
