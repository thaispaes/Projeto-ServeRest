*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Resource        ../resources/base.resource
Resource    signin.robot

Library        FakerLibrary

Suite Setup    Generate fake data

Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***
SignUp successfully
    Go to signUp page
    Validate access to correct page
    Register    ${NAME}    ${EMAIl}    ${PASS}    False
    Save data in json file
    Validate entry with success

Validate empty name in register form
    Go to signUp page
    Validate access to correct page
    Attempt signUp    ${EMPTY}    ${EMAIl}    ${PASS}    False    Nome é obrigatório

Validate empty email in register form
    Go to signUp page
    Validate access to correct page
    Attempt signUp    ${NAME}    ${EMPTY}    ${PASS}    False    Email é obrigatório

Validate empty Password in register form
    Go to signUp page
    Validate access to correct page
    Attempt signUp    ${NAME}    ${EMAIl}    ${EMPTY}    False    Password é obrigatório

SingUp with admin access
    Go to signUp page
    Validate access to correct page
    Register    ${NAME}    ${EMAIl}    ${PASS}    True
    Save data in json file
    Validate login with admin    ${NAME}

*** Keywords ***
Attempt signUp
  [Arguments]    ${name}    ${email}    ${password}    ${admin}    ${output_message}


   Register                    ${name}    ${email}    ${password}    ${admin}
   SignUp validation           ${output_message}    


