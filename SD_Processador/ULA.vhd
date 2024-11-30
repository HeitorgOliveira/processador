LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY ULA IS
    PORT (
        A, B        : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Operandos A e B
        opcode      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);  -- Código da operação
        result      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Resultado da operação
        Zero        : OUT STD_LOGIC;                     -- Flag Zero
        Sign        : OUT STD_LOGIC;                     -- Flag de sinal (1 se resultado é "negativo")
        Carry       : OUT STD_LOGIC;                     -- Flag Carry (para soma/subtração)
        Overflow    : OUT STD_LOGIC;                     -- Flag Overflow (para soma/subtração)
		  result_enable : OUT STD_LOGIC                    -- Enable que permite a CPU a guardar o resultado em R
    );
END ULA;

ARCHITECTURE behavior OF ULA IS

BEGIN
   PROCESS (A, B, opcode)
	VARIABLE sig_A       : STD_LOGIC_VECTOR(7 DOWNTO 0);
	VARIABLE sig_B       : STD_LOGIC_VECTOR(7 DOWNTO 0); 
   VARIABLE resultado   : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');  
   BEGIN
      sig_A := A;
      sig_B := B;
		Carry <= '0';
		Overflow <= '0';
      CASE opcode IS
			
         WHEN "0000" =>  -- Soma
            resultado (8 DOWNTO 0) := std_logic_vector(('0' & sig_A) + ('0' & sig_B));  
            result <= resultado(7 DOWNTO 0);  
				
				IF(sig_A(7) = sig_B(7) AND resultado(7) /= sig_A(7)) THEN
					Overflow <= '1';
				END IF; 
					
				Carry <= resultado(8);
				
         WHEN "0001" =>  -- Subtração
            resultado (8 DOWNTO 0) := std_logic_vector(('0' & sig_A) - ('0' & sig_B));  
            result <= resultado(7 DOWNTO 0);  
				
				IF(sig_A(7) /= sig_B(7) AND resultado(7) /= sig_A(7)) THEN
					Overflow <= '1';
				END IF;
				
				IF (resultado(8) = '1') THEN
					Carry <= '1';
				END IF;
				
         WHEN "0010" =>  -- Operação AND
            resultado(7 DOWNTO 0) := sig_A AND sig_B;
            result <= resultado(7 DOWNTO 0);
				

         WHEN "0011" =>  -- Operação OR
            resultado(7 DOWNTO 0) := sig_A OR sig_B;
            result <= resultado(7 DOWNTO 0);
				

         WHEN "0100" =>  -- Operação NOT
				resultado(7 DOWNTO 0) := NOT(sig_A);
				result <= resultado(7 DOWNTO 0);
			
			WHEN "0101" => -- CMP (Compare)
				resultado (8 DOWNTO 0) :=  std_logic_vector(('0' & sig_A) + ('0' & sig_B));  
				--result <= resultado(7 DOWNTO 0);
				
         WHEN OTHERS => 
            result <= (others => '0');  
      END CASE;
		
		IF resultado(7 DOWNTO 0) = "00000000" THEN 
			Zero <= '1';
		ELSE
			Zero <= '0';
		END IF;
		
		Sign <= resultado(7);
		
   END PROCESS;
END behavior;

