*** Settings ***
Documentation        Acoes e elementos da Store Page

Library        Browser

Resource    SignIn.resource
Resource    ../Variables.resource

*** Keywords ***
Entry with success
    [Arguments]    ${admin}    ${name}

    IF    ${admin} == True
        Get Text    css=h1    equals    Bem Vindo ${name}
    ELSE
        Get Text    css=h1    equals    Serverest Store    
    END
    

Fill search bar and click to find the product
    [Arguments]    ${product}
    Fill Text    css=[data-testid="pesquisar"]    ${product}
    Click    css= button >> text=Pesquisar
    Set Global Variable    ${PRODUCT}    ${product}

Validate if found the right product
    Get Text    css=h5 >> text=${PRODUCT}

Validate non-existing product
    Get Text    css=.container-fluid >> p    equals    Nenhum produto foi encontrado

Add item
    [Arguments]    ${product}
    
    Get Text    css=h5 >> text=${product}
    Click    css=.card-body:has(:text("${product}")) [data-testid="adicionarNaLista"]
    Set Global Variable    ${PRODUCT}    ${product}

Find product
    [Arguments]    ${product}
    Get Text    css=h5 >> text=${product}
    Click    css=.card-body:has(:text("${product}")) >> .card-link




