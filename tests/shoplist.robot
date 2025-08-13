*** Settings ***
Documentation        Ações e elementos da pagina de Lista de compras

Resource        ../resources/base.resource

Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Add amount in a product 
    Given Login in application with success
    When Add item    Processador Intel I5 12400F
    And Validate add item in shop list    Processador Intel I5 12400F
    Then Add quantity in item     Processador Intel I5 12400F

Remove amount in the product
    Given Login in application with success
    When Add item    Logitech MX Vertical
    And Validate add item in shop list    Logitech MX Vertical
    And Add quantity in item    Logitech MX Vertical
    Then Remove quantity in item    Logitech MX Vertical

Clear shop list 
    Given Login in application with success
    When Add item    Processador Intel I5 12400F
    And Validate add item in shop list    Processador Intel I5 12400F
    Then Clear shop list with success

