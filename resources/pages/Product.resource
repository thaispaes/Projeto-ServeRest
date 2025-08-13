*** Settings ***
Documentation        Acoes e elementos da Store Page

Library        Browser

*** Keywords ***
Access register products
    Click    css=[data-testid=cadastrarProdutos]

Create product
    [Arguments]    ${PRODUCT_NAME}    ${PRICE}    ${DESCRIPTION}    ${QUANTITY}    ${PICTURE}
    Get Text    css=h1    equals    Cadastro de Produtos

    Fill Text    css=[data-testid="nome"]    ${PRODUCT_NAME}
    Fill Text    css=[data-testid="preco"]    ${PRICE}
    Fill Text    css=[data-testid="descricao"]    ${DESCRIPTION}
    Fill Text    css=[data-testid="quantity"]   ${QUANTITY}
    Upload File By Selector    css=input [data-testid="imagem"]    ${PICTURE}

    Click    css=[data-testid="cadastrarProdutos"]
    
Validate product created
    [Arguments]    ${PRODUCT_CREATED}
    Get Text    css=h1    equals    Cadastro de Produtos
    Get Text    css=td >> text=${PRODUCT_CREATED}


