*** Settings ***
Documentation                                    Documento referente as keywords correspondetes a Tele Entrega

Library                                          SikuliLibrary
Resource                                         keywords_pedido.resource
Resource    login.resource


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
    Selecionar cliente                           venda ao consumidor
    
    SikuliLibrary.Click                                         taxa.png
    Press Special Key                            DOWN
    Press Special Key                            ENTER

    SikuliLibrary.Click                                         agendar.png
    SikuliLibrary.Click                                         data_agendamento.png
    Input Text                                   data_agendamento.png
    ...                                          ${data}
    SikuliLibrary.Click                                        hora_agendamento.png
    Press Special Key                            DOWN
    Press Special Key                            DOWN
    Press Special Key                            DOWN
    Press Special Key                            ENTER
    Sleep                                        5s
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

Executar entrega
    Press Special Key                            F12                                        
    Log                                          Executou o pagamento Gerencial e prosseguiu com o teste
    SikuliLibrary.Click                          entregar.png
    SikuliLibrary.Click                          joão.png
    Press Special Key                            ENTER
    Capture Screen

Validar entrega
    [Arguments]                                  ${cliente} 
    Viajar pelo Menu                             Food          histórico
    SikuliLibrary.Click                                        cliente_histórico.png
    Input Text                                   cliente_histórico.png
    ...                                          ${cliente}   
    SikuliLibrary.Click                                       ignorar_data.png
    SikuliLibrary.Click                                        buscar.png
    Sleep                                        3
    Capture Screen


