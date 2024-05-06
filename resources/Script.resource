*** Settings ***
Documentation    Os scripts dos cenarios de testes

Resource    Base.resource
Library    Browser
Library    String

*** Keywords ***
#Validar o titulo do site
Given que abro o navegador
    No Operation

When acesso o site
    Capture Page Screenshot

Then no tituto da pagina é apresentado
    [Arguments]    ${argumento}

    Title Should Be    ${argumento}
    Capture Element Screenshot    xpath=//*[@id="root"]/div[1]/aside/a[1]/img

#Tocar musica ao clicar no botão play
Given que acesso o site
    No Operation

When clico no botão play
    Elemento play visivel
    Play music
    Capture Page Screenshot

Then a musica é iniciada 
    Elemento pause visivel
    Sleep    2

#Pausar musica ao clicar no botão pause
And a musica esteja tocando
    Elemento play visivel
    Play music
    Elemento pause visivel
    Capture Page Screenshot    

When clico no botão pause
    Wait Until Element Is Visible    xpath=//div[contains(@class, "song")]//h6[text()="${Validar}"]/..//button[contains(@class,"pause")]    10
    Pause music
    Capture Page Screenshot

Then a musica para de tocar
    Elemento play visivel

Validacao
    [Arguments]    ${Validar}

    ${res}    seleniumLibrary.Get Title

    Should Be Equal    ${Validar}    ${res}

Play
    [Arguments]    ${validador}

    Wait Until Element Is Visible    xpath=//div[contains(@class, "song")]//h6[text()="${validador}"]/..//button[contains(@class,"play")]    10
    Click Button    xpath=//div[contains(@class, "song")]//h6[text()="${validador}"]/..//button[contains(@class,"play")]
    Capture Page Screenshot
    Wait Until Element Is Visible   xpath=//div[contains(@class, "song")]//h6[text()="${validador}"]/..//button[contains(@class,"pause")]    10
    Capture Page Screenshot
    
#Validar os seis titulos das musicas na tela home 
When veirifico se as seis musicas estão sendo apresentadas na tela
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div[1]/main/div/div/section/div/div[1]/p
    
    
        
        

Then as musicas com os titulos
    [Arguments]    @{lista}
    FOR    ${item}    IN    @{lista}
        Log To Console    ${item}
        Log    ${item}
        
        Page Should Contain     ${item}
    END

#Validar pesquisa de musicas 
When efetuo a pesquisa das musicas 
    [Arguments]    @{msg}   

    FOR    ${item}    IN    @{msg}

        Log To Console    ${item}
        Input Text    id=search-input    ${item}
        Click Button    xpath=//*[@class="ml-4"]
        Sleep    2
        Wait Until Element Is Visible    xpath=//*[text()="${item}"]
        Capture Page Screenshot
        
    END
    
Then as musicas são apresentadas com sucesso
    No Operation