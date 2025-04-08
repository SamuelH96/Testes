*** Settings ***
Documentation                            Documento principal da regressão dos 
...                                      Testes Recorrentes de Orçamentos

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
    Adicionar produto(pr)/serviço(se)        7706                         vendedor
    Adicionar produto de terceiros           3372
    Salvar
Fechar Ordem de serviço
    [Tags]                                   concluir
    Modificando status                       F6
    Aviso de Produtos Pendentes
    Viajar pelo Menu de Serviço              entrega_produtos
    Entregar produtos
    Viajar pelo Menu de Serviço              Ordem de Serviço
    Click                                    Concluir Os.png
    Concluir 
    Impressão                                cancelar
    Verificar novo status                    concluídas

Cancelar Ordem de serviço
    [Tags]                                   cancelar
    Click                                    abertas.png
    Modificando status                       F5
    Aviso de Movimentação
    Clicar em atalhos do menu                atalho_entregarP
    Estornar Entregas                        89
    Viajar pelo Menu de Serviço              Ordem de Serviço
    Click                                    F5.png
    Cancelar                                 Falta do que fazer
    Verificar novo status                    canceladas
    

Fechar parcialmente uma ordem de serviço
    [Tags]                                   parcial
    Click                                    abertas.png
    Modificando status                       F6
    Fechar parcialmente
    Impressão                                cancelar
    Verificar novo status                    fech_parcial
    

Entregar equipamentos
    Viajar pelo Menu de Serviço               entrega_equipamentos
    Selecionar Equipamentos
    Inserir retirada                          Marcos Vinicius
    Entregar
    Verificar comprovante