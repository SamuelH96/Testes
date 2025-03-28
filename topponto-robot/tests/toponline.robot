*** Settings ***
Documentation                    Casos de testes recorrentes com internet

Resource                         ../Resources/base.resource
Resource                         ../Resources/register.resource

Test Setup                      Start Session
Test Teardown                   Run Keyword If    "no_teardown" not in "${TEST TAGS}"       Close Session


*** Test Cases ***
Deve registrar ponto dentro do horário
    [Tags]                                nohorario
    Get started                           045988853604              1234
    Sleep                                 2
    Clicar no botão de registrar  
    Verificar registro                 
    Sincronizar marcações                 
    Sleep                                 50s

Deve registrar ponto fora do horário 
    [Tags]                                foradohorario
    Get started                           045988853604              1234
    Sleep                                 2
    Clicar no botão de registrar
    Verificar registro
    Sincronizar marcações                 
    Sleep                                 45s

Inserir regra de justificativa
    [Tags]                                no_teardown
    Fluxo de justificativa                Teste 2
Deve registrar ponto fora do horário com justificativa
    [Tags]                               foradohorariojs
    Get started                          045988853604              1234
    Sleep                                2
    Clicar no botão de registrar                    
    Justificar e Registrar               Reunião escolar
    Verificar registro
    Sincronizar marcações                 

Deve registrar ponto retroativo
    [Tags]                                retroativo
    Get started                           045988853604              1234
    Sleep                                 2
    Acessar Ponto retroativo             
    Validar retroativo
    Inserir data                          21/03/2025
    Inserir Hora                          08                        02
    Inserir Justificativa e registrar     Esquecimento
    Verificar registro

Retirar regra de justificativa
    [Tags]                                no_teardown
    Fluxo de justificativa                Teste 2

