*** Settings ***
Documentation                              Documentação referente ao logina do Top Business Java

Library                                    SikuliLibrary

*** Keywords ***
Entrar com usuário Top
    [Arguments]                       ${usuario}              ${senha}
    Wait Until Screen Contain         senha.png               5
    Input Text                        senha.png               ${senha}
    Wait Until Screen Contain         usuario.png             5
    Double Click                      usuario.png
    Press Special Key                 DELETE
    Input Text                        usuario.png             ${usuario}
    Sleep                             1
    Click                             entrar.png
    Sleep                          3
    Verificar barra status
    
Verificar barra status
     ${tela_status_visivel}=    
    ...    Run Keyword And Return Status
    ...    Wait Until Screen Contain           informação.png           5
            
                
    
    Run Keyword If    ${tela_status_visivel}
    ...    Clicar no status desejado
    ...    ELSE
    ...    Log                                 Tela de informação não encontrada - Prosseguindo

Clicar no status desejado
    Click                          ok.png
    Click                          voltar.png                                                                        1s   
    Log                            Clicou no botão ok e prosseguiu com o teste.


Menu de serviço
   [Arguments]                     ${categoria1}                 ${categoria2}   
    Click                          menu.png
    Click                          barra de rolagem
    Wheel Down                     100                           barra de rolagem
    Click                          serviço.png   
    Click                          ${categoria1}.png
    Click                          ${categoria2}.png

Viajar pelo Menu de Serviço
    [Arguments]                   ${categoria1}             
    Click                         menu.png
    Sleep                         0.5
    Click                         ${categoria1}.png

    