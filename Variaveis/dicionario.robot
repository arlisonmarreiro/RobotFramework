*** Settings ***
Documentation               Essa suite testa a variavel do tipo dicionario

*** Variables ***
&{MESES_ANO}                Janeiro=31 dias
...                         Fevereiro=28 dias
...                         Março=31 dias
...                         Abril=30 dias
...                         Maio=31 dias
...                         Junho=30 dias
...                         Julho=31 dias
...                         Agosto=31 dias
...                         Setembro=30 dias
...                         Outubro=31 dias
...                         Novembro=30 dias
...                         Dezembro=31 dias

*** Test Cases ***


Caso de teste 01 - Dicionario
    [Documentation]         Esse teste realiza a utilização de dicionarios no robot framework
    [Tags]      Dicionario
    Testando Keywords

*** Keywords ***
Testando Keywords
    Log                     Janeiro: ${MESES_ANO.Janeiro}
    Log                     Fevereiro: ${MESES_ANO.Fevereiro}
    Log                     Março: ${MESES_ANO.Março}
    Log                     Abril: ${MESES_ANO.Abril}
    Log                     Maio: ${MESES_ANO.Maio}
    Log                     Junho: ${MESES_ANO.Junho}
    Log                     Julho: ${MESES_ANO.Julho}
    Log                     Agosto: ${MESES_ANO.Agosto}
    Log                     Setembro: ${MESES_ANO.Setembro}
    Log                     Outubro: ${MESES_ANO.Outubro}
    Log                     Novembro: ${MESES_ANO.Novembro}
    Log                     Dezembro: ${MESES_ANO.Dezembro}

