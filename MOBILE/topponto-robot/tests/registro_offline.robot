*** Settings ***
Documentation                    Casos de testes recorrentes sem internet

Resource                         ../Resources/base.resource
Resource                         ../Resources/keywords.resource

Suite Setup                 Start Session                           4723                5A4576H9L        

*** Test Cases ***
Deve registrar ponto dentro do horário
    [Tags]                                nohorario
    Ativar Internet                       5A4576H9L
    Sleep                                 3s
    Get started                           51823473303    123
    Sleep                                 20s
    Desativar Internet                    5A4576H9L
    Sleep                                 2
    Clicar no botão de registrar  
    Verificar registro                 
    Sincronizar marcações                 
    Sleep                                 50

Deve registrar ponto fora do horário 
    [Tags]                                foradohorario
    Sleep                                 2
    Clicar no botão de registrar
    Verificar registro
    Sincronizar marcações                 
    Sleep                                 50

Inserir regra de justificativa
    Fluxo de justificativa                Teste 1
Deve registrar ponto fora do horário com justificativa
    [Tags]                               foradohorariojs
    Sleep                                2
    Close Session
    Ativar Internet                      5A4576H9L  
    Sleep                                2s
    Get started                          51823473303              123
    Sleep                                8s    
    Desativar Internet                   5A4576H9L
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
    Fluxo de justificativa                Teste 1