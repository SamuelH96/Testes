*** Settings ***
Documentation                                Documento base do projeto que inicia e finaliza o sistema

Library                                      SikuliLibrary
Resource                                     actions/login.resource
Resource                                     actions/keywords_cadastro.resource
Resource                                     actions/keywords_entrega.robot
Resource                                     actions/keywords_pedido.resource
Resource                                     actions/keywords_reservar.resource

*** Keywords ***
Contabilizar Elements
    Add Image Path                      C:\\QA\\projects\\Desktop\\TopFood-robot\\Resource\\elements 

Iniciar Sessão
    Contabilizar Elements
    Set Min Similarity                  0.60
    SikuliLibrary.Click                 iniciar.png   
    SikuliLibrary.Click                 top.png
    Sleep                               5

Encerrar Sessão 
    SikuliLibrary.Stop Remote Server

Finalizar teste
    Capture Screen
    SikuliLibrary.Close Application     Top Business   