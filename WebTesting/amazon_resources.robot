*** Settings ***
Library                 SeleniumLibrary


*** Variables ***
${URL}                  https://www.amazon.com.br/
${MENU_ELETRONICOS}     //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${H1_ELETRONICOS}       //h1[contains(.,'Eletrônicos e Tecnologia')]
${INPUT_PESQUISA}       //input[@id='twotabsearchtextbox']
${BOTAO_PESQUISA}       //input[@id='nav-search-submit-button']
${PRODUTO}              (//span[contains(.,'Console Xbox Series S')])[2]
    


*** Keywords ***
Abrir o navegador
    Open Browser                    browser=firefox     service_log_path=${{os.path.devnull}}    
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
                                

