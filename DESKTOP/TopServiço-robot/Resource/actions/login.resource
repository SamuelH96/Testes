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
    Wait Until Screen Contain      informação.png           5
    Click                          ok.png
    Click                          voltar.png
Menu de serviço
    Click                          menu.png
    Click                          barra de rolagem
    Wheel Down                     100              barra de rolagem
    Click                          serviço.png

Categorias de serviço
    [Arguments]                    ${categoria1}                 ${categoria2}               ${validação}
    Click                          ${categoria1}.png
    Click                          ${categoria2}.png
    Wait Until Screen Contain      ${validação}.png              5