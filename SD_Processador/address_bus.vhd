--barramento de endereço
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity address_bus is
    Port (
        addr_in   : in  std_logic_vector(7 downto 0);  -- Endereço da CPU
        addr_out  : out std_logic_vector(7 downto 0)   -- Endereço enviado para os módulos
    );
end address_bus;

architecture Behavioral of address_bus is
begin
    -- Passa o endereço de entrada para o barramento de saída
    addr_out <= addr_in;
end Behavioral;