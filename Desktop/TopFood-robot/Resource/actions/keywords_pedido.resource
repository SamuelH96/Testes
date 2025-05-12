*** Settings ***
Documentation                                    Documento referente as keywords correspondetes a Pedido/Pedido Balcão
...                                              /Tele Entrega/Pedido de caixa e Caixa Rápido

Library                                          SikuliLibrary
Resource                                         login.resource

*** Keywords ***
Pesquisar mesa/Comanda
    [Arguments]                                  ${mesa_comanda}
    Sleep                                        3
    SikuliLibrary.Click                          pesquisar mesa_comanda.png
    Input Text                                   pesquisar mesa_comanda.png
    ...                                          ${mesa_comanda}
    Press Special Key                            ENTER
    
Lançar item
    [Arguments]                                  ${produto}
    Press Special Key                            F7
    SikuliLibrary.Click                                        pesquisar_produto.png
    Input Text                                   pesquisar_produto.png
    ...                                          ${produto}
    SikuliLibrary.Click                                        produto.png
    Capture Screen
    Press Special Key                            F12

Filtrar item
    Sleep                                        1
    SikuliLibrary.Click                          filtrar_item.png
    Sleep                                        2
    SikuliLibrary.Click                          buscar_item.png
    Sleep                                        4
    Press Special Key                            DOWN
    Set Min Similarity                           0.95
    SikuliLibrary.Click                          marcador.png
    Press Special Key                            F12
    Capture Screen
    Press Special Key                            F12

Adicionar cortesia
    [Arguments]                                  ${produto}
    Press Special Key                            F5
    SikuliLibrary.Click                                        pesquisar_produto.png
    Input Text                                   pesquisar_produto.png
    ...                                          ${produto}
    SikuliLibrary.Click                                         produto.png
    Capture Screen
    Press Special Key                            F12

Selecionar cliente - tele entrega
    [Arguments]                                  ${cliente}
    Set Min Similarity                           0.99
    SikuliLibrary.Click                          cliente.png
    Set Min Similarity                           0.99
    Input Text                                   cliente_clicado_pedido.png
    ...                                          ${cliente}
    Press Special Key                            DOWN
    Sleep                                        0.5
    Press Special Key                            ENTER
    Capture Screen

Selecionar cliente
    [Arguments]                                  ${cliente}
    Set Min Similarity                           0.99
    SikuliLibrary.Click                          cliente_.png
    Set Min Similarity                           0.99
    Input Text                                   cliente_clicado_.png
    ...                                          ${cliente}
    Press Special Key                            DOWN
    Sleep                                        0.5
    Press Special Key                            ENTER
    Capture Screen
Adicionar pagamento
    [Arguments]                                  ${Pagamento}
    SikuliLibrary.Click                          adicionar_pagamento.png
    Sleep                                        0.5
    Press Special Key                            ${Pagamento}
    Sleep                                        0.5
    Press Special Key                            F12
    Verificar tela de pagamento

Verificar tela de pagamento
     ${tela_pagamento_visivel}=    
    ...    Run Keyword And Return Status
    ...    Wait Until Screen Contain             tela_pagamento.png           5
            
                
    
    Run Keyword If    ${tela_pagamento_visivel}
    ...    Executar pagamento
    ...    ELSE
    ...    Log                                   Tela de informação não encontrada - Prosseguindo

Executar pagamento
    Press Special Key                            F12                                        
    Log                                          Executou o pagamento Gerencial e prosseguiu com o teste

Validar histórico de pedidos
    Sleep                                        2
    Menu
    Set Min Similarity                           0.85
    SikuliLibrary.Click                          barra de rolagem.png  
    Wheel Down                    45             barra de rolagem.png                                
    Viajar pelo Menu                             histórico
    SikuliLibrary.Click                                        buscar.png
    Sleep                                        3
    Capture Screen

Selecionar mesa - Pedido Balcão/Pedido de Caixa
    SikuliLibrary.Click                                        selecionar_mesa.png
    Press Special Key                            DOWN
    Press Special Key                            ENTER

Selecionar mesa - Caixa Rápido
    SikuliLibrary.Click                          mesa_caixa_rápido.png
    Input Text                                   mesa_caixa_rápido.png
    ...                                          100
    Sleep                                        1
    Press Special Key                            DOWN
    Press Special Key                            ENTER

Pedido de Balcão
    Sleep                                        3
    SikuliLibrary.Click                          pedido_balcão.png

                                            