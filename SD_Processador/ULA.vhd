library IEEE;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY ULA IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Operandos A e B
        opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Código da operação
        result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Resultado
        Zero : OUT STD_LOGIC; -- Flag Zero
        Sign : OUT STD_LOGIC; -- Flag Sinal 
        Carry : OUT STD_LOGIC; -- Flag Carry
        Overflow : OUT STD_LOGIC -- Flag Overflow
    );
END ULA;

ARCHITECTURE Behavioral OF ULA IS
    SIGNAL temp_result : STD_LOGIC_VECTOR(8 DOWNTO 0); -- 9 bits para detectar carry/overflow
	 SIGNAL res_signed : SIGNED;
	 SIGNAL res: STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL add_ov,sub_ov: STD_LOGIC;
BEGIN
    PROCESS (A, B, opcode)
    BEGIN
	 	  Sign <= '0';
        CASE opcode IS
            WHEN "0000" =>  -- ADD 
					 res_signed <= signed('0' & A) + signed('0' & B);
                temp_result <= std_logic_vector(res_signed);
                result <= temp_result(7 DOWNTO 0);
					 add_ov <= ((A(7) and B(7) and (not temp_result(0))) or ((not A(7)) and (not B(7)) and temp_result(7)));
				    Overflow <= add_ov;
					 Carry <= temp_result(8);
					 IF res_signed = 0 THEN
						Zero <= '1';
					 ELSE
						Zero <= '0';
					 END IF;
					 Sign <= '0';
            WHEN "0001" =>  -- SUB
					 res_signed <= signed('0' & A) - signed('0' & B); 
                temp_result <= std_logic_vector(res_signed);
                result <= temp_result(7 DOWNTO 0);   
					 Overflow <= '0';
					 Carry <= '0';
					 IF res_signed /= 0 THEN
						 IF res_signed > 0 THEN
							  Sign <= '0';
						 ELSE 
							  Sign <= '1';
						 END IF;
                    Zero <= '0'; 
                ELSE
                    Zero <= '1';
                END IF;
            WHEN "0010" =>  -- AND
					 res <= A AND B;
                result <= res;
					 IF res = "00000000" THEN
						Zero <= '1';
					 ELSE
						Zero <= '0';
					 END IF;
					 Sign <= '0';
					 Carry <= '0';
					 Overflow <= '0';
            WHEN "0011" =>  -- OR
                res <= A OR B;
					 result <= res;
                IF res = "00000000" THEN
						Zero <= '1';
					 ELSE
						Zero <= '0';
					 END IF;
					 Sign <= '0';
					 Carry <= '0';
					 Overflow <= '0';

            WHEN "0100" =>  -- NOT
					 res <= NOT A;
                result <= res; 
                IF res = "00000000" THEN
						Zero <= '1';
					 ELSE
						Zero <= '0';
					 END IF;
					 Sign <= '0';
					 Carry <= '0';
					 Overflow <= '0';

            WHEN "0101" =>  -- CMP 
                res_signed <= signed('0' & A) - signed('0' & B);
					 temp_result <= std_logic_vector(res_signed);
                result <= temp_result(7 DOWNTO 0);
                IF res_signed /= 0 THEN
						 IF res_signed > 0 THEN
							  Sign <= '0';
						 ELSE 
							  Sign <= '1';
						 END IF;
                    Zero <= '0'; 
                ELSE
                    Zero <= '1';
                END IF;
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

