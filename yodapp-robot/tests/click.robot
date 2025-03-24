*** Settings ***
Documentation       Automação de cliques

Resource           ../Resources/base.resource


*** Test Cases ***
Deve realizar um clique simples

    Start Session
    Get started
    Navigate to                    Clique em Botões
    Go to item                     Clique simples            Botão clique simples
    
    Click Text                      CLIQUE SIMPLES
    Wait Until Page Contains        Isso é um clique simples

    Close session

Deve realizar um clique longo
    [Tags]         longo

    Start Session
    Get started
    Navigate to                    Clique em Botões
    Go to item                     Clique longo              Botão clique longo

    ${locator}          Set Variable                         id=com.qaxperience.yodapp:id/long_click
    ${positions}        Get Element Location                 ${locator} 
 
    Tap With Positions              3000                     ${${positions}[x],${positions}[y]}

    Close session
