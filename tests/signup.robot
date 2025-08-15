*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Resource        ../resources/base.resource

Suite Setup    Generate fake data

Test Setup    Start session
Test Teardown    Take Screenshot



*** Test Cases ***
SignUp successfully
    Given Access to signUp page
    When Register    ${NAME}    ${EMAIL}    ${PASS}    ${ADMIN}
    And Save data in json file     
    Then Entry with success    ${ADMIN}    ${NAME}
    
Validate empty name in register form
    Given Access to signUp page
    When Validate access to signUp page
    And Read data in json file
    Then Attempt signUp    ${EMPTY}    ${EMAIL_SAVED}    ${PASS_SAVED}    False    Nome é obrigatório

Validate empty email in register form
    Given Access to signUp page
    When Validate access to signUp page
    And Read data in json file
    Then Attempt signUp    ${NAME_SAVED}    ${EMPTY}    ${PASS_SAVED}    False    Email é obrigatório

Validate empty Password in register form
    Given Access to signUp page
    When Validate access to signUp page
    And Read data in json file
    Then Attempt signUp    ${NAME_SAVED}    ${EMAIL_SAVED}    ${EMPTY}    False    Password é obrigatório


 


