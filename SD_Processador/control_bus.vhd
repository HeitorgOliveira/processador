--baramento de controle
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_bus is
    Port (
        readEn      : in  std_logic;  -- Sinal de leitura
        writeEn     : in  std_logic;  -- Sinal de escrita
        mem_enable  : in  std_logic;  -- Habilita memória
        input_enable: in  std_logic;  -- Habilita entrada
        output_enable: in  std_logic; -- Habilita saída
        clock       : in  std_logic;  -- Sinal de clock
        reset       : in  std_logic   -- Sinal de reset
    );
end control_bus;

architecture Behavioral of control_bus is
begin
    -- Este módulo só direciona os sinais para os módulos conectados.
    -- Não há comportamento específico implementado aqui.
    -- Cada sinal está pronto para ser usado por outros componentes conforme necessário.
end Behavioral;
