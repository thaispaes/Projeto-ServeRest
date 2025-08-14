*** Settings ***
Documentation        Acoes e elementos da Shop List Page

Library        Browser

Resource    Store.resource

*** Keywords ***

Validate add item in shop list
    [Arguments]    ${PRODUCT_NAME}
    Get Text    css=h1 >> text=Lista de Compras
    Get Text    css=[data-testid="shopping-cart-product-name"] >> text=${PRODUCT_NAME}

Clear shop list with success
    Click    css=[data-testid="limparLista"]

Add quantity in item
    [Arguments]    ${PRODUCT_NAME}
    Get Text    css=[data-testid="shopping-cart-product-name"] >> text=${PRODUCT_NAME}
    Click    css=.card-body:has(:text("${PRODUCT_NAME}")) [data-testid="product-increase-quantity"]

Remove quantity in item
    [Arguments]    ${PRODUCT_NAME}
    Get Text    css=[data-testid="shopping-cart-product-name"] >> text=${PRODUCT_NAME}
    Click    css=.card-body:has(:text("${PRODUCT_NAME}")) [data-testid="product-decrease-quantity"]