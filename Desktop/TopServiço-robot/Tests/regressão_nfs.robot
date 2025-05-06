*** Settings ***
Documentation                            Documento principal da regressão dos 
...                                      Testes Recorrentes de Gerar Documento

Resource                                 ../Resource/base.resource

Suite Setup                               Iniciar Sessão
Suite Teardown                            Encerrar Sessão


*** Test Cases ***
Gerar nova NF-E
    Entrar com usuário Top                   usuario=top                 senha=J3.16-top
    Menu de serviço                          documentos_fiscais          gerar_documento    
    Pesquisar OS                             
    Escolher NF-e/NFC-e                      F10
    Aguardar mensagem de Erro
    Verificar situação
