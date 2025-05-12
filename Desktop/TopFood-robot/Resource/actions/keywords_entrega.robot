*** Settings ***
Documentation                                    Documento referente as keywords correspondetes a Tele Entrega

Library                                          SikuliLibrary
Resource                                         keywords_pedido.resource
Resource                                         login.resource


*** Keywords ***
Realizar Tele Entrega
    SikuliLibrary.Click                                         tele_entrega.png
    Sleep                                                       2
    SikuliLibrary.Click                                         novo_pedido.png
    Press Special Key                            UP
    Press Special Key                            UP
    Press Special Key                            ENTER

Fluxo Pedido
    [Arguments]                                  ${data}
    Filtrar item                                                                                                    
    Selecionar cliente - tele entrega                           venda ao consumidor

    SikuliLibrary.Click                                         agendar.png
    SikuliLibrary.Click                                         data_agendamento.png
    Set Min Similarity                           0.65
    Input Text                                   data_agendamento.png
    ...                                          ${data}
    SikuliLibrary.Click                                        hora_agendamento.png
    Press Special Key                            DOWN
    Press Special Key                            DOWN
    Press Special Key                            DOWN
    Press Special Key                            ENTER
    Sleep                                        1s
    SikuliLibrary.Click                                        confirmar.png

    Adicionar pagamento                          F2
    Verificar tela de entrega
Verificar tela de entrega
     ${tela_entrega_visivel}=    
    ...    Run Keyword And Return Status
    ...    Wait Until Screen Contain             tela_pagamento.png           5
            
                
    
    Run Keyword If    ${tela_entrega_visivel}
    ...    Executar entrega
    ...    ELSE
    ...    Log                                   Tela de informação não encontrada - Prosseguindo

Inserir Taxa de entrega
    SikuliLibrary.Click                          taxa.png
    Press Special Key                            DOWN
    Press Special Key                            ENTER

Executar entrega
    Press Special Key                            F12                                        
    Log                                          Executou o pagamento Gerencial e prosseguiu com o teste
    SikuliLibrary.Click                          entregar.png
    SikuliLibrary.Click                          joão.png
    Press Special Key                            ENTER
    Capture Screen

Validar entrega
    [Arguments]                                  ${cliente}
    Menu
    Set Min Similarity                           0.85
    SikuliLibrary.Click                          barra de rolagem.png  
    Wheel Down                    45             barra de rolagem.png                                
    Viajar pelo Menu                             histórico
    SikuliLibrary.Click                                        buscar.png
    Sleep                                        3
    Capture Screen


