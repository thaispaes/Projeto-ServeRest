*** Settings ***
Documentation        Acoes e elementos da Tela de admin validando todo o controle de usuarios

Resource    ../resources/Base.resource

Test Setup    Start session
Test Teardown    Take Screenshot

*** Variables ***
${product_name}    JBL Sem Fio
${price}    224
${description}    JBL Fone de Ouvido sem Fio Tune 520BT Dobrável Bateria 57h
${quantity}    10
${picture}    C:${/}Users${/}thais.regina.santos${/}OneDrive - Accenture${/}Documents${/}GitHub${/}Projeto-ServeRest${/}resources${/}assets${/}fone-picture.jpg


*** Test Cases ***
Create an product with success
    Given Login in application with success    ${IS_ADMIN}
    When Access register products
    And Create product    ${product_name}    ${price}    ${description}    ${quantity}    ${picture}     #Nao esta fazendo upload
    Then Validate product created    ${product_name}
