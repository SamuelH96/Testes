*** Settings ***
Documentation                            Documento principal da regressão dos 
...                                      Testes Recorrentes de Ordem de Serviço

Resource                                 ../Resource/base.resource

Suite Setup                               Iniciar Sessão
Suite Teardown                            Encerrar Sessão


*** Test Cases ***
Incluir uma Ordem de Serviço
    [Tags]                                   incluir
    Entrar com usuário Top                   usuario=top                 senha=J3.16-top
    Menu de serviço                          assistência                 Ordem de Serviço  
    Definir operação                         incluir      
    Selecionar atendente                     
    Selecionar Cliente                       venda
    Selecionar equipamento
    Adicionar produto(pr)/serviço(se)        910                    
    Adicionar produto de terceiros           194
    Salvar

Fechar Ordem de serviço
    [Tags]                                   concluir
    Modificando status                       F6
    ${aviso_presente}=    Run Keyword And Return Status    Aviso de produtos pendentes
    Run Keyword If    ${aviso_presente}     Realizar entrega e conclusão  
    Concluir 
    Impressão                                
    Verificar novo status                    concluídas

Cancelar Ordem de serviço
    [Tags]                                   cancelar
    Click                                    abertas.png
    Modificando status                       F5
    ${aviso_present}=    Run Keyword And Return Status    Aviso de Movimentação
    Run Keyword If    ${aviso_present}       Estornar Entregas                                                                  
    Cancelar                                 Falta do que fazer
    Verificar novo status                    canceladas
    

Fechar parcialmente uma Ordem de serviço
    [Tags]                                   parcial
    Click                                    abertas.png
    Definir operação                         incluir      
    Selecionar atendente                     
    Selecionar Cliente                       consumidor
    Selecionar equipamento
    Salvar
    Modificando status                       F6
    Fechar parcialmente
    Impressão                                
    Verificar novo status                    fech_parcial 

Duplicar Ordem de Serviço
    [Tags]                                   duplicar
    Click                                    abertas.png
    Duplicar

Entregar equipamentos
    Executar Sob Demanda
    Viajar pelo Menu de Serviço               entrega_equipamentos
    Selecionar Equipamentos
    Inserir retirada                          Marcos Vinicius
    Entregar
    Verificar comprovante
    Finalizar teste