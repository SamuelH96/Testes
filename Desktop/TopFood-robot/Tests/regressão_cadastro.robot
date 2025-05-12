*** Settings ***
Documentation                                    Documento referente aos casos de Teste do CRUD 
...                                              de cadastro de parceiro

Resource                                         ../Resource/base.resource

Suite Setup                                      Iniciar Sessão
Suite Teardown                                   Encerrar Sessão
                                 


*** Test Cases ***
Deve criar um novo parceiro
    Entrar com usuário Top                       usuario=balanca              senha=123          
    Encontrar cadastro de parceiro
    Inserir dados                                Leno Brega
    Salvar endereço
    Salvar parceiro
    Validar parceiro salvo                       Leno Brega   

Deve editar parceiro salvo
    Editar                                       Chapolim colorado
    Validar parceiro salvo                       Chapolim colorado

Deve deletar parceiro
    Remover 

    
