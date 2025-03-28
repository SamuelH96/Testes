*** Settings ***
Documentation                    base do projeto

Library                          AppiumLibrary

*** Keywords ***
Start Session  
    Open Application                     http://localhost:4723
    ...                                  platformName=Android           
    ...                                  deviceName=Android Emulator          
    ...                                  automationName=UIAutomator2
    ...                                  appPackage=br.inf.topsoft.toppontoscolaborador
    ...                                  udid=emulator-5554
    ...                                  autoGrantPermissions=true
    ...                                  appActivity=.MainActivity
    ...                                  noReset=true
    ...                                  newCommandTimeout=300
    ...                                  adbExecTimeout=120000
      
Get started
    [Arguments]                          ${PIS}                                                             ${senha}

    Wait Until Page Contains             Login                                                              34s

    Wait Until Element Is Visible       xpath=//android.widget.EditText[1]                                  20s
    Click Element                       xpath=//android.widget.EditText[1]
    Sleep                               3s
    Input Text                          xpath=//android.widget.EditText[1]                                  ${PIS}

    Wait Until Element Is Visible       xpath=//android.widget.EditText[2]                                  20s
    Click Element                       xpath=//android.widget.EditText[2]
    Sleep                               3s
    Input Text                          xpath=//android.widget.EditText[2]                                  ${senha}

    Wait Until Element Is Visible      xpath=//android.widget.Button[@content-desc="Entrar"]                20s
    Click Element                      xpath=//android.widget.Button[@content-desc="Entrar"]
    Verificar Tela Localizacao

Verificar Tela Localizacao
    ${tela_localizacao_visivel}=    
    ...    Run Keyword And Return Status
    ...    Wait Until Element Is Visible      accessibility_id=Permitir localização                         2s
    
    Run Keyword If    ${tela_localizacao_visivel}
    ...    Clicar Em Continuar e permitir
    ...    ELSE
    ...    Log                                 Tela de localização não encontrada - Prosseguindo

Clicar Em Continuar e permitir
    Wait Until Element Is Visible              accessibility_id=Continuar                                   2s
    Click Element                              accessibility_id=Continuar 
    Sleep                                                                                                   1s   
    Log                                        Clicou em Continuar na tela de localização 
    ...                                        e permitiu durante o uso do app


Close Session
    Wait Until Element Is Visible              accessibility_id=Abrir menu de navegação                     3s
    Click Element                              accessibility_id=Abrir menu de navegação 
    Wait Until Element Is Visible              accessibility_id=Sair                                        3s 
    Click Element                              accessibility_id=Sair
    Wait Until Element Is Visible              accessibility_id=Sim                                         3s
    Click Element                              accessibility_id=Sim
