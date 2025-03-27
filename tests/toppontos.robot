*** Settings ***
Documentation                    Casos de testes recorrentes

Resource                         ../Resources/base.resource
Resource                         ../Resources/register.resource


*** Test Cases ***
Deve registrar ponto dentro do horário
    [Tags]                                nohorario
    Start Session
    Get started                           045988853604              1234
    Sleep                                 2
    Clicar no botão de registrar  
    Verificar registro                 
    Sincronizar marcações                 
    Close Session
    Sleep                                 50s

Deve registrar ponto fora do horário 
    [Tags]                                foradohorario
    Start Session
    Get started                           045988853604              1234
    Sleep                                 2
    Clicar no botão de registrar
    Verificar registro
    Sincronizar marcações                 
    Close Session
    Sleep                                 45s

Inserir regra de justificativa
    Fluxo de justificativa
Deve registrar ponto fora do horário com justificativa
    [Tags]                                foradohorariojs
    Start Session
    Get started                           045988853604              1234
    Sleep                                 2
    Clicar no botão de registrar                    
    Justificar e Registrar                Reunião escolar
    Verificar registro
    Sincronizar marcações                 
    Close Session

Deve registrar ponto retroativo
    [Tags]                                retroativo
    Start Session
    Get started                           045988853604              1234
    Sleep                                 2
    Acessar Ponto retroativo             
    Validar retroativo
    Inserir data                          21/03/2025
    Inserir Hora                          08                        02
    Inserir Justificativa e registrar     Esquecimento
    Verificar registro           
    Close Session

