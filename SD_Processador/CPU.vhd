LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY CPU IS
    PORT (
        clock         : IN  STD_LOGIC;                   -- Clock do sistema
        reset         : IN  STD_LOGIC;                   -- Sinal de reset
        switches      : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);-- Entrada (switches)
        leds          : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Saída (LEDs)
    );
END CPU;

ARCHITECTURE Behavioral OF CPU IS
    -- Sinais internos
    SIGNAL pc_out, data_in, data_out, alu_result : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL instrucao                             : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Instrução completa de 8 bits
    SIGNAL zero_flag, sign_flag, carry_flag, overflow_flag : STD_LOGIC;
    SIGNAL mem_enable, read_enable, write_enable : STD_LOGIC;
    SIGNAL input_enable, output_enable, pc_enable, alu_enable : STD_LOGIC;
    SIGNAL reg_a_enable, reg_b_enable : STD_LOGIC;

BEGIN
    -- Instância do Program Counter (PC)
    PC : ENTITY work.program_counter PORT MAP (
        clock      => clock,
        reset      => reset,
        load       => pc_enable,
        increment  => '1',       -- Aqui podemos ajustar para sempre incrementar
        new_address => (others => '0'),  -- Endereço inicial do PC
        pc_out     => pc_out
    );

    -- Instância da Unidade de Controle
    Controle : ENTITY work.UnidadeControle PORT MAP (
        clk           => clock,
        reset         => reset,
        instrucao     => instrucao,    -- Instrução completa de 8 bits
        zero_flag     => zero_flag,
        sign_flag     => sign_flag,
        carry_flag    => carry_flag,
        overflow_flag => overflow_flag,
        mem_enable    => mem_enable,
        read_enable   => read_enable,
        write_enable  => write_enable,
        input_enable  => input_enable,
        output_enable => output_enable,
        pc_enable     => pc_enable,
        alu_enable    => alu_enable,
        reg_a_enable  => reg_a_enable,
        reg_b_enable  => reg_b_enable
    );

    -- Instância da ULA (ALU)
    ULA : ENTITY work.ULA PORT MAP (
        A        => data_in,
        B        => data_out,
        opcode   => instrucao(6 DOWNTO 4), -- Usar parte do opcode da instrução completa
        result   => alu_result,
        Zero     => zero_flag,
        Sign     => sign_flag,
        Carry    => carry_flag,
        Overflow => overflow_flag
    );

    -- Instância da Memória
    Memoria : ENTITY work.memoria_unidade PORT MAP (
        clock     => clock,
        data_in   => data_out,
        rdaddress => pc_out,
        wraddress => pc_out,
        wren      => write_enable,
        data_out  => instrucao  -- Lê a instrução completa da memória para o controle
    );

    -- Instância da Unidade de Saída
    Saida : ENTITY work.Output_Unit PORT MAP (
        data_in       => data_in,
        leds          => leds,
        output_enable => output_enable,
        clock         => clock
    );

    -- Instância da Unidade de Entrada
    Entrada : ENTITY work.Input_Unit PORT MAP (
        switches      => switches,
        data_out      => data_out,
        input_enable  => input_enable
    );

END Behavioral;
