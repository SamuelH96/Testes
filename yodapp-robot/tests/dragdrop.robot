*** Settings ***
Documentation       Automação do drag and drop

Resource           ../Resources/base.resource
Library            ../Resources/libs/extend.py

*** Test Cases ***
Deve arrastar o skywalker e soltar no topo da lista

    Start Session
    Get started
    Navigate to                    Star Wars
    Go to item                     Lista              Luke Skywalker

    ${origem}        Set Variable       //android.widget.TextView[@text="@skywalker"]/../../..//*[contains(@resource-id, "drag_handle")]
    ${destino}       Set Variable       //android.widget.TextView[@text="@mando"]/../../..//*[contains(@resource-id, "drag_handle")]

    My Drag And Drop         ${origem}       ${destino}  

    Close session