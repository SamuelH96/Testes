*** Settings ***
Documentation                                   Keywords referentes ao teste de ordem de serviço


Library                                         SikuliLibrary
Library                                         Dialogs


Resource                                        login.resource

*** Variables ***
${CAMPO_DE_PESQUISA}                             ../elements/pesquisar_produto.png


*** Keywords ***
Definir operação
    [Arguments]                                ${operação}
    Click                                      ${operação}.png

Selecionar atendente
    Click                                       atendente.png
    Press Special Key                           DOWN
    Sleep                                       0.2
    Press Special Key                           ENTER
    Click                                       meio de abertura.png
    Press Special Key                           DOWN
    Sleep                                       0.2
    Press Special Key                           ENTER

Selecionar Cliente
    [Arguments]                                 ${cliente}
    Press Special Key                           F10
    Input Text                                  campo de busca.png                   ${cliente}
    Press Special Key                           ENTER  
    Sleep                                       0.2
    Press Special Key                           ENTER                  

Selecionar equipamento
    Press Special Key                           F1
    Click                                       clique_equipamento.png
    Press Special Key                           DOWN
    Sleep                                       0.2
    Press Special Key                           DOWN
    Sleep                                       0.2
    Press Special Key                           ENTER
    Verificar barra status
    Press Special Key                           F8
    
Verificar barra status
     ${tela_status_visivel}=    
    ...    Run Keyword And Return Status
    ...     Wait Until Screen Contain                   status_eq.png                   5
            
                
    
    Run Keyword If    ${tela_status_visivel}
    ...    Clicar no status desejado
    ...    ELSE
    ...    Log                                 Barra de status não encontrada - Prosseguindo

Clicar no status desejado
    Click                                      status_eq.png 
    Wait Until Screen Contain                  statusds.png                   5
    Press Special Key                          DOWN
    Sleep                                      0.2
    Press Special Key                          ENTER
    Sleep                                                                                                   1s   
    Log                                        Clicou no status desejado e prosseguiu com o teste.

Adicionar produto(pr)/serviço(se)
    [Arguments]                                 ${referência}                       ${funcionário}
    Sleep                                       0.2
    Input Text                                  referência.png                      ${referência}
    Press Special Key                           ENTER                             
    Click                                       ${funcionário}.png
    Press Special Key                           DOWN
    Sleep                                       0.2
    Press Special Key                           ENTER
    Capture Screen
    Click                                       +.png
    Click                                       adicionar.png
    Press Special Key                           F8

Adicionar produto de terceiros
    [Arguments]                                 ${referência2}
    Click                                       terceiros.png
    Press Special Key                           F7
    Input Text                                  referência2.png                      ${referência2}
    Press Special Key                           ENTER          
    Click                                       confirmar.png
    Capture Screen

Salvar 
    Press Special Key                           F12
    Verificar Tela confirmação
    Sleep                                       2

  
Verificar Tela confirmação
    ${tela_confirmação_visivel}=    
    ...    Run Keyword And Return Status
    ...    Wait Until Screen Contain            confirmaçãoOS.png                   5
            
                
    
    Run Keyword If    ${tela_confirmação_visivel}
    ...    Clicar em não
    ...    ELSE
    ...    Log                                 Tela de confirmação não encontrada - Prosseguindo

Clicar em não
    Click                                       não.png
    Sleep                                                                                                   1s   
    Log                                        Clicou em não e prosseguiu com o teste.

Modificando status
    [Arguments]                                 ${status}
    Sleep                                       0.2
    Press Special Key                           ${status}
    Verificar Tela de pagamento

Verificar Tela de pagamento
    ${tela_pagamento_visivel}=    
    ...    Run Keyword And Return Status
    ...     Wait Until Screen Contain                   pagamentoOS.png                   5
  
                
    
    Run Keyword If    ${tela_pagamento_visivel}
    ...    Clicar em OK
    ...    ELSE
    ...    Log                                 Tela de pagamento não encontrada - Prosseguindo

Clicar em Ok
    Click                                      ok.png
    Sleep                                      0.5  
    Log                                        Clicou em ok e prosseguiu com o teste.

Fechar parcialmente                              
    Press Special Key                           F10
Concluir
    Sleep                                       0.5
    Click                                       F12.png
    Input Text                                  entrada.png                          10
    Click                                       F12-F.png
    Input Text                                  total.png                            500
    Press Special Key                           F12

Impressão
    [Arguments]                                 ${impressão}
    Click                                       ${impressão}.png
    Sleep                                       0.2

Verificar novo status
    [Arguments]                                 ${status}
    Click                                       ${status}.png
    Sleep                                       1
    Capture Screen

Cancelar
    [Arguments]                                 ${motivo}
    Wait Until Screen Contain                   motivo do cancelamento.png            5
    Input Text                                  motivo do cancelamento.png            ${motivo}
    Click                                       ok_cancelar.png
    Wait Until Screen Contain                   confirmação2.png                      5
    Press Special Key                           ENTER

Selecione um Orçamento
    ${status_fechamento}    ${mensagem}    Run Keyword And Ignore Error    
    ...     Wait Until Screen Contain    fechamento.png    5s
    Run Keyword If    '${status_fechamento}' == 'PASS'    Click    fechamento.png

    Run Keyword If    '${status_fechamento}' == 'FAIL'    
    ...    Click       clique.png

Gerando Os de Orçamento
    Click                                       checarestoque.png
    Click                                       ok.png
    Click                                       gerarOS.png
    Press Special Key                           ENTER
    Viajar pelo Menu de Serviço                 Ordem de Serviço
    Capture Screen
    Verificar Tela de autorização

Verificar Tela de autorização
    Set Min Similarity                                  0.90
    ${tela_autorização_visivel}=    
    ...    Run Keyword And Return Status
    ...     Wait Until Screen Contain                   autorizar.png                   5
  
                
    
    Run Keyword If    ${tela_autorização_visivel}
    ...    Clicar em autorizar
    ...    ELSE
    ...    Log                                 Tela de autorização não encontrada - Prosseguindo

Clicar em autorizar
    Click                                       autorizar.png
    Sleep                                       0.5
    Press Special Key                           ENTER
    Log                                         Clicou em autorizar e prosseguiu com o 

Aviso de produtos pendentes
    Wait Until Screen Contain    aviso_concluir.png    10
    Press Special Key    ENTER

Entregar produtos
    Viajar pelo Menu de Serviço                 entrega_produtos
    Click                                       produto.png
    Click                                       entregar_todos.png
    Wait Until Screen Contain                   confirmação_pod.png                    5
    Press Special Key                           ENTER
    Click                                       salvar.png
    Click                                       ok.png
    Viajar pelo Menu de Serviço                 Ordem de Serviço
    
Tentar concluir novamente
    Click                                       Concluir Os.png

Realizar entrega e conclusão
    Entregar produtos
    Tentar concluir novamente

Aviso de Movimentação
    Wait Until Screen Contain    aviso_cancelar.png    10
    Press Special Key    ENTER
Estornar Entregas
    [Arguments]                                 ${os}
    Clicar em atalhos do menu                   atalho_entregarP
    Input Text                                  ${CAMPO_DE_PESQUISA}                 ${os}
    Click                                       filtrar_produto.png
    Click                                       ordem_de_serviço_estornar.png
    Click                                       clique2.png
    Click                                       estornar.png
    Click                                       salvar_estorno.png
    Click                                       salvar.png
    Click                                       ok.png
    Viajar pelo Menu de Serviço                 Ordem de Serviço
    Click                                       F5.png

Clicar em atalhos do menu
    [Arguments]                                 ${atalho}
    Click                                       ${atalho}.png

Selecionar Equipamentos
    Click                                       pendente.png
    Click                                       equipamento.png

Inserir retirada
    [Arguments]                                 ${retirada}
    Click                                       retirada.png
    Input Text                                  retirada.png                  ${retirada}

Entregar
    Press Special Key                           F12
    Press Special Key                           ENTER

Verificar comprovante
    Sleep                                       2
    Capture Screen    
    Click                                       fechar.png
    
Executar Sob Demanda
    ${resposta}=    Get Value From User   Deseja executar este teste? (s/n)    
    Pass Execution If    $resposta.lower() != 's'    Teste não foi solicitado. ✅

Input User Value Os
    [Documentation]    Pede ao usuário para digitar um valor e insere esse valor no campo de entrada.
    ${valor}=    Get Value From User    Digite um valor para o campo:
    Input Text    ${CAMPO_DE_PESQUISA}   ${valor}

