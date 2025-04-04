*** Settings ***
Documentation                                   Keywords referentes ao teste de ordem de serviço


Library                                         SikuliLibrary

*** Keywords ***
Definir operação
    [Arguments]                                ${operação}
    Click                                      ${operação}.png

Selecionar atendente
    [Arguments]                                 ${meio}
    Click                                       atendente.png
    Click                                       dirceu.png
    Click                                       meio de abertura.png
    Click                                       ${meio}.png

Selecionar Cliente
    [Arguments]                                 ${cliente}
    Press Special Key                           F10
    Input Text                                  campo de busca.png                   ${cliente}
    Press Special Key                           ENTER  
    Sleep                                       0.5
    Press Special Key                           ENTER                  

Selecionar equipamento
    Press Special Key                           F1
    Press Special Key                           F8

Adicionar produto(pr)/serviço(se)
    [Arguments]                                 ${referência}
    Sleep                                       1
    Input Text                                  referência.png                       ${referência}
    Press Special Key                           ENTER
    Click                                       produtivo.png
    Click                                       leandro.png
    Click                                       +.png
    Click                                       adicionar.png

Adicionar produto de terceiros
    [Arguments]                                 ${referência2}
    Click                                       terceiros.png
    Press Special Key                           F7
    Input Text                                  referência2.png                      ${referência2}
    Press Special Key                           ENTER
    Click                                       confirmar.png

Salvar OS
    Press Special Key                           F12
    Wait Until Screen Contain                   confirmação.png                     5
    Click                                       não.png
    Wait Until Screen Contain                   sucesso.png                         5
    Sleep                                       5

Modificando status da Os
    [Arguments]                                 ${status}
    Sleep                                       5
    Press Special Key                           ${status}

Concluir
    Sleep                                       0.5
    Click                                       F12.png
    Input Text                                  entrada.png                          10
    Click                                       F12-F.png
    Input Text                                  total.png                            500
    Press Special Key                           F12

Impressão
    [Arguments]                                 ${impressão}
    Click                                       ${impressão}.png
    Sleep                                       5

Verificar novo status
    [Arguments]                                 ${status}
    Click                                       ${status}.png
    Sleep                                       10

Cancelar
    [Arguments]                                 ${motivo}
    Wait Until Screen Contain                   motivo do cancelamento.png              5
    Input Text                                  motivo do cancelamento.png            ${motivo}
    Click                                       ok_cancelar.png
    Wait Until Screen Contain                   confirmação2.png                      5
    Press Special Key                           ENTER