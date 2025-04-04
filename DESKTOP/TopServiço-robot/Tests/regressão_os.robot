*** Settings ***
Documentation                            Documento principal do projeto

Resource                                 ../Resource/base.resource

Suite Setup                               Iniciar Sessão
Suite Teardown                            Encerrar Sessão


*** Test Cases ***
Incluir uma Ordem de Serviço
    [Tags]                                   incluir
    Entrar com usuário Top                   usuario=top                 senha=123
    Menu de serviço
    Categorias de serviço                    assistência                 ordem de serviço                validaçãoOS
    Definir operação                         incluir
    Selecionar atendente                     externo
    Selecionar Cliente                       consumidor
    Selecionar equipamento
    Adicionar produto(pr)/serviço(se)        070S
    Adicionar produto de terceiros           070S
    Salvar OS


Fechar ou fechar parcialmente uma OS
    [Tags]                                   concluir
    Modificando status da Os                 F6
    Concluir 
    Impressão                                cancelar
    Verificar novo status                    concluídas

Cancelar Ordem de serviço
    [Tags]                                   cancelar
    Click                                    abertas.png
    Modificando status da Os                 F5
    Cancelar                                 Falta do que fazer
    Verificar novo status                    canceladas
    Finalizar teste

  