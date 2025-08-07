*** Settings ***
Documentation        Arquivo principal das keywords bases do projeto 

Library        Browser

Resource        pages/SignIn.resource
Resource        pages/Store.resource
Resource        pages/SignUp.resource
Resource        Variables.resource

*** Keywords ***
Start session 
    New Browser     browser=chromium    headless=False
    New Page        https://front.serverest.dev/login    wait_until=domcontentloaded
