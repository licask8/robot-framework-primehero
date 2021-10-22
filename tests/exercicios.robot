*** Settings ***
Documentation        Neste arquivo estarão presente os exercícios de automação do curso Prime hero
Library    XML

*** Variables ***
# declaração de variavel do tipo dicionário  
&{PESSOA}        
...    nome=Elielson     
...    sobrenome=Francisco        
...    idade=24 anos    
...    cpf=1234567891    
...    profissão=analista de testes     
...    carro=sentra

@{FRUTAS}     uva    goiaba    mexirixa    melão    morango    pera  

*** Test Cases ***
#cenário de testes
Cenario: Imprimindo 6 informações de uma pessoa 
    Log To Console   ${PESSOA.nome} 
    Log To Console   ${PESSOA.sobrenome}     
    Log To Console   ${PESSOA.idade}     
    Log To Console   ${PESSOA.cpf}     
    Log To Console   ${PESSOA.profissão}
    Log To Console   ${PESSOA.carro}     
     
Cenario: Imprimindo uma lista de frutas 
# declaração de tag para imprimir apenas essas lista
  [Tags]        LISTA     
  Log To Console   ${FRUTAS[2]}  
  Log To Console   ${FRUTAS}

Cenario: Somando dois numeros
    [Tags]    Somar
    Somar dois numeros    10    10


Cenario: Criando email

    [Tags]      EMAIL
    ${RESULTADO_EMAIL}    Criar email      Elielson  Francisco  24
    Log To Console    ${RESULTADO_EMAIL}
    

Cenario: Contado de 0 a 9 
    [Tags]    CONTAR
    FOR    ${COUNT}    IN RANGE    0    9
        Log To Console    ${COUNT}
    END

Cenario: Percorrendo lista de frutas
    [Tags]        PERCORRER
    Percorrer itens de uma lista    

Cenario: Mostrando Frase
    [Tags]    FRASE

    Lista de numeros
    

Cenario: Paises

    [Tags]    PAISES
    Imprimir paises 

Cenario: tomando decisão

    [Tags]    IF    
    Tomar decição

*** Keywords ***
Somar dois numeros
    [Arguments]    ${NuM_A}    ${NUM_B}
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    [Return]    ${SOMA}

Criar email 
    [Arguments]    ${NOME}    ${SOBRENOME}       ${IDADE}
    ${RESULTADO_EMAIL}        Catenate    ${NOME}_${SOBRENOME}_${IDADE}@gmail.com
    Log To Console    ${RESULTADO_EMAIL}      

Percorrer itens de uma lista 
    @{FRUTAS}    Create List    UVA    MORANGO    ABACAXI    LIMÃO
    FOR    ${FRUTA}    IN    @{FRUTAS}
        Log To Console       ${FRUTA}
        
    END        

Lista de numeros
    FOR    ${COUNT}    IN RANGE  0    10
        Log To Console    Estou no numero     ${COUNT}
        
    END


Imprimir paises
    @{PAISES}    Create List    JAMAICA    FRANÇA    ITALIA
    FOR    ${PAIS}    IN    @{PAISES}
        Log To Console    estou na ${PAIS}
        
    END 

Tomar decição   
    FOR    ${COUNT}    IN RANGE    0    10
        IF    '${COUNT}' == '5'
            Log To Console   estou no numero:${COUNT}
        ELSE IF    '${COUNT}' == '8'
            Log To Console    estou no numero: ${COUNT}
        ELSE 
        Log To Console    Este não é o numero 5 ou 8   
        
        END
        
    END