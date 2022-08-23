*** Settings ***
Documentation           URL da página: https://damp-hollows-09002.herokuapp.com/
Resource                ResourceDjangoCrud.robot
Resource                ResourceMassaDeDados.robot
Test Setup              Abrir navegador
Library                                     SeleniumLibrary
Library                 CryptoLibrary           variable_decryption=False

*** Variables ***
${URL}                  https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin
${BROWSER}            Firefox
${EMAIL_TEXTBOX}    //input[contains(@id,'identifierId')]
${EMAIL}            crypt:coapyPE0nYsXDZBHQgqC2KOcyGdaUPS0gSCM3o7g2HcSqefhBB5LqiaXo3wMsc8n3hYNkgSi6u2hsA==
${EMAIL_1}          TESTE@TESTE.COM
${BTN}              //span[@jsname='V67aGc'][contains(.,'Próxima')]
${PASSWORD_TEXTBOX}         //input[contains(@id,'password')]
${PASSWORD}         
*** Test Cases ***

TC-01 - Acessar a página de login
    Acessar pagina gmail
    Preencher campo de email com o valor
#    Clicar no botão de login

*** Keywords ***
Acessar pagina gmail
    Go To               ${URL}
Preencher campo de email com o valor
    ${user}=    Get Decrypted Text    ${EMAIL}
    Input Text          ${EMAIL_TEXTBOX}        ${user}
    Log To Console          ${user}
    Log To Console          ${EMAIL_1}


Abrir navegador
    Open Browser        browser=${BROWSER}   
    Maximize Browser Window  