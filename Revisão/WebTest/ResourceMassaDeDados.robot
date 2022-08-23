*** Settings ***
Documentation                               URL da página: https://damp-hollows-09002.herokuapp.com/
Library                                     SeleniumLibrary


*** Keywords ***
Adicionar Carro
    Click Element                           ${BNT_ADICIONAR}
    Wait Until Element Is Visible           ${TEXTBOX.modelo}
    Input Text                              ${TEXTBOX.modelo}   ${INPUT.modelo1}
    Input Text                              ${TEXTBOX.marca}    ${INPUT.marca1}
    Input Text                              ${TEXTBOX.ano}      ${INPUT.ano1}
    Click Element                           ${BTN_SUBMIT}
    Wait Until Element Is Visible           ${RESULT}
    Input Text                              ${TEXTBOX.modelo}   ${INPUT.modelo2}
    Input Text                              ${TEXTBOX.marca}    ${INPUT.marca2}
    Input Text                              ${TEXTBOX.ano}      ${INPUT.ano2}
    Click Element                           ${BTN_SUBMIT}
    Wait Until Element Is Visible           ${RESULT}
    Input Text                              ${TEXTBOX.modelo}   ${INPUT.modelo3}
    Input Text                              ${TEXTBOX.marca}    ${INPUT.marca3}
    Input Text                              ${TEXTBOX.ano}      ${INPUT.ano3}
    Click Element                           ${BTN_SUBMIT}
    Wait Until Element Is Visible           ${RESULT}
    Input Text                              ${TEXTBOX.modelo}   ${INPUT.modelo4}
    Input Text                              ${TEXTBOX.marca}    ${INPUT.marca4}
    Input Text                              ${TEXTBOX.ano}      ${INPUT.ano4}
    Click Element                           ${BTN_SUBMIT}
    Wait Until Element Is Visible           ${RESULT}
    Input Text                              ${TEXTBOX.modelo}   ${INPUT.modelo5}
    Input Text                              ${TEXTBOX.marca}    ${INPUT.marca5}
    Input Text                              ${TEXTBOX.ano}      ${INPUT.ano5}
    Click Element                           ${BTN_SUBMIT}
    Wait Until Element Is Visible           ${RESULT}
    Input Text                              ${TEXTBOX.modelo}   ${INPUT.modelo6}
    Input Text                              ${TEXTBOX.marca}    ${INPUT.marca6}
    Input Text                              ${TEXTBOX.ano}      ${INPUT.ano6}
    Click Element                           ${BTN_SUBMIT}
    Wait Until Element Is Visible           ${RESULT}   
    Input Text                              ${TEXTBOX.modelo}   ${INPUT.modelo7}
    Input Text                              ${TEXTBOX.marca}    ${INPUT.marca7}
    Input Text                              ${TEXTBOX.ano}      ${INPUT.ano7}
    Click Element                           ${BTN_SUBMIT}