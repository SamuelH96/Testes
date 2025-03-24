*** Settings ***
Documentation                   Base do crud completo da API

Library                         RequestsLibrary
Library                         String
Library                         Collections

*** Keywords ***
Criar novo usuário
    ${aleatória}        Generate Random String     length=8         chars=[LETTERS]
    ${aleatória}        Convert To Lower Case      ${aleatória} 
    Set Global Variable   ${email}     ${aleatória}@emailteste.com
    Log                   ${email}

Cadastrar o usuário na API
    [Arguments]         ${email}       ${status_code} 

    ${body}     Create Dictionary
    ...         nome=Ciclano da Silva
    ...         email=${email}
    ...         password=123456
    ...         administrador=true

    Log         ${body}

    Criar sessão na API

    ${dados}     POST On Session
    ...          alias=ServeRest
    ...          url=/usuarios
    ...          json=${body}
    ...          expected_status=${status_code}

    Log                    ${dados.json()}

    IF                      ${dados.status_code} == 201
    Set Global Variable     ${id_usuario}     ${dados.json()["_id"]}
    END

    Set Test Variable       ${resposta}       ${dados.json()} 
    
Criar sessão na API
    ${headers}      Create Dictionary
    ...             accept=application/json
    ...             Content-Type=application/json

    Create Session      alias=ServeRest    url=https://serverest.dev    headers=${headers}

Conferir Cadastro
    Log     ${resposta}
    Dictionary Should Contain Item      ${resposta}     message     Cadastro realizado com sucesso
    Dictionary Should Contain Key       ${resposta}     _id
      
Verificar se pode repetir Cadastro
    Cadastrar o usuário na API          email=${email}    status_code=400  

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${resposta}    message    Este email já está sendo usado

Confirmar existência dos dados
    ${dados_retorno}    GET On Session
    ...                 alias=ServeRest
    ...                 url=/usuarios/${id_usuario}
    ...                 expected_status=200

    Set Test Variable       ${Resposta}      ${dados_retorno.json()}

Conferir dados retornados
    Log                                     ${Resposta}
    Dictionary Should Contain Item          ${Resposta}        nome                 Ciclano da Silva
    Dictionary Should Contain Item          ${Resposta}        email                ${email}
    Dictionary Should Contain Item          ${Resposta}        password             123456
    Dictionary Should Contain Item          ${Resposta}        administrador        true
    Dictionary Should Contain Item          ${Resposta}        _id                  ${id_usuario}

Atualizar dados já existentes
    ${body}     Create Dictionary
    ...         nome=Beltrado da Silva
    ...         email=${email}
    ...         password=1234
    ...         administrador=true

    Log         ${body}

    ${dados_at}    PUT On Session
    ...             alias=ServeRest
    ...             url=/usuarios/${id_usuario}
    ...             json=${body}


    Set Test Variable     ${RESPOSTA}         ${dados_at.json()}

Conferir alteração
    Log     ${RESPOSTA}
    Dictionary Should Contain Item          ${RESPOSTA}     message     Registro alterado com sucesso

Excluir usuário existente
    ${dados_de}         DELETE On Session
    ...                 alias=ServeRest
    ...                 url=/usuarios/${id_usuario}
    ...                 expected_status=200

    Set Test Variable   ${reSPOSTa}     ${dados_de.json()}

Conferir exclusão
    Log                 ${reSPOSTa}
    Dictionary Should Contain Item          ${reSPOSTa}     message    Registro excluído com sucesso

Realizar login do usuário
    ${body}     Create Dictionary
    ...         email=fulano@qa.com
    ...         password=teste

    Criar sessão na API

    ${dados_log}    POST On Session
    ...             alias=ServeRest
    ...             url=/login
    ...             json=${body}
    ...             expected_status=any

    Set Test Variable    ${RESPOSTA1}    ${dados_log.json()}

Conferir se o Login ocorreu com sucesso
    Log  ${RESPOSTA1}
    Dictionary Should Contain Item  ${RESPOSTA1}  message  Login realizado com sucesso
    Dictionary Should Contain Key   ${RESPOSTA1}  authorization         