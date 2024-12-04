IN A; -- Le o que esta no input para Registrador A
IN B; -- Le o que esta no input para Registrador B
MOV R, 0;  -- Coloca o valor zero no Registrador R
LOOP_START:
    CMP B, 0; -- Compara B com 0
    JEQ END_LOOP; -- Se B for igual a 0 , termina o loop
    ADD R, A; -- Soma A ao valor acumulado em R 
    STORE R 255; -- Armazena o valor de R no endereco 255
    SUB B, 1; -- Decrementa o multiplicador B
    MOV B, R; -- Armazena o valor de R em B
    LOAD R, 11111111; -- Carrega o valor do endereco 255 em R
    JMP LOOP_START; -- Repete o loop
END_LOOP:
OUT R;
WAIT;
