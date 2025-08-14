*** Settings ***
Documentation        Acoes e elementos da Details Page

Library        Browser

*** Keywords ***

Validate product details page
    [Arguments]    ${PRODUCT_NAME}
    Get Text    css=[data-testid="product-detail-name"] >> text=${PRODUCT_NAME}