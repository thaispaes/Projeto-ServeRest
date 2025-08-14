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
    Read data in json file
    SignIn    ${EMAIL_SAVE}    ${PASS_SAVE}
    Entry with success    ${ADMIN_SAVE}    ${NAME_SAVE}

Find admin user to login
    [Arguments]    ${IS_ADMIN}
    ${ADMIN_USER}=    Find Admin User    ${IS_ADMIN}

    ${admin_name}    Get From Dictionary    ${ADMIN_USER}    name
    ${admin_email}    Get From Dictionary    ${ADMIN_USER}    email
    ${admin_pass}    Get From Dictionary    ${ADMIN_USER}    password

    Log    ${admin_name},${admin_email},${admin_pass}