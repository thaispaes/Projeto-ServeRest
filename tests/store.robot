*** Settings ***
Documentation    Acoes e elementos da Serverest Store

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***

Using the search bar to find a product
    Given Login in application with success
    When Fill search bar and click to find the product    Samsung 60 polegadas
    Then Validate if found the right product

Using in the search bar a non-existing product
    Given Login in application with success
    When Fill search bar and click to find the product    Nada
    Then Validate non-existing product

Add items in the shop list
    Given Login in application with success
    When Add item    Logitech MX Vertical
    Then Validate add item in shop list