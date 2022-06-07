*** Settings ***
Library                                 AppiumLibrary

*** Variables ***
${PATH}                                 http://0.0.0.0:4723/wd/hub
${PLATFORM_NAME}                        Android
${PLATFORM_VERSION}                     8.1.0
${DEVICE}                               J1AXB600Y02624Z 
${APP_PACKAGE}                          chat21.android.demo 
${APP_ACTIVITY}                         chat21.android.demo.SplashActivity
${AUTOMATION_NAME}                      UIautomator2    
${CONTINUE_BTN}                         com.android.permissioncontroller:id/continue_button
${CONTINUE_BTN_1}                       android:id/button1
${INPUT_EMAIL}                          chat21.android.demo:id/email
${INPUT_FIRST_NAME}                     chat21.android.demo:id/first_name
${INPUT_LAST_NAME}                      chat21.android.demo:id/last_name
${INPUT_PASSWORD}                       chat21.android.demo:id/password
${INPUT_REPEAT_PASSWORD}                chat21.android.demo:id/repeat_password
${SIGN_UP_BTN}                          chat21.android.demo:id/signup
&{INPUT_VALUES}                         email=teste99@gmail.com     first_name=Teste      
...                                     last_name=Testando     password=12345678  
${LOGIN_BTN}                            chat21.android.demo:id/login     
${SELECT_CONTACT}                       chat21.android.demo:id/direct_message
${PROFILE_PIC}                          chat21.android.demo:id/profile_picture
${SEND_KEYS}                            chat21.android.demo:id/main_activity_chat_bottom_message_edittext
${SEND_MESSAGE}                         chat21.android.demo:id/main_activity_send
${MESSAGE}                              Olá, essa mensagem é um teste!!!
${SENDED_MESSAGE}                       chat21.android.demo:id/message_group


*** Keywords ***
#TEARDOWN
Test Teardown
    Close Application


#Cadastro
Dado que eu abra o app
    Open Application                    ${PATH}   platformName=${PLATFORM_NAME}     
...                                     platformVersion=${PLATFORM_VERSION}  deviceName=${DEVICE}     
...                                     appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}     
...                                     automationName=${AUTOMATION_NAME}
#    Wait Until Element Is Visible
#...                                     ${CONTINUE_BTN}
#    Click Element                       ${CONTINUE_BTN}
#    Wait Until Element Is Visible
#...                                     ${CONTINUE_BTN_1}
#    Click Element                       ${CONTINUE_BTN_1}


Quando eu clicar em Sign Up e realizar o cadastro
    Click Element                       ${SIGN_UP_BTN}
    Input Text                          ${INPUT_EMAIL}              ${INPUT_VALUES.email}
    Input Text                          ${INPUT_FIRST_NAME}         ${INPUT_VALUES.first_name}
    Input Text                          ${INPUT_LAST_NAME}          ${INPUT_VALUES.last_name}
    Input Text                          ${INPUT_PASSWORD}           ${INPUT_VALUES.password}
    Input Text                          ${INPUT_REPEAT_PASSWORD}    ${INPUT_VALUES.password}
    Click Element                       ${SIGN_UP_BTN}

Então o cadastro deverá ser feito
    Wait Until Element Is Visible       ${INPUT_EMAIL}


#Login
Quando eu digitar os dados e clicar em login
    Input Text                          ${INPUT_EMAIL}              ${INPUT_VALUES.email}
    Input Text                          ${INPUT_PASSWORD}           ${INPUT_VALUES.password}
    Click Element                       ${LOGIN_BTN}

Então a tela inicial deverá aparecer
    Wait Until Element Is Visible           ${SELECT_CONTACT}           


#Chat
E clicar em "SELECT A CONTACT"
    Wait Until Element Is Visible       ${SELECT_CONTACT}
    Click Element                       ${SELECT_CONTACT}
    Wait Until Element Is Visible       ${PROFILE_PIC}
    Click Element                       ${PROFILE_PIC}

E digitar um texto
    Input Text                          ${SEND_KEYS}                ${MESSAGE}
    Click Element                       ${SEND_MESSAGE}

Então a mensagem devera ser enviada
    Wait Until Element Is Visible       ${SENDED_MESSAGE}
    



    




