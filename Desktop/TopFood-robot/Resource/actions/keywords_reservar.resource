*** Settings ***
Documentation                                    Documento referente as keywords correspondetes a Reservar Mesa/Comanda

Library                                          SikuliLibrary


*** Keywords ***

Reservar mesa/comanda
    Sleep                                        3
    Press Special Key                            F8
Selecionar Mesa/Comanda
    [Arguments]                                  ${mesa}
    SikuliLibrary.Click                                        mesa_reservar.png
    Input Text                                   mesa_reservar.png
    ...                                          ${mesa}
    Press Special Key                            DOWN
    Press Special Key                            ENTER 

Selecionar Cliente - Reserva
    [Arguments]                                  ${cliente}
    SikuliLibrary.Click                          cliente_clicado.png
    Input Text                                   cliente_clicado.png
    ...                                          ${cliente}
    Press Special Key                            DOWN
    Sleep                                        0.5
    Press Special Key                            ENTER

Selecionar data
    [Arguments]                                  ${data}
    Set Min Similarity                           0.85
    Right Click                                  data_reserva.png
    Press Special Key                            DOWN
    Press Special Key                            DOWN
    Press Special Key                            DOWN
    Press Special Key                            DOWN
    Press Special Key                            DOWN
    Press Special Key                            DOWN
    Press Special Key                            DOWN
    Press Special Key                            ENTER
    Press Special Key                            DELETE
    Input Text                                   data_clicada.png
    ...                                          ${data}
    SikuliLibrary.Click                                        confirmar.png

Validar Mesa/Comanda reservada
    [Arguments]                                  ${mesa}
    Wait Until Screen Contain                    sucesso_reserva.png
    ...                                          5
    Capture Screen
    SikuliLibrary.Click                          opções.png
    SikuliLibrary.Click                          lista_reservas.png
    SikuliLibrary.Click                          mesa_reservar.png
    Input Text                                   mesa_reservar.png
    ...                                          ${mesa}
    Press Special Key                            DOWN
    Press Special Key                            ENTER 
    Capture Screen
    SikuliLibrary.Click                          x.png
    
