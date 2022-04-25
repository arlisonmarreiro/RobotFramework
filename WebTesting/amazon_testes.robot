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
    Acessar a home page do site amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    
    

Caso de teste 02 - Pesquisa de um Produto
    [Documentation]     Esse teste realiza a busca de um produto
    [Tags]              busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se esta listando o produto pesquisado
    Clicar no produto pesquisado