*** Settings ***
Documentation      Primeira automação de teste mobile

Library             AppiumLibrary



*** Test Cases ***
Deve abrir a tela principal

    Open Application               http://localhost:4723
    ...                             platformName=Android
    ...                             deviceName=Android Emulator
    ...                             automationName=UiAutomator2
    ...                             app=${EXECDIR}/app/yodapp-beta.apk
    ...                             udid=emulator-5554
    ...                             ignoreHiddenApiPolicyError=true
    ...                             autoGrantPermissions=true


    Close Application