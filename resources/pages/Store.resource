*** Settings ***
Documentation        Acoes e elementos da Store Page

Library        Browser

Resource    SignIn.resource
Resource    ../Variables.resource

*** Keywords ***
#Valida se entrou com sucesso na aplicação, verificando o titulo da pagina
Entry with success
    [Arguments]    ${ADMIN}    ${NAME}

    IF    ${ADMIN} == True
        Get Text    css=h1    equals    Bem Vindo ${NAME}
    ELSE
        Get Text    css=h1    equals    Serverest Store    
    END
    
#Realiza uma busca por um produto na barra de pesquisa
Fill search bar and click to find the product
    [Arguments]    ${PRODUCT_NAME}
    Fill Text    css=[data-testid="pesquisar"]    ${PRODUCT_NAME}
    Click    css= button >> text=Pesquisar
    Save product    ${PRODUCT_NAME}

#Valida se na pesquisa do produto foi encontrando o produto correto
Validate if found the right product
    Get Text    css=h5 >> text=${PRODUCT}

#Valida se o produto pesquisado não foi encontrado
Validate non-existing product
    Get Text    css=.container-fluid >> p    equals    Nenhum produto foi encontrado

#A Keyword é responsável por adicionar produto na lista de compras
Add item
    [Arguments]    ${PRODUCT_NAME}
    
    Get Text    css=h5 >> text=${PRODUCT_NAME}
    Click    css=.card-body:has(:text("${PRODUCT_NAME}")) [data-testid="adicionarNaLista"]
    Save product    ${PRODUCT_NAME}

#Busca pelo produto na pagina 
Find product
    [Arguments]    ${PRODUCT_NAME}
    Get Text    css=h5 >> text=${PRODUCT_NAME}
    Click    css=.card-body:has(:text("${PRODUCT_NAME}")) >> .card-link




