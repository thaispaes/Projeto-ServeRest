*** Settings ***
Documentation        Teste para acessar a tela inicial da ServeRest no WebApp

Library        Browser


*** Test Cases ***
Deve exibir o slogan na SignUp Page
    New Browser     browser=chromium    headless=False
    New Page        https://front.serverest.dev/login
    Get Element     css=.imagem   

    Sleep    5