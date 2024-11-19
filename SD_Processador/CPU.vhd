LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL; -- Usar apenas esta biblioteca para operações aritméticas com SIGNED e UNSIGNED

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
    SIGNAL pc_out, instrucao : std_logic_vector(7 DOWNTO 0);
    SIGNAL data_in, data_out, alu_result : std_logic_vector(7 DOWNTO 0);
    SIGNAL zero_flag, sign_flag, carry_flag, overflow_flag : std_logic;
    SIGNAL mem_enable, read_enable, write_enable : std_logic;
    SIGNAL input_enable, output_enable, pc_enable, alu_enable : std_logic;
    SIGNAL reg_a_enable, reg_b_enable, reg_r_enable : std_logic;
    SIGNAL reg_a, reg_b, reg_r : std_logic_vector(7 DOWNTO 0);
    SIGNAL output_mux_select : std_logic_vector(1 DOWNTO 0);
    SIGNAL data_out_intermediate : std_logic_vector(7 DOWNTO 0);

BEGIN
    -- Instância do Program Counter (PC)
    PC : ENTITY work.program_counter PORT MAP (
        clock      => clock,
        reset      => reset,
        load       => pc_enable,
        increment  => '1',
        new_address => (others => '0'),  -- Não usado neste programa simples
        pc_out     => pc_out
    );

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
        reg_a_enable      => reg_a_enable,
        reg_b_enable      => reg_b_enable,
        reg_r_enable      => reg_r_enable, -- Conexão adicionada
        output_mux_select => output_mux_select
    );

    -- Instância da ULA (ALU)
    ULA : ENTITY work.ULA PORT MAP (
        A        => reg_a,
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
        data_in   => reg_r, -- Escreve o resultado de R, se necessário
        rdaddress => pc_out,
        wraddress => pc_out,
        wren      => write_enable,
        data_out  => instrucao
    );

    -- Instância da Unidade de Entrada
    Entrada : ENTITY work.Input_Unit PORT MAP (
        switches      => switches,
        data_out      => data_out_intermediate,
        input_enable  => input_enable
    );

    -- Lógica dos Registradores
    process(clock, reset)
    begin
        if reset = '0' then
            reg_a <= (others => '0');
            reg_b <= (others => '0');
            reg_r <= (others => '0');
        elsif rising_edge(clock) then
            if reg_a_enable = '1' then
                reg_a <= data_out_intermediate; -- Carrega entrada nos registradores
            end if;
            if reg_b_enable = '1' then
                reg_b <= data_out_intermediate;
            end if;
            if reg_r_enable = '1' then
                reg_r <= alu_result; -- Armazena o resultado da ULA
            end if;
        end if;
    end process;

    -- Multiplexador de Saída
    process(output_mux_select, reg_a, reg_b, reg_r, alu_result)
    begin
        case output_mux_select is
            when "00" =>
                data_out <= reg_a; -- Registrador A
            when "01" =>
                data_out <= reg_b; -- Registrador B
            when "10" =>
                data_out <= reg_r; -- Resultado armazenado
            when "11" =>
                data_out <= alu_result; -- Saída direta da ULA
            when others =>
                data_out <= (others => '0');
        end case;
    end process;

    -- Unidade de Saída
    Saida : ENTITY work.Output_Unit PORT MAP (
        data_in       => data_out,
        leds          => leds,
        output_enable => output_enable,
        clock         => clock
    );
END Behavioral;
