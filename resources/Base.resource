*** Settings ***
Documentation        Arquivo principal das keywords bases do projeto 

Library        Browser
Library        FakerLibrary

Resource        pages/SignIn.resource
Resource        pages/Store.resource
Resource        pages/SignUp.resource
Resource        pages/ShopList.resource
Resource        pages/Details.resource
Resource        Variables.resource

*** Keywords ***
Start session 
    ${old_timeout}=    Set Browser Timeout    2 minutes
    New Browser     browser=chromium    headless=False
    New Page        https://front.serverest.dev/login    wait_until=networkidle
    Set Browser Timeout    ${old_timeout}
