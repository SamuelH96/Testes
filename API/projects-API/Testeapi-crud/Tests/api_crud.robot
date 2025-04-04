*** Settings ***
Documentation           Crud Completo na Api

Resource                ../Resource/base.resource

*** Test Cases ***
Cadastrar um novo usuário - POST
    [Tags]          POST

    Criar novo usuário
    Cadastrar o usuário na API          email=${email}    status_code=201
    Conferir Cadastro

    Delete All Sessions

Cadastrar usuário que já existente
    [Tags]         EXI
    Criar novo usuário
    Cadastrar o usuário na API          email=${email}    status_code=201
    Conferir Cadastro
    Verificar se pode repetir Cadastro
    Verificar se a API não permitiu o cadastro repetido

    Delete All Sessions

Verificar existência do usuário cadastrado - GET
    [Tags]          GET

    Criar novo usuário
    Cadastrar o usuário na API           email=${email}    status_code=201
    Conferir Cadastro
    Confirmar existência dos dados
    Conferir dados retornados

    Delete All Sessions

Atualizar dados - PUT
    [Tags]          PUT

    Criar novo usuário
    Cadastrar o usuário na API           email=${email}    status_code=201
    Conferir Cadastro
    Atualizar dados já existentes
    Conferir alteração

    Delete All Sessions

Excluir usuário cadastrado - DELETE
    [Tags]          DELETE

    Criar novo usuário
    Cadastrar o usuário na API           email=${email}    status_code=201
    Conferir Cadastro
    Excluir usuário existente
    Conferir exclusão

    Delete All Sessions

Realizar login
    [Tags]          LOGIN

    Realizar login do usuário
    Conferir se o Login ocorreu com sucesso

    Delete All Sessions