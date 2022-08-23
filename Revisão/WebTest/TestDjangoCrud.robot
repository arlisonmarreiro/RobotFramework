*** Settings ***
Documentation           URL da página: https://damp-hollows-09002.herokuapp.com/
Resource                ResourceDjangoCrud.robot
Resource                ResourceMassaDeDados.robot
Test Setup              Abrir navegador
Test Teardown           Fechar navegador


*** Test Cases ***

TC-01 Acessar pagina home
    [Documentation]     Esse teste verifica se a pagina home esta carregada
    [Tags]              HOME
    Dado que eu acesse o site
    Quando a pagina carregar 
    Então a pagina deverá ser exibida
    
TC-02 Adicionar um novo carro
    [Documentation]     Esse teste verifica se o carro foi adicionado com sucesso
    [Tags]              ADICIONAR
    Dado que eu acesse o site
    Quando eu adicionar um novo carro
    Então o carro deverá ser adicionado com sucesso

TC-03 Editar um carro
    [Documentation]     Esse teste verifica se o carro foi editado com sucesso
    [Tags]              EDITAR
    Dado que eu acesse o site
    Quando eu editar um carro
    Então o carro deverá ser editado com sucesso

TC-04 Apagar um carro
    [Documentation]     Esse teste verifica se o carro foi apagado com sucesso
    [Tags]              APAGAR
    Dado que eu acesse o site
    Quando eu apagar um carro
    Então o carro deverá ser apagado com sucesso