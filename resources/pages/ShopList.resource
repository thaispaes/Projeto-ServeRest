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

Add quantity in item
    [Arguments]    ${product}
    Get Text    css=[data-testid="shopping-cart-product-name"] >> text=${product}
    Click    css=.card-body:has(:text("${product}")) [data-testid="product-increase-quantity"]

Remove quantity in item
    [Arguments]    ${product}
    Get Text    css=[data-testid="shopping-cart-product-name"] >> text=${product}
    Click    css=.card-body:has(:text("${product}")) [data-testid="product-decrease-quantity"]