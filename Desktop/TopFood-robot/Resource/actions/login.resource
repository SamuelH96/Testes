*** Settings ***
Documentation                              Documentação referente ao login do Top Business Java

Library                                    SikuliLibrary

*** Keywords ***
Entrar com usuário Top
    [Arguments]                       ${usuario}              ${senha}
    Wait Until Screen Contain         senha.png               15
    Input Text                        senha.png               ${senha}
    Wait Until Screen Contain         usuario.png             5
    Double Click                      usuario.png
    Press Special Key                 DELETE
    Input Text                        usuario.png             ${usuario}
    Sleep                             1
    SikuliLibrary.Click               entrar.png
    Sleep                             5
    Verificar tela food
    
Verificar tela food
     ${tela_visivel}=    
    ...    Run Keyword And Return Status
    ...    Wait Until Screen Contain           tela_food.png           5
            
                
    
    Run Keyword If     ${tela_visivel}
    ...    Clicar
    ...    ELSE
    ...    Log                                 Tela de informação não encontrada - Prosseguindo

Clicar
    SikuliLibrary.Click                           x.png                                       
    Log                                           Clicou no botão ok e prosseguiu com o teste.


Menu
   [Arguments]                                    ${categoria1}                      
    SikuliLibrary.Click                           menu.png
    SikuliLibrary.Click                           ${categoria1} 

Viajar pelo Menu
    [Arguments]                   ${categoria1}                ${categoria2}=${None}         
    Sleep                                        0.5
    SikuliLibrary.Click                          ${categoria1}.png
    Run Keyword If    $categoria2 is not None    SikuliLibrary.Click    ${categoria2}.png