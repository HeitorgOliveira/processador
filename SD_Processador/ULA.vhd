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
   SIGNAL sig_A       : SIGNED(7 DOWNTO 0);
	SIGNAL sig_B       : SIGNED(7 DOWNTO 0); 
	SIGNAL resultado : SIGNED(8 DOWNTO 0);
	 
BEGIN
   PROCESS (A, B, opcode)
   BEGIN
		sig_A <= A;
		sig_B <= B;
      CASE opcode IS
            WHEN "0000" =>  -- Soma
					resultado <= (sig_A(7) & sig_A) + (sig_B(7) & sig_B); 
					result <= resultado (7 DOWNTO 0);
            WHEN "0001" =>  -- Subtração
					 
            WHEN "0010" =>  -- Operação AND
                
            WHEN "0011" =>  -- Operação OR
                
				WHEN "0100" =>  -- CMP 
                
            -- Outros opcodes podem ser adicionados conforme necessário
            WHEN OTHERS =>
                
        END CASE;

    END PROCESS;
END behavior;
