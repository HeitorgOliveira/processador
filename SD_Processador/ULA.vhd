LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ULA IS
    PORT (
        A, B        : IN  SIGNED(7 DOWNTO 0);            -- Operandos A e B
        opcode      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);  -- Código da operação
        result      : OUT SIGNED(7 DOWNTO 0);            -- Resultado da operação
        Zero        : OUT STD_LOGIC;                     -- Flag Zero
        Sign        : OUT STD_LOGIC;                     -- Flag de sinal (1 se resultado é "negativo")
        Carry       : OUT STD_LOGIC;                     -- Flag Carry (para soma/subtração)
        Overflow    : OUT STD_LOGIC                      -- Flag Overflow (para soma/subtração)
    );
END ULA;

ARCHITECTURE behavior OF ULA IS
    SIGNAL temp_result   : SIGNED(8 DOWNTO 0) := (OTHERS => '0'); -- 9 bits para detectar carry/overflow
	 
BEGIN
    PROCESS (A, B, opcode)
    BEGIN

        CASE opcode IS
            WHEN "0000" =>  -- Soma
					 
            WHEN "0001" =>  -- Subtração
					 
            WHEN "0010" =>  -- Operação AND
                
            WHEN "0011" =>  -- Operação OR
                
				WHEN "0100" =>  -- CMP 
                
            -- Outros opcodes podem ser adicionados conforme necessário
            WHEN OTHERS =>
                res <= (OTHERS => '0');
                Carry <= '0';
                Overflow <= '0';
        END CASE;

        -- Flag Zero: ativa se o resultado é zero
        IF res = "00000000" THEN
            Zero <= '1';
        ELSE
            Zero <= '0';
        END IF;

    END PROCESS;
END behavior;
