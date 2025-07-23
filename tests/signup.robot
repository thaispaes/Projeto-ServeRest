*** Settings ***
Documentation        Teste para acessar a tela inicial da ServeRest no WebApp e validar o slogan

Library        Browser


*** Test Cases ***
Deve iniciar o login do cliente 
    New Browser     browser=chromium    headless=False
    New Page        https://front.serverest.dev/login

    Get Text        css=h1.font-robot    equal     Login

    Fill Text       id=email        thaisregina1901@gmail.com
    Fill Text       id=password     Thais123

    Sleep    10