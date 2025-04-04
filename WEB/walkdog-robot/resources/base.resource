*** Settings ***
Documentation             Arquivo principal do projeto

Library                   Browser

Resource                  actions/signup.resource
Resource                  env.resource

*** Keywords ***
Start session
    New Browser             ${BROWSER}           headless=False
    New Page                                    https://walkdog.vercel.app
    

Finish session
    Take Screenshot    fullPage=True