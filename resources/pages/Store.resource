*** Settings ***
Documentation        Acoes e elementos da Store Page

Library        Browser

Resource    SignIn.resource
Resource    ../Variables.resource

*** Keywords ***
Entry with success
    [Arguments]    ${ADMIN}    ${NAME}

    IF    ${ADMIN} == True
        Get Text    css=h1    equals    Bem Vindo ${NAME}
    ELSE
        Get Text    css=h1    equals    Serverest Store    
    END
    

Fill search bar and click to find the product
    [Arguments]    ${PRODUCT_NAME}
    Fill Text    css=[data-testid="pesquisar"]    ${PRODUCT_NAME}
    Click    css= button >> text=Pesquisar
    Save product    ${PRODUCT_NAME}

Validate if found the right product
    Get Text    css=h5 >> text=${PRODUCT}

Validate non-existing product
    Get Text    css=.container-fluid >> p    equals    Nenhum produto foi encontrado

Add item
    [Arguments]    ${PRODUCT_NAME}
    
    Get Text    css=h5 >> text=${PRODUCT_NAME}
    Click    css=.card-body:has(:text("${PRODUCT_NAME}")) [data-testid="adicionarNaLista"]
    Save product    ${PRODUCT_NAME}

Find product
    [Arguments]    ${PRODUCT_NAME}
    Get Text    css=h5 >> text=${PRODUCT_NAME}
    Click    css=.card-body:has(:text("${PRODUCT_NAME}")) >> .card-link




