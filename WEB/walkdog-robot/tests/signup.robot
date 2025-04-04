*** Settings ***
Documentation        Suite de teste de cadastro Dog walker

Resource             ../resources/base.resource

Test Setup        Start session
Test Teardown     Finish session
*** Test Cases ***
Deve poder cadastrar um novo dogwalker
    [Tags]                  smoke
    ${dog_walker}           Create Dictionary    
    ...    name=Fernando papito    
    ...    email=papito@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    num=1000
    ...    compl=apto 28
    ...    addressStreet=Rua Joaquim Floriano
    ...    addressDistrict=Itaim Bibi
    ...    addressCityUf=São Paulo/SP
    ...    foto=imagem.jpg 

    Go to signup page
    Fill signup form      ${dog_walker}    
    Submit signup form
    Popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.


Não deve poder cadastrar um novo dogwalker
    [Tags]                  cpf_inv
    
    ${dog_walker}           Create Dictionary    
    ...    name=Fernando papito    
    ...    email=papito@gmail.com
    ...    cpf=00000014141aa
    ...    cep=04534011
    ...    num=1000
    ...    compl=apto 28
    ...    addressStreet=Rua Joaquim Floriano
    ...    addressDistrict=Itaim Bibi
    ...    addressCityUf=São Paulo/SP
    ...    foto=imagem.jpg 


    Go to signup page
    Fill signup form      ${dog_walker}    
    Submit signup form
    Wait For Elements State    css=.alert-error >> text=CPF inválido        visible        2

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]                  required
    
    ${dog_walker}           Create Dictionary    
    ...    name=Fernando papito    
    ...    email=papito@gmail.com
    ...    cpf=00000014141aa
    ...    cep=04534011
    ...    num=1000
    ...    compl=apto 28
    ...    addressStreet=Rua Joaquim Floriano
    ...    addressDistrict=Itaim Bibi
    ...    addressCityUf=São Paulo/SP
    ...    foto=imagem.jpg 

 
    Go to signup page
    #Fill signup form      ${dog_walker}    
    Submit signup form

    Alert should be       Informe o seu nome completo
    Alert should be       Informe o seu melhor email
    Alert should be       Informe o seu CEP

Deve poder cadastrar um novo dogwalker que sabe cuidar de pets
    [Tags]                  cuidar

    ${dog_walker}           Create Dictionary    
    ...    name=Fernando papito    
    ...    email=papito@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    num=1000
    ...    compl=apto 28
    ...    addressStreet=Rua Joaquim Floriano
    ...    addressDistrict=Itaim Bibi
    ...    addressCityUf=São Paulo/SP
    ...    foto=imagem.jpg 

    Go to signup page
    Fill signup form      ${dog_walker}    
    Additional Services    Cuidar
    Submit signup form
    Popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dogwalker que sabe adestrar de pets
    [Tags]                  adestrar

    ${dog_walker}           Create Dictionary    
    ...    name=Fernando papito    
    ...    email=papito@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    num=1000
    ...    compl=apto 28
    ...    addressStreet=Rua Joaquim Floriano
    ...    addressDistrict=Itaim Bibi
    ...    addressCityUf=São Paulo/SP
    ...    foto=imagem.jpg 

    Go to signup page
    Fill signup form      ${dog_walker}    
    Additional Services    Adestrar
    Submit signup form
    Popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.
