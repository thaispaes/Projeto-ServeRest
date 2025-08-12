*** Settings ***
Documentation        Acoes e elementos da Details Page

Library        Browser

*** Keywords ***

Validate product details page
    [Arguments]    ${product}
    Get Text    css=[data-testid="product-detail-name"] >> text=${product}