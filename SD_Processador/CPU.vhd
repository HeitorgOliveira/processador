LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY CPU IS
    PORT (
        clock         : IN  STD_LOGIC;                   -- Clock do sistema
        reset         : IN  STD_LOGIC;                   -- Sinal de reset
        switches      : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);-- Entrada (switches)
        leds          : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Saída (LEDs)
        hex0          : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        hex1          : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        hex2          : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        hex3          : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        hex4          : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        debug1        : OUT STD_LOGIC
    );
END CPU;

ARCHITECTURE Behavioral OF CPU IS
    -- Sinais internos
    SIGNAL pc_out, instrucao : std_logic_vector(7 DOWNTO 0);
    SIGNAL data_in, data_out, alu_result : std_logic_vector(7 DOWNTO 0);
    SIGNAL zero_flag, sign_flag, carry_flag, overflow_flag : std_logic;
    SIGNAL mem_enable, read_enable, write_enable : std_logic;
    SIGNAL input_enable, output_enable, pc_enable, alu_enable : std_logic;
    SIGNAL reg_a_enable, reg_b_enable, reg_r_enable : std_logic;
    SIGNAL reg_a, reg_b, reg_r, reg_literal : std_logic_vector(7 DOWNTO 0);
    SIGNAL output_mux_select : std_logic_vector(1 DOWNTO 0);
    SIGNAL data_out_intermediate : std_logic_vector(7 DOWNTO 0);
    SIGNAL debugvec : std_logic_vector(7 DOWNTO 0);
	 SIGNAL out_reg, in_reg : std_logic_vector(7 DOWNTO 0);
    
    -- Sinais para seleção de registradores
    SIGNAL reg_select_a, reg_select_b : std_logic_vector(1 DOWNTO 0);

BEGIN
    -- Instância do Program Counter (PC)
    PC : ENTITY work.program_counter PORT MAP (
        clock       => clock,
        reset       => reset,
        enable      => pc_enable,       
        load        => '0',             
        new_address => (others => '0'), 
        pc_out      => pc_out
    );

    -- Debug para saída de PC
    debug1 <= pc_enable;
    debugvec <= pc_out (7 DOWNTO 0);

    -- Instância da Unidade de Controle
    Controle : ENTITY work.UnidadeControle PORT MAP (
        clk               => clock,
        reset             => reset,
        instrucao         => instrucao,
        zero_flag         => zero_flag,
        sign_flag         => sign_flag,
        carry_flag        => carry_flag,
        overflow_flag     => overflow_flag,
        mem_enable        => mem_enable,
        read_enable       => read_enable,
        write_enable      => write_enable,
        input_enable      => input_enable,
        output_enable     => output_enable,
        pc_enable         => pc_enable,
        alu_enable        => alu_enable,
        reg_select_a      => reg_select_a,    -- Novo sinal para seleção do registrador A
        reg_select_b      => reg_select_b     -- Novo sinal para seleção do registrador B
    );

    -- Processo de seleção de registradores para a ULA
    PROCESS(reg_select_a, reg_select_b, reg_a, reg_b, reg_r, reg_literal)
    BEGIN
        -- Seleção do primeiro operando (A)
        CASE reg_select_a IS
            WHEN "00" => 
                data_out_intermediate <= reg_a;
            WHEN "01" => 
                data_out_intermediate <= reg_b;
            WHEN "10" => 
                data_out_intermediate <= reg_r;
            WHEN "11" => 
                data_out_intermediate <= reg_literal;
            WHEN OTHERS => 
                data_out_intermediate <= (OTHERS => '0');
        END CASE;
    END PROCESS;

    -- Instância da ULA (ALU)
    ULA : ENTITY work.ULA PORT MAP (
        A        => data_out_intermediate,
        B        => reg_b,
        opcode   => instrucao(7 DOWNTO 4),
        result   => alu_result,
        Zero     => zero_flag,
        Sign     => sign_flag,
        Carry    => carry_flag,
        Overflow => overflow_flag
    );

    -- Instância da Memória
    Memoria : ENTITY work.memoria_unidade PORT MAP (
        clock     => clock,
        data_in   => reg_r,
        rdaddress => pc_out,
        wraddress => pc_out,
        wren      => write_enable,
        data_out  => instrucao
    );

    -- Instância da Unidade de Entrada
    Entrada : ENTITY work.Input_Unit PORT MAP (
        switches      => switches,
        data_out      => in_reg,
        input_enable  => input_enable
    );

    -- Lógica dos Registradores
    process(clock, reset)
    begin
        if reset = '0' then
            reg_a <= (others => '0');
            reg_b <= (others => '0');
            reg_r <= (others => '0');
            reg_literal <= (others => '0');
        elsif rising_edge(clock) then
            -- Atualização dos registradores baseada na seleção
            CASE reg_select_a IS
                WHEN "00" => 
                    reg_a <= data_out_intermediate;
                WHEN "01" => 
                    reg_b <= data_out_intermediate;
                WHEN "10" => 
                    reg_r <= data_out_intermediate;
                WHEN "11" => 
                    reg_literal <= data_out_intermediate;
                WHEN OTHERS => 
                    NULL;
            END CASE;
        end if;
    end process;

    -- Unidade de Saída
    Saida : ENTITY work.Output_Unit PORT MAP (
        data_in       => out_reg,
        leds          => leds,
        output_enable => output_enable,
        clock         => clock
    );
	 
	 
	 
	 -- Instâncias do DisplayDriver para os displays HEX0 a HEX4
    HEX0_Driver : ENTITY work.DisplayDriver PORT MAP (
        value_in => reg_a(3 DOWNTO 0), -- Apenas 4 bits relevantes
        hex_out  => hex0
    );

    HEX1_Driver : ENTITY work.DisplayDriver PORT MAP (
        value_in => reg_b(3 DOWNTO 0),
        hex_out  => hex1
    );

    HEX2_Driver : ENTITY work.DisplayDriver PORT MAP (
        value_in => reg_r(3 DOWNTO 0),
        hex_out  => hex2
    );

    HEX3_Driver : ENTITY work.DisplayDriver PORT MAP (
        value_in => alu_result(3 DOWNTO 0),
        hex_out  => hex3
    );

    HEX4_Driver : ENTITY work.DisplayDriver PORT MAP (
        value_in => debugvec(3 DOWNTO 0),
        hex_out  => hex4
    );
	 
END Behavioral;
    