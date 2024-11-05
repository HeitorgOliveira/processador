library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Output_Unit is
    Port (
        data_in       : in  std_logic_vector(7 downto 0);  -- Dados do barramento de dados
        leds          : out std_logic_vector(7 downto 0);  
        output_enable : in  std_logic;                     
        clock         : in  std_logic                      -- Clock do sistema
    );
end Output_Unit;

architecture Behavioral of Output_Unit is
    signal output_reg : std_logic_vector(7 downto 0);  -- Registrador para armazenar o valor atual
begin
    process(clock)
    begin
        if rising_edge(clock) then
            if output_enable = '1' then
                output_reg <= data_in;  -- Atualiza o registrador com o valor do barramento de dados
            end if;
        end if;
    end process;

    leds <= output_reg;  -- Exibe o valor armazenado nos LEDs
end Behavioral;
