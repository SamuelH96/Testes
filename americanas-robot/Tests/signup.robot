*** Settings ***
Documentation       Suite de teste do cadastro em página web

Library             Browser

Resource            ..//Resources//base.resource

Test Setup           Iniciar Sessão
Test Teardown        Finalizar Sessão

*** Test Case ***
Deve poder cadastrar um novo cliente
    [Tags]              principal
    ${Americanas}               Create Dictionary
    ...         nome=Samuel Henrique Rocha Neves
    ...         datadenascimento=16/02/2000
    ...         CPF=000.000.000-00
    ...         telefone=77 99835-0867
    ...         email=naoseioquenaoseioquela@gmail.com
    ...         senha=12SdQ12

    Preencher as informações solicitadas            ${Americanas}               
    Submeter informações iniciais de cadastro

Não deve poder cadastrar um novo cliente se CPF foi inválido
    [Tags]                cpf_inv
    ${Americanas}               Create Dictionary
    ...         nome=Samuel Henrique Rocha Neves
    ...         datadenascimento=16/02/2000
    ...         CPF=132234234
    ...         telefone=77 99835-0867
    ...         email=andesondasilva@gmail.com
    ...         senha=12SdQ12

    Preencher as informações solicitadas            ${Americanas}               
    Submeter informações iniciais de cadastro
    Confirmação de informação inválida        
