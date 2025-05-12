*** Settings ***
Documentation                                     Documento referente as keywords correspondetes a Pedidos

Resource                                         ../Resource/base.resource

Test Setup                                      Iniciar Sessão
Test Teardown                                   Encerrar Sessão
                                 

*** Test Cases ***
Deve realizar um pedido
    [Tags]                                       pedido
    Entrar com usuário Top                       usuario=balanca              senha=123  
    Menu                                         Food
    Viajar pelo Menu                             mesas_comandas                         
    Pesquisar mesa/Comanda                       049
    Filtrar item
    Selecionar cliente                           venda ao consumidor
    Adicionar pagamento                          F2
    Validar histórico de pedidos       

Deve realizar um pedido de balcão
    [Tags]                                       balcão
    Entrar com usuário Top                       usuario=balanca              senha=123  
    Menu                                         Food
    Viajar pelo Menu                             mesas_comandas 
    Pedido de Balcão                        
    Filtrar item
    Selecionar cliente                           venda ao consumidor
    Adicionar pagamento                          F2
    Validar histórico de pedidos      

Deve realizar um pedido de caixa rápido
    [Tags]                                       caixa
    Entrar com usuário Top                       usuario=balanca              senha=123  
    Menu                                         Food
    Viajar pelo Menu                             caixa_rápido
    Selecionar mesa - Caixa Rápido                         
    Filtrar item
    Selecionar cliente                           venda ao consumidor
    Adicionar pagamento                          F2
    Validar histórico de pedidos                        

Deve realizar um pedido de caixa
    [Tags]                                       P_caixa
    Entrar com usuário Top                       usuario=balanca              senha=123  
    Menu                                         Food
    Viajar pelo Menu                             pedido_de_caixa                       
    Filtrar item
    Selecionar cliente                           venda ao consumidor
    Selecionar mesa - Pedido Balcão/Pedido de Caixa
    Adicionar pagamento                          F2
    Validar histórico de pedidos                        

Deve realizar uma entrega
    [Tags]                                       entrega
    Entrar com usuário Top                       usuario=balanca              senha=123  
    Menu                                         Food                          
    Realizar Tele Entrega
    Fluxo Pedido                                 30/05/2025
    Executar entrega
    Verificar tela de entrega
    Validar entrega                              venda