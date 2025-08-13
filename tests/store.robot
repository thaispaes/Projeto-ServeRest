*** Settings ***
Documentation    Acoes e elementos da Serverest Store

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Variables ***    
${PRODUCT1}    Samsung 60 polegadas
${PRODUCT2}    Logitech MX Vertical
${PRODUCT3}    Produto X

*** Test Cases ***

Using the search bar to find a product
    Given Login in application with success
    When Fill search bar and click to find the product    ${PRODUCT1}
    Then Validate if found the right product

Using in the search bar a non-existing product
    Given Login in application with success
    When Fill search bar and click to find the product    Nada
    Then Validate non-existing product

Add items in the shop list
    Given Login in application with success
    When Add item    ${PRODUCT3}
    Then Validate add item in shop list    ${PRODUCT3}

Check product details page
    Given Login in application with success
    When Find product     ${PRODUCT2}
    Then Validate product details page    ${PRODUCT2}