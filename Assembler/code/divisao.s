IN A; -- Le as entradas em A
IN B; -- Le as entradas em B
MOV R, 0; -- Armazena 0 em R
STORE R, 255; -- Armazena R no endereco 255
MOV R, A; -- Armazena o valor de A em R (R = A)

LOOP_START:
SUB R, B; -- R = R - B
MOV A, R; -- A = R
LOAD R, 255; -- R = endereco 255
ADD R, 1; -- R = R + 1
STORE R, 255; -- Armazena R no endereco 255
MOV R, A; -- R = A
CMP R, B; -- Compara R com B
JGR LOOP_START; -- Se R > B, vai para LOOP_START

LOAD R, 255; -- R = endereco 255
OUT R; -- Coloca o valor de R na saida
WAIT; -- Aguarda um sinal para continuar
