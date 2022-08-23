*** Settings ***
Documentation                               URL da página: https://damp-hollows-09002.herokuapp.com/
Library                                     SeleniumLibrary

*** Variables ***
${URL}                                      https://damp-hollows-09002.herokuapp.com/
${BROWSER}                                  chrome
${BNT_ADICIONAR}                            //a[@href='/form'][contains(.,'Adicionar')]
&{TEXTBOX}                                  modelo=//input[contains(@id,'id_modelo')]
...                                         marca=//input[contains(@id,'id_marca')]
...                                         ano=//input[contains(@id,'id_ano')]
&{INPUT}                                    modelo1=Gol         marca1=Volkswagen   ano1=2020
...                                         modelo2=Uno         marca2=Fiat         ano2=2020
...                                         modelo3=Fiesta      marca3=Ford         ano3=2020
...                                         modelo4=Celta       marca4=Chevrolet    ano4=2020
...                                         modelo5=Onix        marca5=Chevrolet    ano5=2020
...                                         modelo6=Fusion      marca6=Ford         ano6=2020
...                                         modelo7=Argo        marca7=Fiat         ano7=2020 
${BTN_SUBMIT}                               submit 
${RESULT}                                   //div[@class='alert alert-success'][contains(.,'Operação realizada!')]
${BTN_EDITAR}                               //a[contains(@class,'btn btn-primary')] 
${CAR_ID}                                   //th[contains(.,'101')]
         
                                  


*** Keywords ***

#TC-01 Acessar pagina home
Dado que eu acesse o site
    Go To                                   ${URL}

Quando a pagina carregar   
    Wait Until Element Is Visible           ${BNT_ADICIONAR} 

Então a pagina deverá ser exibida
    Wait Until Element Is Visible           ${BNT_ADICIONAR} 

#TC-02 Adicionar um novo carro
Quando eu adicionar um novo carro
    Adicionar Carro

Então o carro deverá ser adicionado com sucesso
    Element Should Be Visible                ${RESULT}

#TC-03 Editar um carro
Quando eu editar um carro
    Click Element                            ${BTN_EDITAR}
    Wait Until Element Is Visible            ${BTN_SUBMIT}
    Input Text                               ${TEXTBOX.modelo}     CARRO
    Input Text                               ${TEXTBOX.marca}      VOLKSWAGEN
    Input Text                               ${TEXTBOX.ano}        2020
    Click Element                            ${BTN_SUBMIT}

Então o carro deverá ser editado com sucesso
    Wait Until Element Is Visible                ${RESULT}
    Element Should Be Visible                    ${RESULT}
    

#TC-04 Excluir um carro 
Quando eu apagar um carro
    ${BTN_DELETE}=      Get WebElements         //a[contains(@class,'btn btn-danger btnDel')] 
    FOR     ${BTN}      IN  @{BTN_DELETE}
        Click Element                        ${BTN} 
        Handle Alert                         Accept     3s
        Wait Until Element Is Visible        ${BTN_DELETE}
        Execute JavaScript    window.scrollTo(1279,732)   
    END
#    Click Element                         @{BTN_DELETE}
#    Handle Alert                          Accept


Então o carro deverá ser apagado com sucesso
    Element Should Not Be Visible            ${CAR_ID}
    











#Test Setup e Teardown
Abrir navegador
    Open Browser        browser=${BROWSER}   
    Maximize Browser Window  

Fechar navegador
    Close Browser