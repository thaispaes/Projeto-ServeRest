*** Settings ***
Documentation        Acoes e elementos da Tela de admin validando todo o controle de produtos

Resource    ../resources/Base.resource

Test Setup    Start session
Test Teardown    Take Screenshot


*** Test Cases ***
Create an product with success
    Given Login in application with success    ${IS_ADMIN}
    When Access register products
    And Create product    ${PRODUCT_NAME}    ${PRICE}    ${DESCRIPTION}    ${QUANTITY}    ${picture}     
    Then Validate product created    ${PRODUCT_NAME}
