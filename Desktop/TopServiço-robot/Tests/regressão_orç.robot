*** Settings ***
Documentation                            Documento principal da regressão dos 
...                                      Testes Recorrentes de Orçamentos

Resource                                 ../Resource/base.resource

Suite Setup                               Iniciar Sessão
Suite Teardown                            Encerrar Sessão


*** Test Cases ***
Incluir um Orçamento
    [Tags]                                   incluir
    Entrar com usuário Top                   usuario=top                 senha=123
    Menu de serviço                          assistência                 orçamento                             
    Definir operação                         incluir
    Selecionar atendente                     
    Selecionar Cliente                       consumidor
    Selecionar equipamento
    Adicionar produto(pr)/serviço(se)        7808                        
    Adicionar produto de terceiros           7808
    Salvar

Cancelar Orçamento
    [Tags]                                   cancelar
    Modificando status                       F5
    Cancelar                                 Falta do que fazer
    Verificar novo status                    canceladas

Gerar OS
    [Tags]                                   gerar
    Click                                    abertas.png
    Definir operação                         incluir
    Selecionar atendente                     
    Selecionar Cliente                       consumidor
    Selecionar equipamento
    Salvar                                    
    Modificando status                       F6
    Gerando Os de Orçamento
    Verificar OS gerada                  
    Finalizar teste
    