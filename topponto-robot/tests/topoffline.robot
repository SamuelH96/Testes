*** Settings ***
Documentation                    Casos de testes recorrentes sem internet

Resource                         ../Resources/base.resource
Resource                         ../Resources/register.resource

Suite Setup                 Start Session

*** Test Cases ***
Deve registrar ponto dentro do horário
    [Tags]                                nohorario
    Ativar Internet
    Sleep                                 5s
    Get started                           51823473303    123
    Sleep                                 5s
    Desativar Internet
    Sleep                                 2
    Clicar no botão de registrar  
    Verificar registro                 
    Sincronizar marcações                 
    Sleep                                 50s

Deve registrar ponto fora do horário 
    [Tags]                                foradohorario
    Sleep                                 2
    Clicar no botão de registrar
    Verificar registro
    Sincronizar marcações                 
    Sleep                                 50s

Inserir regra de justificativa
    Sleep                                 5s
    Fluxo de justificativa                Teste 1
Deve registrar ponto fora do horário com justificativa
    [Tags]                               foradohorariojs
    Sleep                                2
    Close Session
    Ativar Internet
    Sleep                                2s
    Get started                          51823473303              123
    Sleep                                8s    
    Desativar Internet               
    Clicar no botão de registrar                    
    Justificar e Registrar               Reunião escolar
    Verificar registro
    Sincronizar marcações

Deve registrar ponto retroativo
    [Tags]                                retroativo
    Sleep                                 2
    Acessar Ponto retroativo             
    Validar retroativo
    Inserir data                          21/03/2025
    Inserir Hora                          08                       20
    Inserir Justificativa e registrar     Esquecimento
    Verificar registro     
    Close Session      

Retirar regra de justificativa
    [Tags]                       b
    Sleep                                 5s
    Fluxo de justificativa                Teste 1
    Sleep                                 5s
