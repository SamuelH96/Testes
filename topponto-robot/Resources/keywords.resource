*** Settings ***
Documentation                             Principais keywords do projeto


Library                                   AppiumLibrary
Library                                   Browser                    timeout=80s
Library                                   Process

*** Keywords ***
Clicar no botão de registrar

    Wait Until Element Is Visible         xpath=//android.widget.Button[@content-desc="Registrar Ponto"]
    ...                                   30s
    Click Element                         xpath=//android.widget.Button[@content-desc="Registrar Ponto"]
    Wait Until Element Is Visible         accessibility_id=Confirmação                             
    ...                                   5s
    Click Element                         accessibility_id=Sim

Justificar e Registrar            
   [Arguments]                            ${justificativa}
    Wait Until Element Is Visible         accessibility_id=Por favor, justifique seu registro de ponto.                            
    ...                                   2s
    Input Text                            xpath=//android.widget.EditText          ${justificativa}
    Click Element                         accessibility_id=Enviar Justificativa


Verificar registro
    Wait Until Element Is Visible         accessibility_id=Ponto Registrado com Sucesso!
    ...                                   30s
    Capture Page Screenshot
    Click Element                         accessibility_id=Voltar ao Início

Sincronizar marcações
    Wait Until Element Is Visible        android=new UiSelector().className("android.widget.Button").instance(1)
    ...                                  5s
Acessar Ponto retroativo
    Wait Until Element Is Visible              accessibility_id=Abrir menu de navegação                     
    ...                                        3s
    Click Element                              accessibility_id=Abrir menu de navegação 
    Wait Until Element Is Visible              accessibility_id=Ponto Retroativo
    ...                                        5
    Click Element                              accessibility_id=Ponto Retroativo
    
Validar retroativo
    Wait Until Element Is Visible               android=new UiSelector().className("android.view.View").instance(4)
    ...                                         5s
    
Inserir data
    [Arguments]                           ${data}               
    Wait Until Element Is Visible         xpath=//android.view.View[contains(@text, '/') and contains(@text, '/20')]     
    ...                                   10s
    Click Element                         xpath=//android.view.View[contains(@text, '/') and contains(@text, '/20')]
    Wait Until Element Is Visible         android=new UiSelector().className("android.widget.Button").instance(0)   
    ...                                   5s
    Click Element                         android=new UiSelector().className("android.widget.Button").instance(0) 
    Wait Until Element Is Visible         xpath=//android.widget.EditText[contains(@text, "/20")]    
    ...                                   10s  
    Click Element                         xpath=//android.widget.EditText[contains(@text, "/20")] 
    AppiumLibrary.Clear Text              xpath=//android.widget.EditText
    Input Text                            xpath=//android.widget.EditText
    ...                                   ${data}
    Click Element                         accessibility_id=OK

Inserir Hora
    [Arguments]                           ${hora}                   ${minutos}
    Wait Until Element Is Visible         xpath=//android.view.View[contains(@text, ':')]   
    ...                                   5s
    Click Element                         xpath=//android.view.View[contains(@text, ':')]
    Wait Until Element Is Visible         xpath=//android.widget.SeekBar[contains(@content-desc, "Selecione as horas ")]   
    ...                                   5s
    Click Element                         xpath=//android.widget.SeekBar[contains(@content-desc, "Selecione as horas ")]
    Click Element                         xpath=//android.widget.SeekBar[contains(@content-desc, "Selecione as horas ")]
    Sleep                                 5s
    Click Element                         xpath=(//android.widget.EditText)[1]
    AppiumLibrary.Clear Text              xpath=(//android.widget.EditText)[1]        
    Input Text                            xpath=//android.widget.EditText[1]
    ...                                   ${hora}
    Click Element                         xpath=(//android.widget.EditText)[2]
    Click Element                         xpath=(//android.widget.EditText)[2]
    Click Element                         xpath=(//android.widget.EditText)[2]
    AppiumLibrary.Clear Text              xpath=(//android.widget.EditText)[2]
    Input Text                            xpath=//android.widget.EditText[2]
    ...                                   ${minutos}
    Click Element                         accessibility_id=OK

Inserir Justificativa e registrar
    [Arguments]                          ${justificativa}
    Wait Until Element Is Visible        accessibility_id=${justificativa}
    ...                                  5s
    Click Element                        accessibility_id=${justificativa}
    Click Element                        accessibility_id=Registrar Ponto Retroativo
    Wait Until Element Is Visible        accessibility_id=Sim   
    ...                                  5s
    Click Element                        accessibility_id=Sim

Fluxo de justificativa
    [Arguments]                          ${funcionario}
    New Browser                          chromium                               headless=False
    New Page                             https://pontos.topsoft.inf.br/#/login

   
    Fill Text                            xpath=//input[@type='email' and @name='email']       
    ...                                  demo@topsoft.inf.br
    Fill Text                            xpath=//input[@type='password' and @placeholder='Senha']  
    ...                                  demo
    Click                                xpath=//span[contains(@class, 'block') and text()='ENTRAR']

    
    Click                                xpath=(//i[contains(@class, 'material-icons') and text()='keyboard_arrow_down'])[1]
    Click                                xpath=(//div[contains(@class, 'q-item__label') and text()='Funcionário'])[1]
    Click                                xpath=//div[@class='q-item__label' and text()='${funcionario}']

   
    Click                                xpath=(//i[contains(@class, 'fa-edit')])[1]
    Click                                xpath=//div[text()='Validar Marcações']
    Click                                xpath=(//span[contains(@class, 'q-btn__content')][contains(., 'Salvar')])[2]
    Click                                xpath=(//span[contains(@class, 'q-btn__content')][contains(., 'Salvar')])[1]

 
    Wait For Elements State              xpath=//div[contains(@class, 'q-notification__message') and contains(text(), 'sucesso')]  visible  2s
    Take Screenshot                           

Desativar Internet
    [Arguments]            ${adb}
   Run Process      adb -s ${adb} shell cmd wifi set-wifi-enabled disabled    shell=True 

Ativar Internet
    [Arguments]            ${adb}
   Run Process      adb -s ${adb} shell cmd wifi set-wifi-enabled enabled      shell=True 