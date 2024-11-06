library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register8 is
    Port (
        clock    : in  std_logic;                      -- Clock do sistema
        reset    : in  std_logic;                      
        load     : in  std_logic;                      -- Enable para carregar novo valor
        data_in  : in  std_logic_vector(7 downto 0);   -- Entrada
        data_out : out std_logic_vector(7 downto 0)    -- Dados armazenados no registrador
    );
end register8;

architecture Behavioral of register8 is
    signal reg_value : std_logic_vector(7 downto 0);  -- Registrador interno
begin
    process(clock, reset)
    begin
        if reset = '1' then
            reg_value <= (others => '0');  -- Zera o registrador quando reset está ativo
        elsif rising_edge(clock) then
            if load = '1' then
                reg_value <= data_in;  -- Carrega o valor de entrada no registrador se habilitado
            end if;
        end if;
    end process;

    data_out <= reg_value; 
end Behavioral;