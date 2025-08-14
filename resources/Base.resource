*** Settings ***
Documentation        Arquivo principal das keywords bases do projeto 

Library        Browser
Library        FakerLibrary
Library        JSONLibrary

Resource        pages/SignIn.resource
Resource        pages/Store.resource
Resource        pages/SignUp.resource
Resource        pages/ShopList.resource
Resource        pages/Details.resource
Resource        pages/Users.resource
Resource        pages/Product.resource
Resource        Variables.resource

*** Keywords ***
Start session 
    ${old_timeout}=    Set Browser Timeout    2 minutes
    New Browser     browser=chromium    headless=False    args=["--start-maximized"]
    New Page        https://front.serverest.dev/login    wait_until=networkidle
    Set Browser Timeout    ${old_timeout}

Login in application with success
    [Arguments]    ${IS_ADMIN}
    IF    ${IS_ADMIN} == True
        Find admin user to login
        SignIn    ${ADMIN_EMAIL}    ${ADMIN_PASS} 
        Entry with success    True    ${ADMIN_NAME}
    ELSE
        Read data in json file
        SignIn    ${EMAIL_SAVED}    ${PASS_SAVED}
        Entry with success    ${ADMIN_SAVED}    ${NAME_SAVED}
    END
    
Find admin user to login
    ${ADMIN_USER}=    Find Admin User

    ${admin_name}    Get From Dictionary    ${ADMIN_USER}    name
    ${admin_email}    Get From Dictionary    ${ADMIN_USER}    email
    ${admin_pass}    Get From Dictionary    ${ADMIN_USER}    password

    Set Suite Variable    ${ADMIN_EMAIL}    ${admin_email}
    Set Suite Variable    ${ADMIN_NAME}    ${admin_name}
    Set Suite Variable    ${ADMIN_PASS}    ${admin_pass}