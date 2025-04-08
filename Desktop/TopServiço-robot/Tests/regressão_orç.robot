*** Settings ***
Documentation                            Documento principal da regressão dos 
...                                      Testes Recorrentes de Ordem de serviço

Resource                                 ../Resource/base.resource

Suite Setup                               Iniciar Sessão
Suite Teardown                            Encerrar Sessão


*** Test Cases ***
Incluir um Orçamento
    [Tags]                                   incluir
    Entrar com usuário Top                   usuario=top                 senha=J3.16-top
    Menu de serviço                          assistência                 orçamento                             
    Definir operação                         incluir
    Selecionar atendente                     
    Selecionar Cliente                       consumidor
    Selecionar equipamento
    Adicionar produto(pr)/serviço(se)        7646                        vendedor
    Adicionar produto de terceiros           5114
    Salvar

Cancelar Orçamento
    [Tags]                                   cancelar
    Modificando status                       F5
    Cancelar                                 Falta do que fazer
    Verificar novo status                    canceladas

Gerar OS
    [Tags]                                   gerar
    Click                                    abertas.png
    Selecione um Orçamento                   52
    Modificando status                       F6
    Gerando Os de Orçamento
    Finalizar teste
    