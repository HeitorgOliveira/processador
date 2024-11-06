library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ULA IS
    PORT (
<<<<<<< Updated upstream
        A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Operandos A e B
        opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Código da operação
        result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Resultado
        Zero : OUT STD_LOGIC; -- Flag Zero
        Sign : OUT STD_LOGIC; -- Flag Sinal 
        Carry : OUT STD_LOGIC; -- Flag Carry
        Overflow : OUT STD_LOGIC -- Flag Overflow
=======
        A, B        : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Operandos A e B
        opcode      : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);  -- Código da operação
        result      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Resultado da operação
        Zero        : OUT STD_LOGIC;                     -- Flag Zero
        Sign        : OUT STD_LOGIC;                     -- Flag de sinal (1 se resultado é "negativo")
        Carry       : OUT STD_LOGIC;                     -- Flag Carry (para soma)
        Overflow    : OUT STD_LOGIC                      -- Flag Overflow (para soma)
>>>>>>> Stashed changes
    );
END ULA;

ARCHITECTURE Behavioral OF ULA IS
<<<<<<< Updated upstream
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
=======
    SIGNAL temp_result : STD_LOGIC_VECTOR(8 DOWNTO 0);  -- Usado para calcular o carry
BEGIN
    PROCESS (A, B, opcode)
    BEGIN
        Carry <= '0';
        Overflow <= '0';

        CASE opcode IS
            WHEN "000" =>  -- ADD (Soma)
                temp_result <= ('0' & A) + ('0' & B);  -- Expande para 9 bits para verificar o carry
                result <= temp_result(7 DOWNTO 0);      -- Armazena os 8 bits do resultado
                Carry <= temp_result(8);                -- Carry é o bit 9 da soma
                Overflow <= (A(7) = B(7)) AND (result(7) /= A(7));  -- Detecta overflow

            WHEN "001" =>  -- SUB (Subtração)
                temp_result <= ('0' & A) - ('0' & B);
                result <= temp_result(7 DOWNTO 0);
                Sign <= result(7);  -- Sinal é 1 se o resultado é "negativo" (bit mais significativo)

            WHEN "010" =>  -- AND
                result <= A AND B;

            WHEN "011" =>  -- OR
                result <= A OR B;

            WHEN "100" =>  -- NOT (Somente no operando A)
                result <= NOT A;

            WHEN "101" =>  -- CMP (Comparação)
                temp_result <= ('0' & A) - ('0' & B);
                result <= (others => '0');  -- Resultado de CMP não é utilizado, zeramos
                Sign <= temp_result(7);  -- Flag Sign depende do resultado da comparação
                --Zero <= '1' WHEN temp_result(7 DOWNTO 0) = "00000000" ELSE '0';  -- Flag Zero para comparação
>>>>>>> Stashed changes

            WHEN OTHERS =>
                result <= (others => '0');  -- Caso padrão: zera o resultado
        END CASE;
		  
		  if(result = "00000000") then
				Zero <= '1';
		  else
				Zero <= '0';
		  end if;
        -- Configura a flag Zero após a operação
        --Zero <= '1' WHEN result = "00000000" ELSE '0';

        -- A flag Sign depende da operação e do bit mais significativo de result
        IF opcode = "000" OR opcode = "001" OR opcode = "101" THEN
            Sign <= result(7);  -- Atualiza Sign com o bit de sinal do resultado
        ELSE
            Sign <= '0';  -- Zera a flag de sinal em operações lógicas
        END IF;
    END PROCESS;
END Behavioral;
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
