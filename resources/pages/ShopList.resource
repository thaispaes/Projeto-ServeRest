*** Settings ***
Documentation        Acoes e elementos da pagina de lista de compras

Library        Browser

Resource    Store.resource

*** Keywords ***
#Valida que o item foi adicionado na lista de compras
Validate add item in shop list
    [Arguments]    ${PRODUCT_NAME}
    Get Text    css=h1 >> text=Lista de Compras
    Get Text    css=[data-testid="shopping-cart-product-name"] >> text=${PRODUCT_NAME}

#Keyword que faz com que a lista seja esvaziada
Clear shop list with success
    Click    css=[data-testid="limparLista"]

#Responsável por adicionar mais uma quantidade ao produto que já está na lista de compras
Add quantity in item
    [Arguments]    ${PRODUCT_NAME}
    Get Text    css=[data-testid="shopping-cart-product-name"] >> text=${PRODUCT_NAME}
    Click    css=.card-body:has(:text("${PRODUCT_NAME}")) [data-testid="product-increase-quantity"]

#Já esse é responsável por remover quantidade do produto que já está na lista de compras
Remove quantity in item
    [Arguments]    ${PRODUCT_NAME}
    Get Text    css=[data-testid="shopping-cart-product-name"] >> text=${PRODUCT_NAME}
    Click    css=.card-body:has(:text("${PRODUCT_NAME}")) [data-testid="product-decrease-quantity"]