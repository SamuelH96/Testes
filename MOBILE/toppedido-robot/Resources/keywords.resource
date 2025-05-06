*** Settings ***
Documentation                             Principais keywords do projeto


Library                                   AppiumLibrary


*** Keywords ***
Clicar no botão de novo pedido
    Wait Until Element Is Visible         xpath=//android.widget.Button[contains(@content-desc, 'Novo Pedido')]
    ...                                   50s
    Click Element                         xpath=//android.widget.Button[contains(@content-desc, 'Novo Pedido')]
    Wait Until Element Is Visible         xpath=//android.view.View[contains(@content-desc, 'Novo Pedido')]
    ...                                   2s

Pesquisar e adicionar pedido 
    [Arguments]                           ${pedido}                                        ${referencia}              
    Click Element                         accessibility_id=Adicionar
    Wait Until Element Is Visible         xpath=//android.widget.EditText                  2s
    Click Element                         xpath=//android.widget.EditText
    Clear Text                            xpath=//android.widget.EditText
    Input Text                            xpath=//android.widget.EditText
    ...                                   ${pedido}
    
    
    Wait Until Element Is Visible         android=new UiSelector().descriptionContains("${referencia}")
    ...                                   5s
    Click Element                         android=new UiSelector().descriptionContains("${referencia}")
    
    Click Element                         xpath=//android.view.View//android.widget.Button[2]
    Click Element                         xpath=//android.view.View//android.widget.Button[2]
    Click Element                         xpath=//android.view.View//android.widget.Button[1]
    
    Click Element                         xpath=//android.widget.Button[contains(@content-desc, 'Adicionar')]
    Wait Until Element Is Visible         xpath=//android.view.View[contains(@content-desc, 'Produto Adicionado!')]
    ...                                   3s
    
Escolher Cliente
    [Arguments]                           ${cliente}  
    Wait Until Element Is Visible         xpath=//android.view.View[contains(@content-desc, 'Cliente')]                2s                                  
    Click Element                         xpath=//android.view.View[contains(@content-desc, 'Cliente')]
    Click Element                         xpath=//android.view.View[@content-desc="Cliente"]/android.view.View

    Wait Until Element Is Visible         xpath=//android.widget.EditText                 2s
    Click Element                         xpath=//android.widget.EditText
    Input Text                            xpath=//android.widget.EditText                 ${cliente}

    Sleep                                 3s
    Get Element Attribute                 xpath=//android.widget.Button[contains(@content-desc, '${cliente}')]
    ...                                   clickable
    Click Element                         xpath=//android.widget.Button[contains(@content-desc, '${cliente}')]

Fechar e finalizar pedido
    [Arguments]                           ${enviar/salvar}
    Click Element                         android=new UiSelector().className("android.widget.Button").instance(1)

    Wait Until Element Is Visible         accessibility_id=Finalizar Pedido               5s
    Click Element                         xpath=//android.view.View[contains(@content-desc, '${enviar/salvar}')]

Verificar envio
    Wait Until Element Is Visible         accessibility_id=Pedido Enviado com Sucesso!                   15
    Capture Page Screenshot
    Click Element                         accessibility_id=Ver Comprovante
    Sleep                               1
    Capture Page Screenshot
    Click Element                         accessibility_id=Voltar
    Click Element                         accessibility_id=Voltar para o Início

Verificar salvo e enviar
    Wait Until Element Is Visible         accessibility_id=Pedido Salvo com Sucesso!                     25
    Capture Page Screenshot
    Click Element                         accessibility_id=Ver Comprovante
    Capture Page Screenshot
    Click Element                         accessibility_id=Voltar
    Click Element                         accessibility_id=Voltar para o Início

    Wait Until Element Is Visible   xpath=//android.widget.Button[contains(@content-desc, 'Meus Pedidos')]
    ...                             5s
    Click Element                   xpath=//android.widget.Button[contains(@content-desc, 'Meus Pedidos')]
    Click element                   xpath=//android.view.View[contains(@content-desc, 'Off-line')]

    Click Element                   xpath=//android.widget.ImageView[contains(@content-desc, "PEDIDO OFF-LINE")]
    Click Element                       accessibility_id=Fechar
    Wait Until Element Is Visible       accessibility_id=Ver Comprovante
    Sleep                               1
    Click Element                       accessibility_id=Ver Comprovante

    Capture Page Screenshot

    Click Element                   accessibility_id=Voltar
    Click Element                   accessibility_id=Voltar          

    ${locator}                      Set Variable             XPATH=//android.widget.ImageView[contains(@content-desc, 'PEDIDO OFF-LINE')]
    ${positions}                    Get Element Location     ${locator}
    Tap With Positions              3000                     ${${positions}[x],${positions}[y]}
    
    Click Element                   accessibility_id=Enviar Pedidos
    Wait Until Element Is Visible   //android.view.View[contains(@content-desc, 'Enviado com Sucesso!')]
    ...                             5s
    Click Element                   xpath=//android.widget.Button[@content-desc="Voltar"]

Sincronização rápida 
    Click Element                   android=new UiSelector().className("android.widget.Button").instance(1)
    Wait Until Element Is Visible   xpath=//android.view.View[contains(@content-desc, "Sincronizar Dados")]
    ...                             3s
    Click Element                   xpath=//android.view.View[contains(@content-desc, "Sincronizar Dados")]
    Click Element                   xpath=//android.view.View[contains(@content-desc, "Sincronização Rápida")]
    Wait Until Element Is Visible   accessibility_id=Configurações                           30s

Sincronização total
    [Arguments]                     ${sicronização}                                          ${senha}
    
    Wait Until Element Is Visible   xpath=//android.view.View[contains(@content-desc, "Sincronizar Dados")]
    ...                             3s
    Click Element                   xpath=//android.view.View[contains(@content-desc, "Sincronizar Dados")]
    Click Element                   xpath=//android.view.View[contains(@content-desc, "Backup e Sincronização Total")]
    
    Wait Until Element Is Visible        xpath=//android.view.View[starts-with(@content-desc, '${sicronização}')]
    ...                                  6s
    Click Element                        xpath=//android.view.View[starts-with(@content-desc, '${sicronização}')]
    
    ${autenticacao_visivel}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    accessibility_id=Autenticação Necessária    3s
    
    Run Keyword If    ${autenticacao_visivel}    Input Text    
    ...    xpath=//android.widget.EditText    ${senha}
    
    Run Keyword If    ${autenticacao_visivel}    Click Element    
    ...    accessibility_id=Autenticar
    Wait Until Element Is Visible   accessibility_id=Configurações                           35s

    Click Element                   accessibility_id=Voltar

Cliente com rotas
    Wait Until Element Is Visible      xpath=//android.widget.Button[contains(@content-desc, "Rotas")]             5
    Click Element                      xpath=//android.widget.Button[contains(@content-desc, "Rotas")]    

Selecionar Vendedor
    [Arguments]                         ${vendedor}
    Click Element                       accessibility_id=${vendedor}
    Wait Until Element Is Visible       xpath=//android.widget.EditText                      5

Selecionar Cliente
    [Arguments]                         ${CLIENTE}
    Wait Until Element Is Visible       xpath=//android.widget.EditText                                5
    Click Element                       xpath=//android.widget.EditText
    Input Text                          xpath=//android.widget.EditText
    ...                                 ${CLIENTE}
    Wait Until Element Is Visible       xpath=//android.view.View[contains(@content-desc, "BA")]      5
    Click Element                       xpath=//android.view.View[contains(@content-desc, "BA")]
    Click Element                       accessibility_id=Sim