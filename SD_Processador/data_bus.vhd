--barramento de dados
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity data_bus is
    Port (
        data_in   : in  std_logic_vector(7 downto 0);  -- Dados da CPU ou do módulo
        data_out  : out std_logic_vector(7 downto 0);  -- Dados enviados para os módulos
        enable    : in  std_logic                      
    );
end data_bus;

architecture Behavioral of data_bus is
begin
    -- Transfere dados somente quando habilitado
    data_out <= data_in when enable = '1' else (others => 'Z'); -- Alta impedancia quando desabilitado
end Behavioral;