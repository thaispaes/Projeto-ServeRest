*** Settings ***
Documentation        Ações e elementos da pagina de Lista de compras

Resource        ../resources/base.resource

Test Setup    Start session
Test Teardown    Take Screenshot

*** Variables ***
${PRODUCT_1}    Processador Intel I5 12400F
${PRODUCT_2}    Logitech MX Vertical


*** Test Cases ***
Add amount in a product 
    Given Login in application with success    ${IS_NOT_ADMIN}
    When Add item    ${PRODUCT_1}
    And Validate add item in shop list    ${PRODUCT_1}
    Then Add quantity in item     ${PRODUCT_1}

Remove amount in the product
    Given Login in application with success    ${IS_NOT_ADMIN}
    When Add item    ${PRODUCT_2}
    And Validate add item in shop list    ${PRODUCT_2}
    And Add quantity in item    ${PRODUCT_2}
    Then Remove quantity in item    ${PRODUCT_2}

Clear shop list 
    Given Login in application with success    ${IS_NOT_ADMIN}
    When Add item    ${PRODUCT_1}
    And Validate add item in shop list    ${PRODUCT_1}
    Then Clear shop list with success

