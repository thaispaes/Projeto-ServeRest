*** Settings ***
Documentation        Acoes e elementos da Tela de admin validando todo o controle de usuarios

Resource    ../resources/Base.resource

Suite Setup    Generate fake data

Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Register user through admin home
    Given Login in application with success    ${IS_ADMIN}
    When Access register users
    And Register user   ${NAME}    ${EMAIL}    ${PASS}    ${ADMIN}    
