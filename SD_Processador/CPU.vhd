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
		  hex5          : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        debug1        : OUT STD_LOGIC;
		  zero          : OUT STD_LOGIC;
		  sign          : OUT STD_LOGIC
    );
END CPU;

ARCHITECTURE Behavioral OF CPU IS
    -- Sinais internos
    SIGNAL pc_out, instrucao : std_logic_vector(7 DOWNTO 0);
    SIGNAL data_in, data_out, alu_result : std_logic_vector(7 DOWNTO 0);
    SIGNAL zero_flag, sign_flag, carry_flag, overflow_flag : std_logic;
	 SIGNAL zero_flag_aux, sign_flag_aux, carry_flag_aux, overflow_flag_aux : std_logic;
    SIGNAL mem_enable, read_enable, write_enable, mov_enable, using_pc, load_PC : std_logic;
    SIGNAL input_enable, output_enable, pc_enable, alu_enable, literal_enable : std_logic;
    SIGNAL reg_a_enable, reg_b_enable, reg_r_enable : std_logic;
    SIGNAL reg_a, reg_b, reg_r, reg_literal : std_logic_vector(7 DOWNTO 0) := "00000000";
	 SIGNAL reg_inter_1, reg_inter_2 : std_logic_vector(7 DOWNTO 0);
    SIGNAL output_mux_select : std_logic_vector(1 DOWNTO 0);
    SIGNAL data_out_intermediate : std_logic_vector(7 DOWNTO 0);
	 SIGNAL ula_code : std_logic_vector(3 DOWNTO 0);
    SIGNAL debugvec : std_logic_vector(7 DOWNTO 0);
	 SIGNAL in_reg : std_logic_vector(7 DOWNTO 0);
    
    -- Sinais para seleção de registradores
    SIGNAL reg_select_a, reg_select_b : std_logic_vector(1 DOWNTO 0);
	 
	 -- Sinais auxiliares para endereços e dados
	 SIGNAL mem_address : std_logic_vector(7 DOWNTO 0);


BEGIN

	-- Instância do Program Counter (PC)
	PC : ENTITY work.program_counter PORT MAP (
	  clock       => clock,
	  reset       => reset,
	  enable      => pc_enable,       
	  load        => load_PC,             
	  new_address => instrucao, 
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
	  literal_enable	  => literal_enable,
	  reg_select_a      => reg_select_a,    -- Novo sinal para seleção do registrador A
	  reg_select_b      => reg_select_b,     -- Novo sinal para seleção do registrador B
	  ula_code 			  => ula_code,
	  mov_enable 		  => mov_enable,
	  using_pc			  => using_pc,
	  load_PC			  => load_PC
	);

	-- Processo de seleção de registradores para a ULA
	PROCESS(reg_select_a, reg_select_b, reg_a, reg_b, reg_r, reg_literal, in_reg, reset, clock)
	BEGIN
	  if reset = '0' then
			reg_a <= (others => '0');
			reg_b <= (others => '0');
			reg_r <= (others => '0');
			reg_literal <= (others => '0');
			mem_address <= (OTHERS => '0');
	  elsif rising_edge(clock) then
		  -- Seleção do primeiro operando (A)
		  CASE reg_select_a IS
				WHEN "00" => 
					 reg_inter_1 <= reg_a;
				WHEN "01" => 
					 reg_inter_1 <= reg_b;
				WHEN "10" => 
					 reg_inter_1 <= reg_r;
				WHEN "11" => 
					 reg_inter_1 <= reg_literal;
				WHEN OTHERS => 
					 reg_inter_1 <= (OTHERS => '0');
		  END CASE;
		  
		  -- Seleção do segundo operando (B)
		  CASE reg_select_b IS
				WHEN "00" => 
					 reg_inter_2 <= reg_a;
				WHEN "01" => 
					 reg_inter_2 <= reg_b;
				WHEN "10" => 
					 reg_inter_2 <= reg_r;
				WHEN "11" => 
					 reg_inter_2 <= reg_literal;
				WHEN OTHERS => 
					 reg_inter_2 <= (OTHERS => '0');
			END CASE;
			
			IF literal_enable = '1' THEN
				reg_literal <= instrucao;
			END IF;
			
			IF alu_enable = '1' THEN
				zero_flag <= zero_flag_aux;
				sign_flag <= sign_flag_aux;
				carry_flag <= carry_flag_aux;
				overflow_flag <= overflow_flag_aux;
				
				IF ula_code /= "0101" THEN
					reg_r <= alu_result;
				END IF;
			END IF;
			
			--Para caso do input
			IF input_enable = '1' THEN
				CASE reg_select_a IS
					WHEN "00" => 
						 reg_a <= in_reg;
					WHEN "01" => 
						 reg_b <= in_reg;
					WHEN "10" => 
						 reg_r <= in_reg;
					WHEN "11" => 
						 reg_a <= in_reg;
					WHEN OTHERS => 
						 reg_a <= (OTHERS => '0');
				END CASE;
			END IF;
					 
			-- Para operações que dependem de memória
			IF mem_enable = '1' THEN
				-- Se o acesso for controlado pelo PC
				IF using_pc = '1' THEN
					 mem_address <= pc_out;
				ELSE
					 -- Se o acesso for baseado no registrador
					 mem_address <= reg_inter_2; 
				END IF;

				-- Operações de leitura/escrita
				IF read_enable = '1' THEN
					 CASE reg_select_a IS
						  WHEN "00" => reg_a <= instrucao; -- Registrador A
						  WHEN "01" => reg_b <= instrucao; -- Registrador B
						  WHEN "10" => reg_r <= instrucao; -- Registrador R
						  WHEN "11" => reg_literal <= instrucao;
						  WHEN OTHERS => NULL;
					 END CASE;
				END IF;
				
				
			END IF;
			
			-- Para mover o valor de uma variavel a outra
			IF mov_enable = '1' THEN
				CASE reg_select_a IS
					  WHEN "00" => reg_a <= reg_inter_2 ; -- Registrador A
					  WHEN "01" => reg_b <= reg_inter_2 ; -- Registrador B
					  WHEN "10" => reg_r <= reg_inter_2 ; -- Registrador R
					  WHEN "11" => reg_literal <= reg_inter_2 ;
					  WHEN OTHERS => NULL;
				 END CASE;
			END IF;
		end if;
	END PROCESS;

	-- Instância da Memória
	Memoria : ENTITY work.memoria_unidade PORT MAP (
		 clock     => clock,
		 data_in   => reg_inter_1,
		 rdaddress => mem_address,
		 wraddress => mem_address,
		 wren      => write_enable,
		 data_out  => instrucao
	);
	
	-- Instância da ULA (ALU)
	ULA : ENTITY work.ULA PORT MAP (
	  A        => reg_inter_1,
	  B        => reg_inter_2,
	  opcode   => ula_code,
	  result   => alu_result,
	  Zero     => zero_flag_aux,
	  Sign     => sign_flag_aux,
	  Carry    => carry_flag_aux,
	  Overflow => overflow_flag_aux
	  --result_enable => result_enable
	);

	PROCESS(zero_flag, sign_flag)
	BEGIN
		zero <= zero_flag;
		sign <= sign_flag;
	END PROCESS;
	

	-- Instância da Unidade de Entrada
	Entrada : ENTITY work.Input_Unit PORT MAP (
	  switches      => switches,
	  data_out      => in_reg,
	  input_enable  => input_enable
	);

	-- Unidade de Saída
	Saida : ENTITY work.Output_Unit PORT MAP (
	  data_in       => reg_inter_1,
	  leds          => leds,
	  output_enable => output_enable,
	  clock         => clock,
	  reset			 => reset
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
	  value_in => mem_address(3 DOWNTO 0),
	  hex_out  => hex3
	);

	HEX4_Driver : ENTITY work.DisplayDriver PORT MAP (
	  value_in => reg_literal(3 DOWNTO 0),
	  hex_out  => hex4
	);

	HEX5_Driver : ENTITY work.DisplayDriver PORT MAP (
	  value_in => debugvec(3 DOWNTO 0),
	  hex_out  => hex5
	);
	 
END Behavioral;
    