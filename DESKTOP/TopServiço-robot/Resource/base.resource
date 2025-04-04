*** Settings ***
Documentation                                Documento base do projeto que inicia e finaliza o sistema

Library                                      SikuliLibrary
Resource                                     actions/login.resource
Resource                                     actions/ordem_de_serviço.robot


*** Keywords ***
Contabilizar Elements
    Add Image Path                      C:\\QA\\projects\\Desktop\\TopServiço-robot\\Resource\\elements 

Iniciar Sessão
    Contabilizar Elements
    Click                               iniciar.png   
    Click                               top.png
    Sleep                               5

Encerrar Sessão 
    Stop Remote Server

Finalizar teste
    Capture Screen
    Close Application                   Top Business     