*** Settings ***
Documentation                                   Keywords referentes ao teste de ordem de serviço


Library                                         SikuliLibrary
Library                                         Dialogs

Resource                                        login.resource

*** Variables ***
${CAMPO_DE_PESQUISA}                             ../elements/pesquisar_produto.png
${CAMPO_PESQUISA}                                ../elements/n°os_duplicar.png
${CAMPO_PESQUISA_ORÇ}                            ../elements/n°ORÇ.png


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
    Sleep                                       0.2
    Press Special Key                           F1
    Sleep                                       2
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
    [Arguments]                                 ${referência}                      
    Sleep                                       0.2
    Set Min Similarity                          0.69
    Input Text                                  referência.png                      ${referência}
    Press Special Key                           ENTER
    Set Min Similarity                          0.95

    ${status}  ${value}=     Run Keyword And Ignore Error
    ...      Wait Until Screen Contain    produtivo.png    3  
    
    Run Keyword If    '${status}' == 'PASS'
    ...    Click                                 produtivo.png 
    ...    ELSE
    ...    Vendedor/produtivo
   
    
    ${status__}  ${value__}=     Run Keyword And Ignore Error
    ...      Wait Until Screen Contain    confirmação_desconto.png    3  
    
    Run Keyword If    '${status__}' == 'PASS'
    ...    Press Special Key              ENTER


    Press Special Key                           DOWN
    Sleep                                       0.2
    Press Special Key                           ENTER
    Capture Screen

    ${status_}  ${value_}=     Run Keyword And Ignore Error
    ...                        Clicar
    
    Run Keyword If    '${status_}' == 'PASS'        
    ...    Click                     adicionar.png    
    ...    ELSE                                  
    ...    Press Special Key                           F8
  
Clicar
    Wait Until Screen Contain          +.png   3     
    Click                     +.png    

Vendedor/produtivo
    Set Min Similarity                    0.60
    Click                                 vendedor.png  
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
    Click                                       não.png
    Wait Until Screen Contain                   sucesso.png                         5
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
    Verificar Tela de arquivo de impressão

Concluir
    Sleep                                       0.5
    Click                                       F12.png
    ${tela_visivel}=    Verificar Tela de arquivo de impressão
   IF    not ${tela_visivel}
        Input Text                              entrada.png      10
        Click                                   F12-F.png
        Input Text                              total.png        500
        Press Special Key                       F12
    END

Verificar Tela de arquivo de impressão
    ${tela_arquivo_visivel}=    
    ...    Run Keyword And Return Status
    ...     Wait Until Screen Contain                   arquivo_de_impressão.png                   5
  
    IF    ${tela_arquivo_visivel}
        Press Special Key                       ENTER
    END
    RETURN    ${tela_arquivo_visivel}

Impressão
    ${tela_disponivel}=    Verificar não 
     IF    ${tela_disponivel}
        ${impressão}         Get Value From User    Digite se deseja imprimir (s/n):
        Click                                       ${impressão}.png 
        Sleep                                       0.5  
        Verificar Tela de impressão
    END   

Verificar não
    Set Min Similarity         0.95
    ${tela_impressao_visivel}=    Run Keyword And Return Status
    ...    Wait Until Screen Contain    n.png    5
    RETURN    ${tela_impressao_visivel}
    

Verificar Tela de impressão
    ${tela_impressão_visivel}=    
    ...    Run Keyword And Return Status
    ...     Wait Until Screen Contain                   validação_impressão.png                   5
    
    Run Keyword If    ${tela_impressão_visivel}
    ...    Verificar impressão
    ...    ELSE
    ...    Log                                 Tela de impressão não encontrada - Prosseguindo          
    

Verificar novo status
    [Arguments]                                 ${status}
    Set Min Similarity                          0.60
    Click                                       ${status}.png
    Sleep                                       1
    Capture Screen

Cancelar
    [Arguments]                                 ${motivo}
    Wait Until Screen Contain                   motivo do cancelamento.png            2
    Input Text                                  motivo do cancelamento.png            ${motivo}
    Click                                       ok_cancelar.png
    Set Min Similarity                          0.50
    Wait Until Screen Contain                   confirmação2.png                      2
    Press Special Key                           ENTER

Gerando Os de Orçamento 
    Click                                       checarestoque.png
    Click                                       ok.png
    Click                                       gerarOS.png
    Press Special Key                           ENTER
    Viajar pelo Menu de Serviço                 Ordem de Serviço

Verificar OS gerada
    Wait Until Screen Contain                   pesquisar.png                       5
    Click                                       pesquisar.png
    ${orç}=    Get Value From User              Digite o número do Orçamento: 
    Input Text                                  ${CAMPO_PESQUISA_ORÇ}          ${orç}
    Click                                       filtrar.png
    Sleep                                       5
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
    Clicar em atalhos do menu    atalho_entregarP
   ${os}=    Get Value From User                Digite o número da OS:    
    Input Text    ${CAMPO_DE_PESQUISA}          ${os}  
    Click                                       filtrar_produto.png
    Click                                       ordem_de_serviço_estornar.png
    Clicar nas ocorrências
    Click                                       salvar.png
    Click                                       ok.png
    Viajar pelo Menu de Serviço                 Ordem de Serviço
    Click                                       F5.png
  
Clicar nas ocorrências                
    ${quantidade}=    Image Count               clique2.png

    FOR    ${index}    IN RANGE                 ${quantidade}
    Set Min Similarity                          0.82
     Run Keyword And Ignore Error
    ...     Fluxo Completo
    END

Fluxo Completo
        Highlight    clique2.png                  
        Click        clique2.png
        Click        estornar.png
        Click        salvar_estorno.png

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
    Sleep                                       0.3
    Press Special Key                           ENTER

Verificar comprovante
    Sleep                                       2
    Capture Screen    
    Click                                       fechar.png
    
Executar Sob Demanda
    ${resposta}=    Get Value From User   Deseja executar este teste? (s/n)    
    Pass Execution If    $resposta.lower() != 's'    Teste não foi solicitado. ✅

Duplicar
    Sleep                                       1
    Capture Screen
    Press Special Key                           F8
    ${os}         Get Value From User           Digite o número da OS:
    Input Text                                  ${CAMPO_PESQUISA}              ${os}
    Click                                       filtrar_os.png
    Click                                       Duplicar.png
    Press Special Key                           ENTER
    Verificar Tela de autorização - duplicar
    Sleep                                       1
    Capture Screen

Verificar Tela de autorização - duplicar
    Set Min Similarity                                  0.90
    ${tela_autorização_visivel}=    
    ...    Run Keyword And Return Status
    ...     Wait Until Screen Contain                   sim.png                         5
  
    
    Run Keyword If    ${tela_autorização_visivel}
    ...    Autorizar
    ...    ELSE
    ...    Log                                 Tela de autorização não encontrada - Prosseguindo

Autorizar
    Press Special Key                                   ENTER
    Sleep                                               0.2
    Press Special Key                                   ENTER
    Click                                               autorizar.png
    Press Special Key                                   ENTER

Verificar impressão
    Capture Screen
    Click                                       fechar.png