*** Settings ***
Documentation       Automação de botões de checkbox e radio

Resource           ../Resources/base.resource


*** Test Cases ***
Deve marcar todas que usam Appium

    Start Session
    Get started
    Navigate to                    Check e Radio
    Go to item                     Checkbox            Marque as techs que usam Appium

    @{techs}       Create List
    ...            Ruby
    ...            Python
    ...            Java
    ...            Javascript
    ...            C#
    ...            Robot Framework
    
    FOR  ${tech}   IN     @{techs}     
        Click Element                      xpath=//android.widget.CheckBox[contains(@text, "${tech}")]
    END

    Close session


Deve selecionar a linguagem preferida
    [Tags]      Radio

    Start Session
    Get started
    Navigate to                    Check e Radio
    Go to item                     Botões de radio           Escolha sua linguagem preferida
     
    Click Element                  xpath=//android.widget.RadioButton[contains(@text, "Python")]


    Close session

