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
	 SIGNAL res_int       : INTEGER;
	 SIGNAL res           : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (A, B, opcode)
    BEGIN

        CASE opcode IS
            WHEN "0000" =>  -- Soma
					  temp_result <= (A(7) & A) + (B(7) & B);
					  res <= temp_result(7 DOWNTO 0);
                -- Carry: Usamos a extensão de bits para verificar se há um "vai um"

                -- Overflow: acontece quando o sinal de A e B é igual, mas o sinal do resultado é diferente
					 IF (A(7) = B(7)) AND (res(7) /= A(7)) THEN
                    Overflow <= '1';
                ELSE
                    Overflow <= '0';
                END IF;
            WHEN "0001" =>  -- Subtração
					  temp_result <= (A(7) & A) - (B(7) & B);
					  res <= temp_result(7 DOWNTO 0);

                IF (A(7) /= B(7)) AND (res(7) /= A(7)) THEN
                    Overflow <= '1';
                ELSE
                    Overflow <= '0';
                END IF;

            WHEN "0010" =>  -- Operação AND
                temp_result(7 DOWNTO 0) <= A AND B;
					 res <= temp_result(7 DOWNTO 0);
                Carry <= '0';
                Overflow <= '0';

            WHEN "0011" =>  -- Operação OR
                temp_result(7 DOWNTO 0) <= A OR B;
					 res <= temp_result(7 DOWNTO 0);
                Carry <= '0';
                Overflow <= '0';

				WHEN "0100" =>  -- CMP 
                temp_result <= (A(7) & A) - (B(7) & B);
					 res_int <= INTEGER(temp_result);
                IF res_int /= 0 THEN
						 IF res_int > 0 THEN
							  Sign <= '0';
						 ELSE 
							  Sign <= '1';
						 END IF;
					 Carry <= '0';
                Overflow <= '0';

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

        -- Flag Sign: ativa se o resultado é negativo (em complemento de dois)
		  IF opcode /= "0100" THEN
			   Sign <= temp_result(8) OR temp_result(7);
		  END IF;
		  result <= res;

    END PROCESS;
END behavior;
