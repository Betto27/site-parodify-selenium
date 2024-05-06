*** Settings ***
Documentation    Escrita dos cenarios de testes

Resource    ..//resources/Base.resource
Resource    ..//resources/Script.resource

Test Setup    Abrir o navegador do projeto    
Test Teardown    Fechar o navegador

*** Test Cases ***
Validar o titulo do site
    
    Given que abro o navegador
    When acesso o site
    Then no tituto da pagina é apresentado     Parodify by Papito
    
Tocar musica ao clicar no botão play
    Given que acesso o site
    When clico no botão play        
    Then a musica é iniciada        

Pausar musica ao clicar no botão pause
    Given que acesso o site
    And a musica esteja tocando    
    When clico no botão pause
    Then a musica para de tocar

Testar titulos diferentes
    [Template]        Validacao

    Parodify by 
    Parodify by Papitoo
    Parodify by Papit
    Parodify by Papito    

Testar todos botoes de play
    [Tags]        Todas_musicas
    [Template]    Play 

    Bughium
    Nice Bugs Finish Devs
    Bug Suede Shoes
    All The Small Sprints
    The Devs Aren't Alright
    Symphony of Production  

Validar os seis titulos das musicas na tela home 
    Given que acesso o site
    When veirifico se as seis musicas estão sendo apresentadas na tela   
    Then as musicas com os titulos     Bughium    Nice Bugs Finish Devs     Bug Suede Shoes     All The Small Sprints 
    ...    The Devs Aren't Alright     Symphony of Production   

Validar pesquisa de musicas 
    [Tags]    pesquisa
    Given que acesso o site
    When efetuo a pesquisa das musicas    Bughium    Nice Bugs Finish Devs     Bug Suede Shoes     All The Small Sprints 
    ...    The Devs Aren't Alright     Symphony of Production    
    Then as musicas são apresentadas com sucesso