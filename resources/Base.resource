*** Settings ***
Documentation    Scripts bases do projeto

Library    SeleniumLibrary

Resource    Variaveis.resource

*** Keywords ***
#Validar o titulo do site 
Abrir o navegador do projeto    
    SeleniumLibrary.Open Browser    https://parodify.vercel.app/        browser=chrome    options=add_argument("--ignore-certificate-errors")     #browser=headlesschrome    
Fechar o navegador 
    Capture Page Screenshot   
    Close All Browsers

Play music
    Click Button    xpath=//div[contains(@class, "song")]//h6[text()="${Validar}"]/..//button[contains(@class,"play")]

Pause music
    Click Button   xpath=//div[contains(@class, "song")]//h6[text()="${Validar}"]/..//button[contains(@class,"pause")]

Elemento play visivel
    Wait Until Element Is Visible    xpath=//div[contains(@class, "song")]//h6[text()="${Validar}"]/..//button[contains(@class,"play")]    10

Elemento pause visivel
    Wait Until Element Is Visible   xpath=//div[contains(@class, "song")]//h6[text()="${Validar}"]/..//button[contains(@class,"pause")]    10



