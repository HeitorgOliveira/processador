library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
    Port (
        addr : in std_logic_vector(7 downto 0);  -- Endereço de 8 bits
        data : out std_logic_vector(7 downto 0)  -- Dados de saída de 8 bits
    );
end ROM;

architecture Behavioral of ROM is
    type memory_array is array (0 to 255) of std_logic_vector(7 downto 0);
    signal ROM_content : memory_array;
begin
    -- Leitura do arquivo .mif para simulação
    process
    begin
        file_open("ROM_content.mif");  -- Lê o arquivo .mif e inicializa ROM_content
        wait;
    end process;

    data <= ROM_content(to_integer(unsigned(addr)));
end Behavioral;