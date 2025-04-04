*** Settings ***
Documentation                   Ação e elementos das funcionalidades de cadastro

Library                         Browser

*** Keywords ***
Preencher as informações solicitadas
    [Arguments]             ${Americanas} 

    Fill Text                               css=input[name="name"]            ${Americanas}[nome]
    Click                                   css=label[data-cy="labelFor__M"]
    Fill Text                               css=input[name="birthDate"]       ${Americanas}[datadenascimento]
    Fill Text                               css=input[name="cpf"]             ${Americanas}[CPF]
    Fill Text                               css=input[name="phone"]           ${Americanas}[telefone]
    Fill Text                               css=input[name="email"]           ${Americanas}[email]
    Fill Text                               css=input[name="password"]        ${Americanas}[senha]
    Browser.Wait For Elements State         css=span[class="sc-SBXiz iYtHZL"]       visible                  5

Submeter informações iniciais de cadastro
    Click                                   css=button[type="submit"]

Confirmação de informação inválida
    Browser.Wait For Elements State         css=span[class="sc-zGZpD duuBtA"]       visible                  15
