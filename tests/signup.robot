*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Resource        ../resources/base.resource

Suite Setup    Generate fake data

Test Setup    Start session
Test Teardown    Take Screenshot


*** Test Cases ***
SignUp successfully
    Given Access to signUp page
    When Validate access to correct page
    And Register    ${NAME}    ${EMAIL}    ${PASS}    ${ADMIN}
    And Save data in json file     
    Then Entry with success    ${ADMIN}    ${NAME}
    
Validate empty name in register form
    Given Access to signUp page
    When Validate access to correct page
    And Read data in json file
    Then Attempt signUp    ${EMPTY}    ${EMAIL_SAVE}    ${PASS_SAVE}    False    Nome é obrigatório

Validate empty email in register form
    Given Access to signUp page
    When Validate access to correct page
    And Read data in json file
    Then Attempt signUp    ${NAME_SAVE}    ${EMPTY}    ${PASS_SAVE}    False    Email é obrigatório

Validate empty Password in register form
    Given Access to signUp page
    When Validate access to correct page
    And Read data in json file
    Then Attempt signUp    ${NAME_SAVE}    ${EMAIL_SAVE}    ${EMPTY}    False    Password é obrigatório


 


