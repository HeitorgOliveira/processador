LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DisplayDriver IS
    PORT (
        value_in : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- Valor binário de entrada (4 bits)
        hex_out  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) -- Código do display de 7 segmentos
    );
END DisplayDriver;

ARCHITECTURE Behavioral OF DisplayDriver IS
BEGIN
    PROCESS(value_in)
    BEGIN
        CASE value_in IS
            WHEN "0000" => hex_out <= "1000000"; -- 0
            WHEN "0001" => hex_out <= "1111001"; -- 1
            WHEN "0010" => hex_out <= "0100100"; -- 2
            WHEN "0011" => hex_out <= "0110000"; -- 3
            WHEN "0100" => hex_out <= "0011001"; -- 4
            WHEN "0101" => hex_out <= "0010010"; -- 5
            WHEN "0110" => hex_out <= "0000010"; -- 6
            WHEN "0111" => hex_out <= "1111000"; -- 7
            WHEN "1000" => hex_out <= "0000000"; -- 8
            WHEN "1001" => hex_out <= "0010000"; -- 9
            WHEN "1010" => hex_out <= "0001000"; -- A
            WHEN "1011" => hex_out <= "0000011"; -- B
            WHEN "1100" => hex_out <= "1000110"; -- C
            WHEN "1101" => hex_out <= "0100001"; -- D
            WHEN "1110" => hex_out <= "0000110"; -- E
            WHEN "1111" => hex_out <= "0001110"; -- F
            WHEN OTHERS => hex_out <= "1111111"; -- Display apagado
        END CASE;
    END PROCESS;
END Behavioral;
