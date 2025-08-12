*** Settings ***
Documentation        Acoes e elementos da Shop List Page

Library        Browser

Resource    Store.resource

*** Keywords ***

Validate add item in shop list
    [Arguments]    ${product}
    Get Text    css=h1 >> text=Lista de Compras
    Get Text    css=[data-testid="shopping-cart-product-name"] >> text=${product}

Clear shop list with success
    Click    css=[data-testid="limparLista"]