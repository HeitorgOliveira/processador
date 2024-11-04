LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Output_Unit IS
    PORT (
        data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Dados a serem exibidos
        clk : IN STD_LOGIC; -- Clock
        reset : IN STD_LOGIC; -- Reset assincrono
        output_enable : IN STD_LOGIC; -- Habilitar a gravação
        leds : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Saída para os LEDs
    );
END Output_Unit;

ARCHITECTURE Behavioral OF Output_Unit IS
    COMPONENT registrador
		  GENERIC (N : INTEGER := 8);
        PORT (
            d : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            enable : IN STD_LOGIC;
            q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL output_reg : STD_LOGIC_VECTOR(7 DOWNTO 0); 

BEGIN
    reg: registrador
        PORT MAP (
            d => data_in,
            clk => clk,
            reset => reset,
            enable => output_enable,
            q => output_reg
        );
    leds <= output_reg;

END Behavioral;
