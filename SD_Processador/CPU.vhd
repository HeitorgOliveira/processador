LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL; -- Usar apenas esta biblioteca para operações aritméticas com SIGNED e UNSIGNED

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
    SIGNAL reg_a, reg_b, reg_r : std_logic_vector(7 DOWNTO 0);
    SIGNAL output_mux_select : std_logic_vector(1 DOWNTO 0);
    SIGNAL data_out_intermediate : std_logic_vector(7 DOWNTO 0);
	 SIGNAL debugvec : std_logic_vector(7 DOWNTO 0);

BEGIN
    -- Instância do Program Counter (PC)
    PC : ENTITY work.program_counter PORT MAP (
        clock       => clock,
        reset       => reset,
        enable      => pc_enable,       -- Apenas usa pc_enable para controle do contador
        load        => '0',             -- Não estamos usando salto (sempre 0 neste caso)
        new_address => (others => '0'), -- Endereço fixo para salto não utilizado
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
        reg_a_enable      => reg_a_enable,
        reg_b_enable      => reg_b_enable,
        reg_r_enable      => reg_r_enable,
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
        data_in   => reg_r,
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
                reg_a <= data_out_intermediate;
            end if;
            if reg_b_enable = '1' then
                reg_b <= data_out_intermediate;
            end if;
            if reg_r_enable = '1' then
                reg_r <= alu_result;
            end if;
        end if;
    end process;
    process (reg_a, reg_b)
    begin
        case reg_a is
            when "00000000" => hex0 <= "1000000"; -- 0
            when "00000001" => hex0 <= "1111001"; -- 1
            when "00000010" => hex0 <= "0100100"; -- 2
            when "00000011" => hex0 <= "0110000"; -- 3
            when "00000100" => hex0 <= "0011001"; -- 4
            when "00000101" => hex0 <= "0010010"; -- 5
            when "00000110" => hex0 <= "0000010"; -- 6
            when "00000111" => hex0 <= "1111000"; -- 7
            when "00001000" => hex0 <= "0000000"; -- 8
            when "00001001" => hex0 <= "0010000"; -- 9
            when others => hex0 <= "1111111"; -- Display apagado em caso de erro
        end case;
		  case reg_b is
            when "00000000" => hex1 <= "1000000"; -- 0
            when "00000001" => hex1 <= "1111001"; -- 1
            when "00000010" => hex1 <= "0100100"; -- 2
            when "00000011" => hex1 <= "0110000"; -- 3
            when "00000100" => hex1 <= "0011001"; -- 4
            when "00000101" => hex1 <= "0010010"; -- 5
            when "00000110" => hex1 <= "0000010"; -- 6
            when "00000111" => hex1 <= "1111000"; -- 7
            when "00001000" => hex1 <= "0000000"; -- 8
            when "00001001" => hex1 <= "0010000"; -- 9
            when others => hex1 <= "1111111"; -- Display apagado em caso de erro
        end case;
		  case reg_r is
            when "00000000" => hex2 <= "1000000"; -- 0
            when "00000001" => hex2 <= "1111001"; -- 1
            when "00000010" => hex2 <= "0100100"; -- 2
            when "00000011" => hex2 <= "0110000"; -- 3
            when "00000100" => hex2 <= "0011001"; -- 4
            when "00000101" => hex2 <= "0010010"; -- 5
            when "00000110" => hex2 <= "0000010"; -- 6
            when "00000111" => hex2 <= "1111000"; -- 7
            when "00001000" => hex2 <= "0000000"; -- 8
            when "00001001" => hex2 <= "0010000"; -- 9
            when others => hex2 <= "1111111"; -- Display apagado em caso de erro
        end case;
		  case alu_result is
            when "00000000" => hex3 <= "1000000"; -- 0
            when "00000001" => hex3 <= "1111001"; -- 1
            when "00000010" => hex3 <= "0100100"; -- 2
            when "00000011" => hex3 <= "0110000"; -- 3
            when "00000100" => hex3 <= "0011001"; -- 4
            when "00000101" => hex3 <= "0010010"; -- 5
            when "00000110" => hex3 <= "0000010"; -- 6
            when "00000111" => hex3 <= "1111000"; -- 7
            when "00001000" => hex3 <= "0000000"; -- 8
            when "00001001" => hex3 <= "0010000"; -- 9
            when others => hex3 <= "1111111"; -- Display apagado em caso de erro
        end case;
		  case debugvec is
            when "00000000" => hex4 <= "1000000"; -- 0
            when "00000001" => hex4 <= "1111001"; -- 1
            when "00000010" => hex4 <= "0100100"; -- 2
            when "00000011" => hex4 <= "0110000"; -- 3
            when "00000100" => hex4 <= "0011001"; -- 4
            when "00000101" => hex4 <= "0010010"; -- 5
            when "00000110" => hex4 <= "0000010"; -- 6
            when "00000111" => hex4 <= "1111000"; -- 7
            when "00001000" => hex4 <= "0000000"; -- 8
            when "00001001" => hex4 <= "0010000"; -- 9
            when others => hex4 <= "1111111"; -- Display apagado em caso de erro
        end case;
    end process;

    -- Multiplexador de Saída
    process(output_mux_select, reg_a, reg_b, reg_r, alu_result)
    begin
        case output_mux_select is
            when "00" =>
                data_out <= reg_a;
            when "01" =>
                data_out <= reg_b;
            when "10" =>
                data_out <= reg_r;
            when "11" =>
                data_out <= alu_result;
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
