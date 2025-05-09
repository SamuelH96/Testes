*** Settings ***
Documentation                                    Documento referente aos casos de Teste de Tele Entrega

Resource                                         ../Resource/base.resource

Suite Setup                                      Iniciar Sessão
Suite Teardown                                   Encerrar Sessão
                                 

*** Test Cases ***
Deve realizar uma entrega
    Entrar com usuário Top                       usuario=balanca              senha=123  
    Menu                                         Food                          
    Realizar Tele Entrega
    Fluxo Pedido                                 30/05/2025
    Verificar tela de entrega
    Validar entrega                              venda

