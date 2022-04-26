*** Settings ***
Library                 SeleniumLibrary


*** Variables ***
${BROWSER}              firefox
${URL}                  https://www.amazon.com.br/
${MENU_ELETRONICOS}     //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${H1_ELETRONICOS}       //h1[contains(.,'Eletrônicos e Tecnologia')]
${INPUT_PESQUISA}       //input[@id='twotabsearchtextbox']
${BOTAO_PESQUISA}       //input[@id='nav-search-submit-button']
${PRODUTO}              (//span[contains(.,'Console Xbox Series S')])[2]
${ADICIONAR_CARRINHO}   add-to-cart-button
${REMOVER_CARRINHO}     //a[contains(@href,'gtc')]
${ADICIONADO_CARRINHO}  //span[contains(.,'Adicionado ao carrinho')]
${EXCLUIR_ITEM}         (//input[contains(@value,'Excluir')])[1]
${CARRINHO_VAZIO}       //h2[contains(.,'Seu carrinho da Amazon está vazio')]
    


*** Keywords ***
Abrir o navegador
    Open Browser                    browser=${BROWSER}     service_log_path=${{os.path.devnull}}    
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser


Acessar a home page do site amazon.com.br
    Go to                           url=${URL}
    Wait Until Element Is Visible   xpath=${MENU_ELETRONICOS}


Entrar no menu "Eletrônicos"
    Click Element                   xpath=${MENU_ELETRONICOS}


Verificar se aparece a frase "${TEXTO_ELETRONICOS}"
    Wait Until Page Contains        text=${TEXTO_ELETRONICOS}
    Wait Until Element Is Visible   xpath=${H1_ELETRONICOS} 


Verificar se o título da página fica "${TITULO}" 
    Title Should Be                 title=${TITULO}   


Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible       xpath=//a[@aria-label='${NOME_CATEGORIA}']


Digitar o nome de produto "${NOME_PESQUISA}" no campo de pesquisa
    Wait Until Element Is Visible   xpath=${INPUT_PESQUISA}
    Input Text                      xpath=${INPUT_PESQUISA}     ${NOME_PESQUISA}


Clicar no botão de pesquisa
    Click Element                   ${BOTAO_PESQUISA} 


Verificar o resultado da pesquisa se esta listando o produto pesquisado
    Element Should Be Visible       ${PRODUTO}   
    

Clicar no produto pesquisado
    Click Element                   ${PRODUTO}

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element                   id=${ADICIONAR_CARRINHO}

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Element Should Be Visible       ${ADICIONADO_CARRINHO}

Remover o produto "${PRODUTO}" do carrinho
    Click Element                   xpath=${REMOVER_CARRINHO}
    Click Element                   xpath=${EXCLUIR_ITEM}        

Verificar se o carrinho fica vazio
    Element Should Be Visible       ${CARRINHO_VAZIO}     
    

#GHERKING STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
                                
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o produto deverá ser listado
    Verificar o resultado da pesquisa se esta listando o produto pesquisado

E deverá clicar no produto 
    Clicar no produto pesquisado

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se esta listando o produto pesquisado
    Clicar no produto pesquisado
    Adicionar o produto "Console Xbox Series S" no carrinho
    
Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio





