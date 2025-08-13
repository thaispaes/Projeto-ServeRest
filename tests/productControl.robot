*** Settings ***
Documentation        Acoes e elementos da Tela de admin validando todo o controle de usuarios

Resource    ../resources/Base.resource

Test Setup    Start session
Test Teardown    Take Screenshot

*** Variables ***
${product_name}    BL Fone de Ouvido sem Fio
${price}    224
${description}    BL Fone de Ouvido sem Fio Tune 520BT Dobrável Bateria 57h
${quantity}    10
${picture}    D:/codigos/GitHub/projeto-serverest/resources/assets

*** Test Cases ***
Create an product with success
    Given Login in application with success
    When Access register products
    And Create product    ${product_name}    ${price}    ${description}    ${quantity}    ${picture}     #Nao esta fazendo upload
    Then Validate product created    ${product_name}
