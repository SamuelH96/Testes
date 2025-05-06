*** Settings ***
Documentation                                   Keywords referentes ao teste de Cadastros


Library                                         SikuliLibrary
Library                                         Dialogs

Resource                                        login.resource

*** Variables ***
${CAMPO_PESQUISA}                         ../elements/nºOS.png

*** Keywords ***
Pesquisar OS
    ${os}=    Get Value From User          Digite o número da OS: 
    Input Text                             ${CAMPO_PESQUISA}                  ${os}
    Press Special Key                      ENTER

Escolher NF-e/NFC-e
    [Arguments]                            ${Key}                                   
    Press Special key                      F5
    Sleep                                  0.2
    Press Special Key                      ${key}

Aguardar mensagem de Erro
    Wait until Screen Contain              mensagem_erro.png                    5
    Capture Screen
    Click                                  fechar.png

Verificar situação
    Capture Screen
    