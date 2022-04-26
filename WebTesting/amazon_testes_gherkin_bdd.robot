*** Settings ***
Documentation   Essa suíte teste o site da Amazon.com.br
Resource        amazon_resources.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador


*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]     Esse teste verifica o menu eletrônicos do site Amazon.com.br
    ...                 e verifica a categoria Computadores e Informática
    [Tags]              menus   categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de teste 02 - Pesquisa de um Produto
    [Documentation]     Esse teste realiza a busca de um produto
    [Tags]              busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o produto deverá ser listado
    E deverá clicar no produto 

