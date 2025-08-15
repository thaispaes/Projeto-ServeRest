*** Settings ***
Documentation        Acoes e elementos da pagina de detalhes da aplicação

Library        Browser

*** Keywords ***

#A Keyword é responsável por pegar o nome do produto e analisar se a pagina de detalhes que aparece realmente é do produto escolhido
Validate product details page
    [Arguments]    ${PRODUCT_NAME}
    Get Text    css=[data-testid="product-detail-name"] >> text=${PRODUCT_NAME}