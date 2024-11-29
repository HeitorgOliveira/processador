library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity program_counter is
    Port (
        clock       : in  std_logic;                   -- Clock do sistema
        reset       : in  std_logic;                   -- Reset para voltar ao endereço inicial
        enable      : in  std_logic;                   -- Sinal de habilitação para alterar o contador
        new_address : in  std_logic_vector(7 downto 0); -- Endereço a ser carregado
        load        : in  std_logic;                   -- Carregar um novo endereço (salto)
        pc_out      : out std_logic_vector(7 downto 0)  -- Saída do endereço atual do PC
    );
end program_counter;

architecture Behavioral of program_counter is
    signal pc : std_logic_vector(7 downto 0) := (others => '0'); -- Inicializa o PC com 0
begin
    process(clock, reset)
    begin
        if reset = '0' then
            pc <= (others => '0');  -- Reseta o PC para 0
        elsif rising_edge(clock) then
            if enable = '1' then
                if load = '1' then
                    pc <= new_address; -- Carrega o novo endereço (salto)
                else
                    pc <= pc + 1;      -- Incrementa o PC em caso de instrução sequencial
                end if;
            end if;
        end if;
    end process;

    pc_out <= pc;  -- A saída do PC
end Behavioral;
