LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Input_Unit IS
    PORT (
        switches : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Chaves do FPGA
        clk : IN STD_LOGIC; -- Clock
        reset : IN STD_LOGIC; -- Reset assincrono
        input_enable : IN STD_LOGIC; -- Habilitar ou nao a gravaçao
        registro : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Saida do registrador
    );
END Input_Unit;

ARCHITECTURE Behavioral OF Input_Unit IS
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

    SIGNAL input_reg : STD_LOGIC_VECTOR(7 DOWNTO 0); 

BEGIN
    reg: registrador
        PORT MAP (
            d => switches,
            clk => clk,
            reset => reset,
            enable => input_enable,
            q => input_reg
        );
    registro <= input_reg;
END Behavioral;
