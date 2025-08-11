*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Resource        ../resources/base.resource
Resource        signin.robot

Library        FakerLibrary

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
    Then Attempt signUp    ${EMPTY}    ${EMAIL}    ${PASS}    False    Nome é obrigatório

Validate empty email in register form
    Given Access to signUp page
    When Validate access to correct page
    Then Attempt signUp    ${NAME}    ${EMPTY}    ${PASS}    False    Email é obrigatório

Validate empty Password in register form
    Given Access to signUp page
    When Validate access to correct page
    Then Attempt signUp    ${NAME}    ${EMAIL}    ${EMPTY}    False    Password é obrigatório


 


