*** Settings ***
Documentation                   Arquivo principal

Library                         Browser

Resource                        env.resource 
Resource                        actions/signup.resource

*** Keywords ***
Iniciar Sessão    
    New Browser                         browser=${BROWSER}                headless=False  
    Set Browser Timeout                 50 sec
    New Page                            https://cliente.americanas.com.br/minha-conta/cadastro?next=https://www.americanas.com.br/
    Browser.Wait For Elements State        css=h2[class="sc-jiazSf iPxXVO"]                 visible                  15

Finalizar Sessão
    Take Screenshot                     fullPage=True