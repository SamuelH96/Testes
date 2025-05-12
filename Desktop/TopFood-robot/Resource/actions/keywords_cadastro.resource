*** Settings ***
Documentation                                    Documento referente as keywords correspondetes a cadastro de Parceiros

Library                                          SikuliLibrary
Library                                          Browser                    timeout=80s
Resource                                         login.resource


*** Keywords ***
Encontrar cadastro de parceiro
    Menu                                          Food            
    Viajar pelo Menu                              cadastro                   parceiros 
    SikuliLibrary.Click                           novo_parceiro.png

Inserir dados
    [Arguments]                                   ${nome} 
    Input Text                                    nome.png
    ...                                           ${nome}   
    Inserir CPF
    Inserir CEP

Gerar CPF
    New Browser                          chromium                               headless=False
    New Page                             https://www.4devs.com.br/gerador_de_cpf

    Browser.Click                        xpath=//*[@id="bt_gerar_cpf"]
    Browser.Click                        xpath=//*[@id="texto_cpf"]/span
    Close Page

Inserir CPF
    Gerar CPF
    Set Min Similarity                   0.95
    Double Click                         cpf.png
    Right Click                          cpf_clicavel.png               
    Press Special Key                    DOWN
    Press Special Key                    DOWN
    Press Special Key                    DOWN
    Press Special Key                    DOWN
    Press Special Key                    DOWN
    Press Special Key                    ENTER

Gerar CEP
    New Browser                          chromium                               headless=False
    New Page                             https://www.4devs.com.br/gerador_de_cep

    Browser.Click                        xpath=//*[@id="btn_gerar_cep"]
    Browser.Click                        xpath=//*[@id="cep"]/span[2]
    Close Page

Inserir CEP
    Gerar CEP
    Set min Similarity                   0.95
    SikuliLibrary.Click                  Endereços.png
    SikuliLibrary.Click                  adicionar.png
    Double Click                         cep.png
    Right Click                          cep_clicavel.png               
    Press Special Key                    DOWN
    Press Special Key                    DOWN
    Press Special Key                    DOWN
    Press Special Key                    DOWN
    Press Special Key                    DOWN
    Press Special Key                    ENTER
    SikuliLibrary.Click                  pesquisar_cep.png
    Press Special Key                    ENTER
    Sleep                                3
    Capture Screen                    

Salvar endereço
    Press Special Key                    F12
    Capture Screen                  

Salvar parceiro
    SikuliLibrary.Click                  salvar.png

Validar parceiro salvo
    [Arguments]                          ${nome}
    Wait Until Screen Contain            parceiro_salvo.png
    ...                                  5
    SikuliLibrary.Click                  pesquisar_parceiro.png
    Set Min Similarity                   0.50
    Input Text                           pesquisar_parceiro.png
    ...                                  ${nome}
    Press Special Key                    ENTER
    SikuliLibrary.Click                  x_parceiro.png
Editar
    [Arguments]                                   ${nome} 
    Set Min Similarity                   0.45
    SikuliLibrary.Click                  nome_parceiro
    Set Min Similarity                   0.90
    SikuliLibrary.Click                  editar.png
    Set Min Similarity                   0.35
    Double Click                         nome.png
    Press Special Key                    DELETE
    Sleep                                0.5
    Double Click                         nome.png
    Press Special Key                    DELETE
    Input Text                           nome.png
    ...                                  ${nome}
    Salvar parceiro

Remover 
    Set Min Similarity                   0.45
    SikuliLibrary.Click                  nome_parceiro
    Set Min Similarity                   0.90
    SikuliLibrary.Click                  excluir.png
    Press Special Key                    ENTER
    Sleep                                2
    Capture Screen          




    

