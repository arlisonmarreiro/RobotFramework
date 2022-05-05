*** Settings ***
Documentation               Documentação da api: https://fakerestapi.azurewebsites.net/index.html
Library                     RequestsLibrary
Library                     Collections                 

*** Variables ***
${URL_API}                  https://fakerestapi.azurewebsites.net/api/v1 
&{BOOK_15}                  ID=15
...                         Title=Book 15
...                         PageCount=1500



    
*** Keywords ***
#SETUP E TEARDOWN
Conectar a API
    Create Session          FakeApi     ${URL_API}      verify=true
    ${HEADERS}              Create Dictionary   content-type=application/json       
    Set Suite Variable      ${HEADERS}  

Requisitar todos os livros
    ${RESPOSTA}             GET On Session      FakeApi     Books   expected_status=200
    Log                     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}             GET On Session      FakeApi     Books/${ID_LIVRO}   expected_status=200
    Log                     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Cadastrar novo livro
    ${BOOK_201}                              Create Dictionary
...                                          id=201
...                                          title=Book 201
...                                          description=teste
...                                          pageCount=200
...                                          excerpt=teste
...                                          publishDate=2020-01-01T00:00:00
    Set Test Variable                        ${BOOK_201}
    ${RESPOSTA}             POST On Session    FakeApi     Books
...                                          json=${BOOK_201}
...                                          headers=${HEADERS}
...                                          expected_status=200
    Log                     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}


Alterar dados do livro "${ID_LIVRO}"
    ${BOOK_150}                              Create Dictionary
...                                          id=150
...                                          title=Alterado
...                                          description=Alterado
...                                          pageCount=150
...                                          excerpt=Alterado
...                                          publishDate=2020-01-01T00:00:00
    ${RESPOSTA}             PUT On Session   FakeApi     Books/${ID_LIVRO}    json=${BOOK_150}  
...                                          headers=${HEADERS}
...                                          expected_status=200
    Log                     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Deletar o livro "${ID_LIVRO}"
    ${RESPOSTA}             DELETE On Session    FakeApi     Books/${ID_LIVRO}   expected_status=200
    Log                     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}



 #Conferencias
Conferir o status code
    [Arguments]      ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}     ${REASON_DESEJADO} 

Conferir se retorna uma lista com "${QUANTIDADE_LIVROS}" livros
    Length Should Be        ${RESPOSTA.json()}         ${QUANTIDADE_LIVROS}

Conferir se retorna dados corretos do livro 15
    Dictionary Should Contain Item      ${RESPOSTA.json()}  id             ${BOOK_15.ID}
    Dictionary Should Contain Item      ${RESPOSTA.json()}  title          ${BOOK_15.Title}
    Dictionary Should Contain Item      ${RESPOSTA.json()}  pageCount      ${BOOK_15.PageCount}
    Should not Be Empty                 ${RESPOSTA.json()["description"]}
    Should not Be Empty                 ${RESPOSTA.json()["excerpt"]}
    Should not Be Empty                 ${RESPOSTA.json()["publishDate"]}

Conferir se os dados do novo livro estão corretos
    Dictionary Should Contain Item      ${RESPOSTA.json()}  id             ${BOOK_201.id}
    Dictionary Should Contain Item      ${RESPOSTA.json()}  title          ${BOOK_201.title}
    Dictionary Should Contain Item      ${RESPOSTA.json()}  pageCount      ${BOOK_201.pageCount}
    Should not Be Empty                 ${RESPOSTA.json()["description"]}
    Should not Be Empty                 ${RESPOSTA.json()["excerpt"]}
    Should not Be Empty                 ${RESPOSTA.json()["publishDate"]} 

Conferir se deletou o livro "${ID_LIVRO}"
    Should Be Empty                 ${RESPOSTA.content}





