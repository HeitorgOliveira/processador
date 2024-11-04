library IEEE;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY ULA IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Operandos A e B
        opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- Código da operação
        result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Resultado
        Zero : OUT STD_LOGIC; -- Flag Zero
        Sign : OUT STD_LOGIC; -- Flag Sinal logico (True/False?)
        Carry : OUT STD_LOGIC; -- Flag Carry
        Overflow : OUT STD_LOGIC -- Flag Overflow
    );
END ULA;

ARCHITECTURE Behavioral OF ULA IS
    SIGNAL temp_result : STD_LOGIC_VECTOR(8 DOWNTO 0); -- 9 bits para detectar carry/overflow
	 SIGNAL res_signed : SIGNED;
	 SIGNAL res: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    PROCESS (A, B, opcode)
    BEGIN
	 	  Sign <= '0';
        CASE opcode IS
            WHEN "000" =>  -- ADD
					 -- Preciso considerar que as entradas sao signed?
					 res_signed <= signed(A(7) & A) + signed(B(7) & B); -- Repetiçao do ultimo bit antes da adiçao
                temp_result <= std_logic_vector(res_signed);
                result <= temp_result(7 DOWNTO 0);
					 -- Qual vai ser a diferença do Carry para o Overflow?

            WHEN "001" =>  -- SUB
					 -- Preciso considerar que as entradas sao signed?
					 res_signed <= signed(A(7) & A) - signed(B(7) & B); -- Repeticao do ultimo bit antes da subtracao
                temp_result <= std_logic_vector(res_signed);
                result <= temp_result(7 DOWNTO 0);
					 -- Qual vai ser a diferença do Carry para o Overflow?

            WHEN "010" =>  -- AND
					 res <= A AND B;
                result <= res;
					 -- Somente a flag Zero importa?
					 IF res = "00000000" THEN
						Zero <= '1';
					 ELSE
						Zero <= '0';
					 END IF;
					 Sign <= '0';
					 Carry <= '0';
					 Overflow <= '0';
            WHEN "011" =>  -- OR
                res <= A OR B;
					 result <= res;
					 -- Somente a flag Zero importa?
                IF res = "00000000" THEN
						Zero <= '1';
					 ELSE
						Zero <= '0';
					 END IF;
					 Sign <= '0';
					 Carry <= '0';
					 Overflow <= '0';

            WHEN "100" =>  -- NOT
					 res <= NOT A;
                result <= res; 
					 -- Somente a flag Zero importa?
                IF res = "00000000" THEN
						Zero <= '1';
					 ELSE
						Zero <= '0';
					 END IF;
					 Sign <= '0';
					 Carry <= '0';
					 Overflow <= '0';

            WHEN "101" =>  -- CMP 
                res_signed <= signed(A) - signed(B);
                result <= (OTHERS => '0'); -- Resultado da comparação é zero
					 -- Somente a flag Sign importa?
                IF res_signed = 0 THEN
                    Sign <= '1'; 
                ELSE
                    Sign <= '0';
                END IF;
					 Zero <= '0';
					 Carry <= '0';
					 Overflow <= '0';

            WHEN OTHERS =>
                result <= (OTHERS => '0');
					 Zero <= '0';
					 Sign <= '0';
					 Carry <= '0';
					 Overflow <= '0';
        END CASE;
    END PROCESS;
END Behavioral;