LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Input_Unit IS
    Port (
        switches      : in  std_logic_vector(7 downto 0);  -- Chaves de entrada (8 bits)
        data_out      : out std_logic_vector(7 downto 0);  -- Saída para barramento de dados
        input_enable  : in  std_logic                      -- Habilita leitura
    );
END Input_Unit;

ARCHITECTURE Behavioral OF Input_Unit IS
begin
    process(input_enable, switches)
    begin
        if input_enable = '1' then
            data_out <= switches;  -- Disponibiliza as chaves de entrada no barramento de dados
        else
            data_out <= (others => 'Z');  -- Alta impedância quando não está habilitado
        end if;
    end process;
END Behavioral;
