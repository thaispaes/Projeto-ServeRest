*** Settings ***
Documentation        Arquivo principal das keywords bases do projeto 

Library        Browser

Resource        pages/Singup.resource


*** Keywords ***
Start session 
    New Browser     browser=chromium    headless=False
    New Page        https://front.serverest.dev/login
