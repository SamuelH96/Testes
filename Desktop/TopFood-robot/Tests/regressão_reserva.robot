*** Settings ***
Documentation                                    Documento referente aos casos de Teste de Reservar mesa/comanda

Resource                                         ../Resource/base.resource

Suite Setup                                      Iniciar Sessão
Suite Teardown                                   Encerrar Sessão
                                 


*** Test Cases ***
Deve reservar uma mesa com data válida
    Entrar com usuário Top                       usuario=teste             senha=123  
    Menu                                         Food                          
    Viajar pelo Menu                             mesas_comandas                            
    Reservar mesa/comanda
    Selecionar Mesa/Comanda                      078
    Selecionar Cliente - Reserva                 venda ao consumidor
    Selecionar data                              20/08/2025
    Validar Mesa/Comanda reservada               078

Deve reservar uma mesa com data inválida      
    Reservar mesa/comanda
    Selecionar Mesa/Comanda                      024
    Selecionar Cliente - Reserva                 venda ao consumidor
    Selecionar data                              20/08/1500
    Validar Mesa/Comanda reservada               024

    

