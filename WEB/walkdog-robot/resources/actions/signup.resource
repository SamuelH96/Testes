*** Settings ***
Documentation            Ações, steps e elementos das funcionalidades de cadastro

Library                  Browser


*** Keywords ***
Go to signup page

    Click                            css=a[href="/signup"]

    Wait For Elements State          form h1        visible      5000
    Get Text                         form h1        equal       Faça seu cadastro

Fill signup form
    [Arguments]     ${dog_walker}
    Fill Text                        css=input[placeholder="Nome completo"]        ${dog_walker}[name]
    Fill Text                        css=input[name="email"]                       ${dog_walker}[email]
    Fill text                        css=input[name="cpf"]                         ${dog_walker}[cpf]
    Fill Text                        css=input[name="cep"]                         ${dog_walker}[cep]

    Click                            css=input[value="Buscar CEP"][type=button]

    Get Property                     css=input[name="addressStreet"]               value         equal       ${dog_walker}[addressStreet]
    Get Property                     css=input[name="addressDistrict"]             value         equal       ${dog_walker}[addressDistrict]
    Get Property                     css=input[name="addressCityUf"]               value         equal       ${dog_walker}[addressCityUf]

    Fill Text                        css= input[name="addressNumber"]              ${dog_walker}[num]
    Fill Text                        css=input[placeholder="Complemento"]          ${dog_walker}[compl]

   
    
    Upload File By Selector          css=input[accept="image/*"]                  ${EXECDIR}/resources/fixtures//${dog_walker}[foto] 

Additional Services
    [Arguments]                ${additional_service}
     Click                            xpath=//span[text()="${additional_service}"]/..
    Take Screenshot                  selector=//span[text()="${additional_service}"]/..

Submit signup form
    Click                            css=button[type="submit"]    

Popup should be
    [Arguments]                      ${expected_text}
    Wait For Elements State          css=.swal2-html-container                     visible             5000
    Get Text                         css=.swal2-html-container                     equal               ${expected_text}

Alert should be
    [Arguments]        ${expected_text}

        Wait For Elements State    css=.alert-error >> text=${expected_text}      visible        2