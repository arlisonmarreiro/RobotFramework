*** Settings ***
Documentation               Essa suite testa a variavel do tipo lista 

*** Variables ***
@{MESES_ANO}                Janeiro
...                         Fevereiro
...                         Março
...                         Abril
...                         Maio
...                         Junho
...                         Julho
...                         Agosto
...                         Setembro
...                         Outubro
...                         Novembro
...                         Dezembro

*** Test Cases ***


Caso de teste 01 - Lista
    [Documentation]         Esse teste realiza a utilização de listas no robot framework
    [Tags]      Lista
    Testando Keywords

*** Keywords ***
Testando Keywords
    Log                     Mês 01: ${MESES_ANO[0]}
    Log                     Mês 02: ${MESES_ANO[1]}
    Log                     Mês 03: ${MESES_ANO[2]}
    Log                     Mês 04: ${MESES_ANO[3]}
    Log                     Mês 05: ${MESES_ANO[4]}
    Log                     Mês 06: ${MESES_ANO[5]}
    Log                     Mês 07: ${MESES_ANO[6]}
    Log                     Mês 08: ${MESES_ANO[7]}
    Log                     Mês 09: ${MESES_ANO[8]}
    Log                     Mês 10: ${MESES_ANO[9]}
    Log                     Mês 11: ${MESES_ANO[10]}
    Log                     Mês 12: ${MESES_ANO[11]}

