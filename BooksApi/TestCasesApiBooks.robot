*** Settings ***
Documentation               Documentação da api: https://fakerestapi.azurewebsites.net/index.html
Resource                    ResourceApi.robot
Suite Setup                 Conectar a API



*** Test Cases ***

Buscar listagem de todos os livros (GET em todos os livros)
    [Documentation]         Esse teste realiza o GET na fakeapi
    [Tags]      GET
    Requisitar todos os livros
    Conferir se retorna uma lista com "200" livros
    Conferir o status code  200
    Conferir o reason   OK

Buscar um livro específico (GET em um livro específico)
    [Documentation]         Esse teste realiza o GET em um item especifico na fakeapi
    [Tags]      GET_ID
    Requisitar o livro "15"
    Conferir se retorna dados corretos do livro 15
    Conferir o status code  200
    Conferir o reason   OK

Cadastrar novo livro (POST)
    [Documentation]         Esse teste realiza o POST de um item na fakeapi
    [Tags]      POST
    Cadastrar novo livro
    Conferir se os dados do novo livro estão corretos
    Conferir o status code  200
    Conferir o reason   OK

Alterar dados de um livro (PUT)
    [Documentation]         Esse teste realiza o PUT de um item na fakeapi
    [Tags]      PUT
    Alterar dados do livro "150"
    Conferir o status code  200
    Conferir o reason   OK

Deletar um livro (DELETE)
    [Documentation]         Esse teste realiza o DELETE de um item na fakeapi
    [Tags]      DELETE
    Deletar o livro "175"
    Conferir o status code  200
    Conferir o reason   OK
    Conferir se deletou o livro "175"







