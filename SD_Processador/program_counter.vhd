--program counter, programado para poder realizar JMP e incrementar
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity program_counter is
    Port (
        clock        : in  std_logic;                   -- Clock do sistema
        reset        : in  std_logic;                   -- Reset para voltar ao endereço inicial
        load         : in  std_logic;                   -- Sinal para carregar um novo endereço
        increment    : in  std_logic;                   -- Sinal para incrementar o contador
        new_address  : in  std_logic_vector(7 downto 0); -- Endereço a ser carregado em caso de salto
        pc_out       : out std_logic_vector(7 downto 0)  -- Saída do endereço atual do PC
    );
end program_counter;

architecture Behavioral of program_counter is
    signal pc : std_logic_vector(7 downto 0) := (others => '0'); -- Inicializa o PC com 0
begin
    process(clock, reset)
    begin
        if reset = '1' then
            pc <= (others => '0');  -- Reseta o PC para 0
        elsif rising_edge(clock) then
            if load = '1' then
                pc <= new_address;  -- Carrega o novo endereço em caso de salto
            elsif increment = '1' then
                pc <= pc + 1;       -- Incrementa o PC em caso de instrução sequencial
            end if;
        end if;
    end process;

    pc_out <= pc;  -- A saída do PC
end Behavioral;
