*** Settings ***
Documentation                    base do projeto

Library                          AppiumLibrary

*** Keywords ***
Start Session   
    [Arguments]                          ${APPIUM_PORT_REAL}                                ${UDID}         
    Open Application                     http://localhost:${APPIUM_PORT_REAL} 
    ...                                  platformName=Android           
    ...                                  deviceName=Android Emulator          
    ...                                  automationName=UIAutomator2
    ...                                  appPackage=br.inf.topsoft.tspedidos
    ...                                  udid=${UDID}
    ...                                  ignoreHiddenApiPolicyError=true
    ...                                  autoGrantPermissions=true
    ...                                  appActivity=.MainActivity
    ...                                  noReset=true
    ...                                  newCommandTimeout=300
    ...                                  adbExecTimeout=150000

Get Started
    [Arguments]                          ${senha}                                                  ${sicronização}
    Wait Until Element Is Visible        accessibility_id=Iniciar                                  10s
    Click Element                        accessibility_id=Iniciar

    Wait Until Element Is Visible        accessibility_id=Faça login com o Google                  5s
    Click Element                        accessibility_id=Faça login com o Google

    ${element_present}=    Run Keyword And Return Status    
    ...    Wait Until Element Is Visible    xpath=(//android.widget.LinearLayout[@resource-id="com.google.android.gms:id/container"])[1]    
    ...    8s

    Run Keyword If    ${element_present}    
    ...    Click Element    xpath=(//android.widget.LinearLayout[@resource-id="com.google.android.gms:id/container"])[1]
    ...    ELSE    Log    Element not found, continuing with test
     

    Wait Until Element Is Visible        accessibility_id=Vincular Filial                          15s
    Click Element                        accessibility_id=Usar filial de demonstração
    Wait Until Element Is Visible        accessibility_id=Informações fictícias para demonstração do aplicativo.
    ...                                  5s
    Click Element                        accessibility_id=Continuar

    Wait Until Element Is Visible        xpath=//android.view.View[starts-with(@content-desc, '${sicronização}')]
    ...                                  6s
    Click Element                        xpath=//android.view.View[starts-with(@content-desc, '${sicronização}')]
    
    ${autenticacao_visivel}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    accessibility_id=Autenticação Necessária    3s
    
    Run Keyword If    ${autenticacao_visivel}    Input Text    
    ...    xpath=//android.widget.EditText    ${senha}
    
    Run Keyword If    ${autenticacao_visivel}    Click Element    
    ...    accessibility_id=Autenticar

Close Session
    Click Element                        android=new UiSelector().className("android.widget.Button").instance(1)
    Click Element                        accessibility_id=Fechar
    Swipe                                ${553}    ${1939}    ${585}    ${1318}
    Wait Until Element Is Visible        xpath=//android.view.View[contains(@content-desc, "Sair")]
    ...                                  3s
    Click Element                        xpath=//android.view.View[contains(@content-desc, "Sair")]
    Sleep                                2s
    Click Element                        accessibility_id=Sim
    Close Application

    
