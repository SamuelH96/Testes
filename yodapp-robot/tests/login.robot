*** Settings ***
Documentation       Automação de login

Resource           ../Resources/base.resource


*** Test Cases ***
Deve logar com sucesso

    Start Session
    Get started
    Navigate to                    Formulários
    Go to item                     Login              Olá Padawan, vamos testar o login?

    Input Text                     id=com.qaxperience.yodapp:id/etEmail             yoda@qax.com
    Input Text                     id=com.qaxperience.yodapp:id/etPassword          jedi
    Click Element                  id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Page Contains       Boas vindas, logado você está.                   10

    Close session

Não deve logar com senha incorreta

    Start Session
    Get started
    Navigate to                    Formulários
    Go to item                     Login              Olá Padawan, vamos testar o login?

    Input Text                     id=com.qaxperience.yodapp:id/etEmail             yoda@qax.com
    Input Text                     id=com.qaxperience.yodapp:id/etPassword          pão
    Click Element                  id=com.qaxperience.yodapp:id/btnSubmit
    
    Wait Until Page Contains      Oops! Credenciais incorretas.                 10

    Close session