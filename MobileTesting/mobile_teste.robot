*** Settings ***
Documentation   Essa suíte testa o app Chat21
Resource        mobile_resources.robot


*** Test Cases ***
Caso de teste 01 - Cadastro
    [Documentation]             Esse teste o realiza o cadastro
    [Tags]                      cadastro
    Dado que eu abra o app
    Quando eu clicar em Sign Up e realizar o cadastro
    Então o cadastro deverá ser feito

Caso de teste 02 - Login
    [Documentation]             Esse teste realiza o login com o cadastro criado               
    [Tags]                      login 
    Dado que eu abra o app
    Quando eu digitar os dados e clicar em login
    Então a tela inicial deverá aparecer

Caso de teste 03 - Digitar no chat
    [Documentation]             Esse teste verifica a função de chat
    [Tags]                      chat
    Dado que eu abra o app
    Quando eu digitar os dados e clicar em login
    E clicar em "SELECT A CONTACT"
    E digitar um texto
    Então a mensagem devera ser enviada