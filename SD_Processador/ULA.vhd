LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ULA IS
    PORT (
        A, B        : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Operandos A e B
        opcode      : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);  -- Código da operação
        result      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Resultado da operação
        Zero        : OUT STD_LOGIC;                     -- Flag Zero
        Sign        : OUT STD_LOGIC;                     -- Flag de sinal (1 se resultado é "negativo")
        Carry       : OUT STD_LOGIC;                     -- Flag Carry (para soma/subtração)
        Overflow    : OUT STD_LOGIC                      -- Flag Overflow (para soma/subtração)
    );
END ULA;

ARCHITECTURE behavior OF ULA IS
    SIGNAL signed_A, signed_B, signed_result : SIGNED(7 DOWNTO 0);
BEGIN
    PROCESS(A, B, opcode)
    BEGIN
        signed_A <= SIGNED(A);  -- Converte para formato com sinal
        signed_B <= SIGNED(B);
        
        CASE opcode IS
            WHEN "000" =>  -- Soma
                signed_result <= signed_A + signed_B;
                result <= STD_LOGIC_VECTOR(signed_result);

                -- Carry: Usamos a extensão de bits para verificar se há um "vai um"
                IF ((signed_A(7) AND signed_B(7)) OR ((NOT signed_A(7) AND NOT signed_B(7)) AND signed_result(7))) = '1' THEN
                    Carry <= '1';
                ELSE
                    Carry <= '0';
                END IF;

                -- Overflow: acontece quando o sinal de A e B é igual, mas o sinal do resultado é diferente
                IF (A(7) = B(7)) AND (signed_result(7) /= A(7)) THEN
                    Overflow <= '1';
                ELSE
                    Overflow <= '0';
                END IF;

            WHEN "001" =>  -- Subtração
                signed_result <= signed_A - signed_B;
                result <= STD_LOGIC_VECTOR(signed_result);

                -- Carry: para subtração, carry é o "empréstimo", ocorre quando A < B.
                IF signed_A < signed_B THEN
                    Carry <= '1';
                ELSE
                    Carry <= '0';
                END IF;

                -- Overflow: subtração causa overflow se os sinais de A e B são diferentes,
                -- e o sinal do resultado é diferente do sinal de A.
                IF (A(7) /= B(7)) AND (signed_result(7) /= A(7)) THEN
                    Overflow <= '1';
                ELSE
                    Overflow <= '0';
                END IF;

            WHEN "010" =>  -- Operação AND
                result <= A AND B;
                Carry <= '0';
                Overflow <= '0';

            WHEN "011" =>  -- Operação OR
                result <= A OR B;
                Carry <= '0';
                Overflow <= '0';

            WHEN "100" =>  -- Operação XOR
                result <= A XOR B;
                Carry <= '0';
                Overflow <= '0';

            -- Outros opcodes podem ser adicionados conforme necessário
            WHEN OTHERS =>
                result <= (OTHERS => '0');
                Carry <= '0';
                Overflow <= '0';
        END CASE;

        -- Flag Zero: ativa se o resultado é zero
        IF signed_result = "00000000" THEN
            Zero <= '1';
        ELSE
            Zero <= '0';
        END IF;

        -- Flag Sign: ativa se o resultado é negativo (em complemento de dois)
        Sign <= signed_result(7);

    END PROCESS;
END behavior;
