library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CPU IS
    PORT (
        clk         : IN  STD_LOGIC;                     -- Clock do sistema
        reset       : IN  STD_LOGIC;                     -- Reset global
        instr_in    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Instrução de entrada
        data_in     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Dados de entrada para operações I/O
        data_out    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Dados de saída da CPU
        addr_out    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Endereço de saída (para memória)
        Zero        : OUT STD_LOGIC;                     -- Flag Zero da ULA
        Sign        : OUT STD_LOGIC;                     -- Flag Sign da ULA
        Carry       : OUT STD_LOGIC;                     -- Flag Carry da ULA
        Overflow    : OUT STD_LOGIC                      -- Flag Overflow da ULA
    );
END CPU;

ARCHITECTURE Behavioral OF CPU IS
    -- Sinais internos
    SIGNAL pc         : STD_LOGIC_VECTOR(7 DOWNTO 0);    -- Contador de Programa (PC)
    SIGNAL opcode     : STD_LOGIC_VECTOR(2 DOWNTO 0);    -- Opcode extraído da instrução
    SIGNAL operand    : STD_LOGIC_VECTOR(7 DOWNTO 0);    -- Operando extraído da instrução
    SIGNAL A, B       : STD_LOGIC_VECTOR(7 DOWNTO 0);    -- Operandos A e B para a ULA
    SIGNAL ula_result : STD_LOGIC_VECTOR(7 DOWNTO 0);    -- Resultado da ULA
    SIGNAL ula_zero   : STD_LOGIC;
    SIGNAL ula_sign   : STD_LOGIC;
    SIGNAL ula_carry  : STD_LOGIC;
    SIGNAL ula_overflow : STD_LOGIC;

    -- Componentes internos
    COMPONENT ULA
        PORT (
            A, B     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
            opcode   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
            result   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            Zero     : OUT STD_LOGIC;
            Sign     : OUT STD_LOGIC;
            Carry    : OUT STD_LOGIC;
            Overflow : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT ProgramCounter
        PORT (
            clk      : IN  STD_LOGIC;
            reset    : IN  STD_LOGIC;
            pc_out   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT InputUnit
        PORT (
            data_in  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
            out_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT OutputUnit
        PORT (
            data_in  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
            data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

BEGIN
    -- Instância do Program Counter
    pc_unit : ProgramCounter
        PORT MAP (
            clk      => clk,
            reset    => reset,
            pc_out   => pc
        );

    -- Extrai o opcode e o operando da instrução
    PROCESS(instr_in)
    BEGIN
        opcode <= instr_in(7 DOWNTO 5);  -- 3 bits de opcode
        operand <= instr_in(4 DOWNTO 0); -- Operando de 5 bits
    END PROCESS;

    -- Instância da ULA
    ula_unit : ULA
        PORT MAP (
            A        => A,
            B        => B,
            opcode   => opcode,
            result   => ula_result,
            Zero     => ula_zero,
            Sign     => ula_sign,
            Carry    => ula_carry,
            Overflow => ula_overflow
        );

    -- Sinais de controle e dados de saída
    Zero <= ula_zero;
    Sign <= ula_sign;
    Carry <= ula_carry;
    Overflow <= ula_overflow;
    data_out <= ula_result;  -- Dados de saída da CPU resultante da ULA
    addr_out <= pc;          -- Endereço de saída baseado no PC

    -- Lógica de controle da CPU
    PROCESS(clk, reset)
    BEGIN
        IF reset = '1' THEN
            -- Reset dos sinais e registradores
            A <= (others => '0');
            B <= (others => '0');
            data_out <= (others => '0');
        
        ELSIF rising_edge(clk) THEN
            CASE opcode IS
                WHEN "000" =>  -- Exemplo: LOAD A, operando (carrega valor para A)
                    A <= operand;

                WHEN "001" =>  -- Exemplo: LOAD B, operando (carrega valor para B)
                    B <= operand;

                WHEN "010" =>  -- ADD A, B
                    -- Operação de soma entre A e B
                    A <= ula_result;

                WHEN "011" =>  -- SUB A, B
                    -- Operação de subtração entre A e B
                    A <= ula_result;

                WHEN "100" =>  -- AND A, B
                    -- Operação lógica AND
                    A <= ula_result;

                WHEN "101" =>  -- OR A, B
                    -- Operação lógica OR
                    A <= ula_result;

                WHEN "110" =>  -- OUT A (envia valor de A para saída)
                    data_out <= A;

                WHEN OTHERS =>
                    -- NOP ou operações indefinidas
                    data_out <= A;
            END CASE;
        END IF;
    END PROCESS;
END Behavioral;
