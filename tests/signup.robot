*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Resource        ../resources/base.resource
Resource    signin.robot

Library        FakerLibrary

Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***
SignUp successfully
    ${name}=   FakerLibrary.Name
    ${email}=    FakerLibrary.Email
    ${password}=    FakerLibrary.Password    length=12

    Go to signUp page
    Validate access to correct page
    Register    ${name}    ${email}    ${password}    False
    Validate entry with success

Validate empty name in register form
    ${email}=    FakerLibrary.Email
    ${password}=    FakerLibrary.Password
    
    Go to signUp page
    Validate access to correct page
    Attempt signUp    ${EMPTY}    ${email}    ${password}    False    Nome é obrigatório

Validate empty email in register form
    ${name}=    FakerLibrary.Name
    ${password}=    FakerLibrary.Password
    
    Go to signUp page
    Validate access to correct page
    Attempt signUp    ${name}    ${EMPTY}    ${password}    False    Email é obrigatório

Validate empty Password in register form
    ${email}=    FakerLibrary.Email
    ${name}=     FakerLibrary.Name
    
    Go to signUp page
    Validate access to correct page
    Attempt signUp    ${name}    ${email}    ${EMPTY}    False    Password é obrigatório

SingUp with admin access
    ${name}=   FakerLibrary.Name
    ${email}=    FakerLibrary.Email
    ${password}=    FakerLibrary.Password    length=12

    Go to signUp page
    Validate access to correct page
    Register    ${name}    ${email}    ${password}    True
    Validate login with admin    ${name}

*** Keywords ***
Attempt signUp
  [Arguments]    ${name}    ${email}    ${password}    ${admin}    ${output_message}


   Register                    ${name}    ${email}    ${password}    ${admin}
   SignUp validation           ${output_message}    


