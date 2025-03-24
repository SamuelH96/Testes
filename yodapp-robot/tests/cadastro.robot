*** Settings ***
Documentation       Automação de cadastro

Resource           ../Resources/base.resource


*** Keywords ***
Select level
    [Arguments]         ${level}
    
    Click Element                       id=com.qaxperience.yodapp:id/spinnerJob
    Wait Until Element Is Visible       class=android.widget.ListView
    Click Text                          ${level}


*** Test Cases ***
Deve cadastrar uma conta e selecionar o nível Jedi

    Start Session
    Get started
    Navigate to                         Formulários
    Go to item                          Cadastro             Crie sua conta

    Input Text                          id=com.qaxperience.yodapp:id/etUsername          Samuel
    Input Text                          id=com.qaxperience.yodapp:id/etEmail             samuel@qax.com
    Input Text                          id=com.qaxperience.yodapp:id/etPassword          123456

    Select level                        Jedi

    Close session

Deve cadastrar uma conta e selecionar o nível Padawan

    Start Session
    Get started
    Navigate to                         Formulários
    Go to item                          Cadastro             Crie sua conta

    Input Text                          id=com.qaxperience.yodapp:id/etUsername          Rubem
    Input Text                          id=com.qaxperience.yodapp:id/etEmail             rubem@gmail.com
    Input Text                          id=com.qaxperience.yodapp:id/etPassword          23d12

    Select level                        Padawan

    Close session

Deve cadastrar uma conta e selecionar o nível Sith

    Start Session
    Get started
    Navigate to                         Formulários
    Go to item                          Cadastro             Crie sua conta

    Input Text                          id=com.qaxperience.yodapp:id/etUsername          josiane
    Input Text                          id=com.qaxperience.yodapp:id/etEmail             josiane@hotmail.com
    Input Text                          id=com.qaxperience.yodapp:id/etPassword          14677*8

    Select level                        Sith

    Close session

Deve cadastrar uma conta e selecionar o nível Outros

    Start Session
    Get started
    Navigate to                         Formulários
    Go to item                          Cadastro             Crie sua conta

    Input Text                          id=com.qaxperience.yodapp:id/etUsername          Emily
    Input Text                          id=com.qaxperience.yodapp:id/etEmail             emilygabriela22@gmail.com
    Input Text                          id=com.qaxperience.yodapp:id/etPassword          123321

    Select level                        Outros

    Close session
