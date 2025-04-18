*** Settings ***
Documentation       Automação do swipe

Resource           ../Resources/base.resource

*** Test Cases ***
Deve poder remover o Darth Vader

    Start Session
    Get started
    Navigate to                    Star Wars
    Go to item                     Lista              Darth Vader

  ${positions}    Get Element Location        xpath=//android.widget.TextView[@text="@darthvader"]/../../..//*[contains(@resource-id, "indicator")]

    ${start_x}      Set Variable      ${positions}[x]
    ${start_y}      Set Variable      ${positions}[y]  
    ${offset_x}     Evaluate          ${positions}[x] - 1200
    ${offset_y}     Set Variable      ${positions}[y] 

    Swipe         ${start_x}        ${start_y}          ${offset_x}        ${offset_y}

    Click Element       id=com.qaxperience.yodapp:id/btnRemove

    Wait Until Page Does Not Contain     Darth Vader           10

    Close session