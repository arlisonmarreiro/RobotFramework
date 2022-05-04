*** Settings ***
Documentation     Essa suite testa a estruturas de repetição e decisão

*** Variables ***
@{NUMEROS}           0  1  2  3  4  5  6  7  8  9  10  11  12 

*** Test Cases ***

Caso de teste - Estruturas
    [Documentation]         Esse teste realiza a utilização de estruturas no robot framework
    [Tags]      Estruturas
    Percorrendo lista usando FOR

*** Keywords ***
Percorrendo lista usando FOR
    FOR    ${numero}    IN   @{NUMEROS}
      IF  ${numero} == 5 or ${numero} == 10
          Log To Console    Eu sou o número ${numero}!
      ELSE
          Log To Console    Eu não sou o número 5 e nem o 10!
      END
  END