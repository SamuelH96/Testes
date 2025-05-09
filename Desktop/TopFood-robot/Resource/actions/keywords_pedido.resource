*** Settings ***
Documentation                                    Documento referente as keywords correspondetes a Pedido/Pedido Balcão
...                                              /Tele Entrega/Pedido de caixa e Caixa Rápido

Library                                          SikuliLibrary

*** Keywords ***
Pesquisar mesa/Comanda
    [Arguments]                                  ${mesa_comanda}
    SikuliLibrary.Click                          pesquisar mesa_comanda.png
    Input Text                                   pesquisar mesa_comanda.png
    ...                                          ${mesa_comanda}
    
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
    SikuliLibrary.Click                          filtrar_item.png
    Sleep                                        10
    SikuliLibrary.Click                          buscar_item.png
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

Selecionar cliente
    [Arguments]                                  ${cliente}
    SikuliLibrary.Click                                        cliente.png
    Input Text                                   cliente.png
    ...                                          ${cliente}
    Press Special Key                            DOWN
    Sleep                                        0.5
    Press Special Key                            ENTER
    Capture Screen

Adicionar pagamento
    [Arguments]                                  ${Pagamento}
    Press Special Key                            F8
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
    [Arguments]                                  ${cliente} 
    Press Special Key                            F4
    SikuliLibrary.Click                                        cliente_histórico.png
    Input Text                                   cliente_histórico.png
    ...                                          ${cliente}   
    SikuliLibrary.Click                                       ignorar_data.png
    SikuliLibrary.Click                                        buscar.png
    Sleep                                        3
    Capture Screen

Selecionar mesa - Pedido Balcão/Pedido de Caixa
    SikuliLibrary.Click                                        selecionar_mesa.png
    Press Special Key                            DOWN
    Press Special Key                            ENTER

Selecionar mesa - Caixa Rápido
    SikuliLibrary.Click                                       mesa_caixa_rápido.png
    Input Text                                   mesa_caixa_rápido.png
    ...                                          015
    Press Special Key                            DOWN
    Press Special Key                            ENTER

                                            