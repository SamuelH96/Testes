*** Settings ***
Documentation                    Casos de testes recorrentes

Resource                         ../Resources/base.resource
Resource                         ../Resources/keywords.resource

Test Setup                       Start Session                             4723            5A4576H9L

*** Test Cases ***
Deve finalizar um pedido e enviar para um cliente sem rotas
    [Tags]                               enviar
    #Get Started                          123            Top Soft API (Wi-Fi/Empresa)
    Clicar no botão de novo pedido
    Pesquisar e adicionar pedido         Fita            9871361001840
    Escolher Cliente                     A Q R
    Fechar e finalizar pedido            Enviar
    Verificar envio
    #Close Session

Deve finalizar um pedido e salvar para um cliente sem rotas
    [Tags]                               salvar
    #Get Started                          123            Banco de Dados Online (Externo)
    Clicar no botão de novo pedido
    Pesquisar e adicionar pedido         Cafe         2
    Escolher Cliente                     A Q R
    Fechar e finalizar pedido            Salvar
    Verificar salvo e enviar  

Deve finalizar pedido e enviar para um cliente com rotas
    [Tags]                               enviarr
    Cliente com rotas
    Selecionar Vendedor                  Deusdeth
    Selecionar Cliente                   Alves Alecrim
    Pesquisar e adicionar pedido         Cafe         4
    Fechar e finalizar pedido            Enviar
    Verificar envio

Deve finalizar pedido e salvar para um cliente com rotas
    [Tags]                               salvarr
    Cliente com rotas
    Selecionar Vendedor                  Deusdeth
    Selecionar Cliente                   Alves Alecrim
    Pesquisar e adicionar pedido         Cafe         04
    Fechar e finalizar pedido            Salvar
    Verificar salvo e enviar

Deve realizar as sicronizações
    [Tags]                              sincronizar
    Sincronização rápida
    Sincronização total                 Banco de Dados Online (Externo)       123