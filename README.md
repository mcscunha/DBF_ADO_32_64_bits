DBF_ADO_32_64_bits
==================

Exemplo mostrando como conectar com ADO, usando compilacao em 32 ou 64 bits, DelphiXE2 e tabelas DBF.

Este sistema se destina a verificar se os drivers para leitura de arquivos DBF estao instalados corretamente na maquina.
Estes drivers podem ser de 32 e/ou 64 bits.

Se executar este sistema e verificar que se consegue ler o conteudo dos arquivos DBF de exemplo, entao, os drivers estao instalados corretamente.

Caso haja algum problema, siga os passos abaixo para instalacao dos mesmos.

PASSO 1
---------------------
Na figura 1 (PASSO_1.jpg), mostra a aplicacao de testes aberta.
Observe que no item [A] o parametro "DATA SOURCE" esta como: dBASE Files
Copie este nome para cadastrarmos no sistema posteriormente.

PASSO 2
---------------------
Va em INICIAR > EXECUTAR e abra as configuracoes de ODBC.
Ex.: C:\windows\system32\odbcad32.exe  --> Para sistemas 32 bits
Ex.: C:\windows\sysWoW64\odbcad32.exe  --> Para sistemas 64 bits

Esta janela eh mostrada na figura 2 (PASSO_2.jpg).
Vah na aba: FONTE DE DADOS DO USUARIO [E]
veja se existe alguma opcao como: MICROSOFT ACCESS dBASE DRIVER [F]
Se nao houver, clique em ADICIONAR e insira este driver.

----->>  Se nao houver driver a inserir, abra a pasta: ODBC e execute o arquivo: 
	AccessDatabaseEngine	 --> Sistemas 32 bits
	AccessDatabaseEngine_x64 --> Sistemas 64 bits
	Apos a intalacao deste software, refaça este passo.
PASSO 3
---------------------
Apos intalar o driver MICROSOFT ACCESS dBASE DRIVER, selecione este item na lista do PASSO 2 e clique em CONFIGURAR [G]
Abrira uma janela igual a da figura 3 (PASSO_3.jpg).
Configure esta janela como mostrada na figura.

------>>>>   O item [B] deve ser o mesmo do item [A] no PASSO 1

Em seguida, somente falta testar se o programa de teste para abertura de DBF (DBF_ADO.exe) funciona no micro, tanto em 32 bits como em 64 bits.



---------------------
MuriloCunha
28/02/2013
