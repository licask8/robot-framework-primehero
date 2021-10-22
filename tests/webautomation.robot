*** Settings ***
Documentation   Aqui estarão presentes os primeiros testes automatizados web.

Resource        ../resources/keywords/kws_webautomation.robot
Test Setup        Abrir navegador 
Test Teardown        Fechar navegador



*** Test Cases ***
Caso de Teste 01: Pesquisar produto 
    [Tags]        PESQUISAR
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site 

Caso de Teste 02: Pesquisar produto não existente
    [Tags]        ITEM
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""    