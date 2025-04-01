*** Settings ***
Documentation                    Casos de testes recorrentes

Resource                         ../Resources/base.resource
Resource                         ../Resources/keywords.resource

Test Setup                       Start Session

*** Test Cases ***
Deve finalizar um pedido e enviar
    [Tags]                               enviar
    Get Started                          123            Top Soft API (Wi-Fi/Empresa)
    Clicar no botão de novo pedido
    Pesquisar e adicionar pedido         Pastel         Pa400
    Escolher Cliente                     Venda Ao Consumidor
    Fechar e finalizar pedido            Enviar
    Verificar envio
    Close Session

Deve finalizar um pedido e salvar
    [Tags]                               salvar
    Get Started                          123            Banco de Dados Online (Externo)
    Clicar no botão de novo pedido
    Pesquisar e adicionar pedido         Pastel         Pa400f
    Escolher Cliente                     Venda Ao Consumidor
    Fechar e finalizar pedido            Salvar
    Verificar salvo e enviar   
    Close Session