*** Settings ***
Documentation        Acoes e elementos da SignUp Page

Resource        ../resources/base.resource

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
    Register    ${name}    ${email}    ${password}
    Validate entry with success