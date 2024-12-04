library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UnidadeControle is
    Port (
        clk           : in std_logic;
        reset         : in std_logic;
        instrucao     : in std_logic_vector(7 downto 0); -- Instrução completa de 8 bits
        zero_flag     : in std_logic; -- Flag Zero da ULA
        sign_flag     : in std_logic; -- Flag Sign da ULA
        carry_flag    : in std_logic; -- Flag Carry da ULA
        overflow_flag : in std_logic; -- Flag Overflow da ULA
        mem_enable    : out std_logic; -- Enable para memória
        read_enable   : out std_logic; -- Enable para leitura de memória
        write_enable  : out std_logic; -- Enable para escrita na memória
        input_enable  : out std_logic; -- Enable para entrada
        output_enable : out std_logic; -- Enable para saída
		  literal_enable: out std_logic; -- Enable para pegar literal
        pc_enable     : out std_logic; -- Enable para contador de programa
        alu_enable    : out std_logic; -- Enable para ULA
        reg_select_a  : out std_logic_vector(1 downto 0); -- Seleção do primeiro registrador
        reg_select_b  : out std_logic_vector(1 downto 0);  -- Seleção do segundo registrador
		  ula_code      : out std_logic_vector(3 downto 0);
		  mov_enable    : out std_logic;
		  using_pc   	 : out std_logic;
		  load_PC		 : out std_logic;
		  estado_atual_bin  : OUT std_logic_vector(4 downto 0)
    );
end UnidadeControle;

architecture Behavioral of UnidadeControle is
    -- Definindo os estados
    type state_type is (INICIO, ESPERA, BUSCA, ESPERA_PC, DECODIFICA, DECODIFICA_2, EXECUTA, ACESSO_IO, ESCRITA, PEGA_LITERAL, ESPERA_LITERAL,
			               SALTO_ADR, PRE_ACESSO_MEMORIA, ACESSO_MEMORIA, ESPERA_MEMORIA, ESPERA_MEMORIA_2, MOVER, PULANDO, ESPERA_PULO, NAO_PULOU, ESPERA_SAIDA);
    signal estado, proximo_estado : state_type := BUSCA;
    
    signal opcode    : std_logic_vector(3 downto 0); -- OpCode extraído
	 signal opcode_memory    : std_logic_vector(3 downto 0); -- Caso seja necessario pegar literal
    signal reg_select: std_logic_vector(3 downto 0); -- Bits de seleção de registrador
	 signal reg_select_memory: std_logic_vector(3 downto 0); 


begin
    -- Processo de clock e reset
    process(clk, reset)
    begin
        if reset = '0' then
            estado <= BUSCA;
        elsif rising_edge(clk) then
            estado <= proximo_estado;
        end if;
    end process;

    -- Separação do opcode e seleção do registrador
    opcode <= instrucao(7 downto 4);
    reg_select <= instrucao(3 downto 0);

	process (estado)
	begin
	 case estado is
		  when INICIO            => estado_atual_bin <= "00000";
		  when ESPERA            => estado_atual_bin <= "00001";
		  when BUSCA             => estado_atual_bin <= "00010";
		  when ESPERA_PC         => estado_atual_bin <= "00011";
		  when DECODIFICA        => estado_atual_bin <= "00100";
		  when DECODIFICA_2      => estado_atual_bin <= "00101";
		  when EXECUTA           => estado_atual_bin <= "00110";
		  when ACESSO_IO         => estado_atual_bin <= "00111";
		  when ESCRITA           => estado_atual_bin <= "01000";
		  when PEGA_LITERAL      => estado_atual_bin <= "01001";
		  when ESPERA_LITERAL    => estado_atual_bin <= "01010";
		  when SALTO_ADR         => estado_atual_bin <= "01011";
		  when PRE_ACESSO_MEMORIA=> estado_atual_bin <= "01100";
		  when ACESSO_MEMORIA    => estado_atual_bin <= "01101";
		  when ESPERA_MEMORIA    => estado_atual_bin <= "01110";
		  when ESPERA_MEMORIA_2  => estado_atual_bin <= "01111";
		  when MOVER             => estado_atual_bin <= "10000";
		  when PULANDO           => estado_atual_bin <= "10001";
		  when ESPERA_PULO       => estado_atual_bin <= "10010";
		  when NAO_PULOU         => estado_atual_bin <= "10011";
		  when ESPERA_SAIDA      => estado_atual_bin <= "10100";
		  when others            => estado_atual_bin <= "00000";
	 end case;
	end process;
	
    -- Controle de estado e habilitação dos registradores
    process(estado, opcode, reg_select, zero_flag, sign_flag, carry_flag, overflow_flag)
    begin
        -- Valores padrão
		  load_PC <= '0';
        mem_enable <= '0';
        read_enable <= '0';
        write_enable <= '0';
        input_enable <= '0';
        output_enable <= '0';
        pc_enable <= '0';
		  mov_enable <= '0';
        alu_enable <= '0';
		  literal_enable <= '0';
        reg_select_a <= "00"; -- Padrão: seleciona registrador A
        reg_select_b <= "00"; -- Padrão: seleciona registrador A
		  using_pc <= '1';

        case estado is
				--Estado incial, talvez o correto seja deixar a busca como inicial
				when INICIO=>
					 proximo_estado <= DECODIFICA;
					 mem_enable <= '1';
					
            -- Estado de espera
            when ESPERA =>
                if reset = '0' then
                    proximo_estado <= BUSCA;
                else
                    proximo_estado <= ESPERA;
                end if;

            -- Busca a próxima instrução na memória
            when BUSCA =>
                pc_enable <= '1'; -- Incrementa o PC
                proximo_estado <= ESPERA_PC;
				
				when ESPERA_PC =>
					 proximo_estado <= DECODIFICA;
					 mem_enable <= '1';

            -- Decodifica a instrução
            when DECODIFICA =>
					IF reg_select(3 downto 2) = "11" or reg_select(1 downto 0) = "11" THEN
						proximo_estado <= PEGA_LITERAL;
						pc_enable <= '1';
					ELSE
						 -- Decodificação do opcode
						 case opcode is
							  when "0000" => proximo_estado <= EXECUTA; -- ADD
							  when "0001" => proximo_estado <= EXECUTA; -- SUB
							  when "0010" => proximo_estado <= EXECUTA; -- AND
							  when "0011" => proximo_estado <= EXECUTA; -- OR
							  when "0100" => proximo_estado <= EXECUTA; -- NOT
							  when "0101" => proximo_estado <= EXECUTA; -- CMP
							  when "0110" => proximo_estado <= SALTO_ADR; -- JMP
							  when "0111" => proximo_estado <= SALTO_ADR; -- JEQ
							  when "1000" => proximo_estado <= SALTO_ADR; -- JGR
							  when "1001" =>
									proximo_estado <= PRE_ACESSO_MEMORIA; -- LOAD
									using_pc <= '0';
									mem_enable <= '1';
							  when "1010" => 
									proximo_estado <= PRE_ACESSO_MEMORIA; -- STORE
									using_pc <= '0';
									mem_enable <= '1';
							  when "1011" => proximo_estado <= MOVER; -- MOV
							  when "1100" => proximo_estado <= ACESSO_IO; -- IN
							  when "1101" => proximo_estado <= ACESSO_IO; -- OUT
							  when "1110" => proximo_estado <= ESPERA; -- WAIT
							  when others => proximo_estado <= ESPERA;
						 end case;
					
						 -- Decodificação da seleção de registradores
						 case reg_select(3 downto 2) is
							  when "00" => reg_select_a <= "00"; -- Registrador A
							  when "01" => reg_select_a <= "01"; -- Registrador B
							  when "10" => reg_select_a <= "10"; -- Registrador R
							  when "11" => reg_select_a <= "11"; -- Literal
									
							  when others => reg_select_a <= "00";
						 end case;

						 case reg_select(1 downto 0) is
							  when "00" => reg_select_b <= "00"; -- Registrador A
							  when "01" => reg_select_b <= "01"; -- Registrador B
							  when "10" => reg_select_b <= "10"; -- Registrador R
							  when "11" => reg_select_b <= "11"; -- Literal
									
							  when others => reg_select_b <= "00";
						 end case;
					 
					END IF;
					 ula_code <= opcode;
					 reg_select_memory <= reg_select;
					 opcode_memory <= opcode;

            when PEGA_LITERAL =>
					 --pc_enable <= '1';
					 proximo_estado <= ESPERA_LITERAL;
					 --literal_enable <= '1';
					 mem_enable <= '1';
					 
				when ESPERA_LITERAL =>
					 literal_enable <= '1';
					 --mem_enable <= '1';
					 proximo_estado <= DECODIFICA_2;
					 
				-- Decodifica a instrução
            when DECODIFICA_2 =>
					 --literal_enable <= '1';
					 -- Decodificação do opcode
                case opcode_memory is
                    when "0000" => proximo_estado <= EXECUTA; -- ADD
                    when "0001" => proximo_estado <= EXECUTA; -- SUB
                    when "0010" => proximo_estado <= EXECUTA; -- AND
                    when "0011" => proximo_estado <= EXECUTA; -- OR
                    when "0100" => proximo_estado <= EXECUTA; -- NOT
                    when "0101" => proximo_estado <= EXECUTA; -- CMP
						  when "0110" => proximo_estado <= SALTO_ADR; -- JMP
                    when "0111" => proximo_estado <= SALTO_ADR; -- JEQ
						  when "1000" => proximo_estado <= SALTO_ADR; -- JGR
                    when "1001" =>
								proximo_estado <= PRE_ACESSO_MEMORIA; -- LOAD
								using_pc <= '0';
								mem_enable <= '1';
                    when "1010" => 
								proximo_estado <= PRE_ACESSO_MEMORIA; -- STORE
								using_pc <= '0';
								mem_enable <= '1';
                    when "1011" => proximo_estado <= MOVER; -- MOV
                    when "1100" => proximo_estado <= ACESSO_IO; -- IN
                    when "1101" => proximo_estado <= ACESSO_IO; -- OUT
						  when "1110" => proximo_estado <= ESPERA; -- WAIT
                    when others => proximo_estado <= ESPERA;
                end case;
					 
					  -- Decodificação da seleção de registradores
                case reg_select_memory(3 downto 2) is
                    when "00" => reg_select_a <= "00"; -- Registrador A
                    when "01" => reg_select_a <= "01"; -- Registrador B
                    when "10" => reg_select_a <= "10"; -- Registrador R
                    when "11" => reg_select_a <= "11"; -- Literal
                    when others => reg_select_a <= "00";
                end case;

                case reg_select_memory(1 downto 0) is
                    when "00" => reg_select_b <= "00"; -- Registrador A
                    when "01" => reg_select_b <= "01"; -- Registrador B
                    when "10" => reg_select_b <= "10"; -- Registrador R
                    when "11" => reg_select_b <= "11"; -- Literal
                    when others => reg_select_b <= "00";
                end case;
					 ula_code <= opcode_memory;

            -- Executa operações da ULA
            when EXECUTA =>
                alu_enable <= '1'; -- Ativa a ULA
					 
                proximo_estado <= BUSCA;

            -- Acessa a dispositivos de I/O
            when ACESSO_IO =>
					 -- Registrador usado
                reg_select_a <= reg_select_memory(3 downto 2);
					 
                case opcode is
                    when "1100" => -- IN
                        input_enable <= '1';
								proximo_estado <= BUSCA;
                    when "1101" => -- OUT
                        proximo_estado <= ESPERA_SAIDA;
                    when others =>
                        -- Não faz nada
                end case;
                
				--Atraso extra para estabilizar a saida da ula
				when ESPERA_SAIDA =>
					proximo_estado <= BUSCA;
					output_enable <= '1';
					
				when SALTO_ADR =>
					 pc_enable <= '1';
					 proximo_estado <= BUSCA;
					 case opcode is
						  when "0110" => -- JMP (salto incondicional)
								mem_enable <= '1';
								proximo_estado <= PULANDO;
						  when "0111" => -- JEQ (salto condicional se zero_flag = 1)
								if zero_flag = '1' then
									 mem_enable <= '1';
									 proximo_estado <= PULANDO;
								else proximo_estado <= NAO_PULOU;
								end if;
						  when "1000" => -- JGR (salto condicional se sign_flag = 0 e zero_flag = 0)
								if zero_flag = '0' and sign_flag = '0' then
									 mem_enable <= '1';
									 proximo_estado <= PULANDO;
								else proximo_estado <= NAO_PULOU;
								end if;
						  when others =>
								proximo_estado <= BUSCA;
					 end case;
					
				when NAO_PULOU =>
					pc_enable <= '1';
					mem_enable <= '1';
					proximo_estado <= ESPERA_PULO;
					
				when PULANDO =>
					load_PC <= '1';
					mem_enable <= '1';
					pc_enable <= '1';
					proximo_estado <= ESPERA_PULO;
					
				when ESPERA_PULO =>
					proximo_estado <= BUSCA;
					mem_enable <= '1';
				
				when PRE_ACESSO_MEMORIA =>
					 
					 using_pc <= '0';
					 mem_enable <= '1';
					 reg_select_a <= reg_select_memory(3 downto 2); 
					 reg_select_b <= reg_select_memory(1 downto 0); 
					 proximo_estado <= ACESSO_MEMORIA;
				
				when ACESSO_MEMORIA =>
					 using_pc <= '0';
					 mem_enable <= '1';
					 reg_select_a <= reg_select_memory(3 downto 2); 
					 reg_select_b <= reg_select_memory(1 downto 0); 
					 
					 
					 case opcode_memory is
						  when "1001" => -- LOAD (carregar da memória)
								--read_enable <= '1';
						  when "1010" => -- STORE (armazenar na memória)
								write_enable <= '1';
						  when others =>
								-- Não faz nada
					 end case;
					 proximo_estado <= ESPERA_MEMORIA;
					 
				when ESPERA_MEMORIA =>
					reg_select_a <= reg_select_memory(3 downto 2); 
					reg_select_b <= reg_select_memory(1 downto 0); 
					
					using_pc <= '0';
					mem_enable <= '1';
					proximo_estado <= ESPERA_MEMORIA_2;
					
				when ESPERA_MEMORIA_2 =>
					reg_select_a <= reg_select_memory(3 downto 2); 
					reg_select_b <= reg_select_memory(1 downto 0); 
					if opcode_memory = "1001" then
							read_enable <= '1';
					 end if;
					using_pc <= '1';
					mem_enable <= '1';
					proximo_estado <= BUSCA;
            when ESCRITA =>
                write_enable <= '1';
                proximo_estado <= BUSCA;
					 
				when MOVER =>
					 -- MOV: transfere dados entre registradores
					 mov_enable <= '1';
					 reg_select_a <= reg_select_memory(3 downto 2); -- Registrador de destino
					 reg_select_b <= reg_select_memory(1 downto 0); -- Registrador de origem
					 proximo_estado <= BUSCA;

            when others =>
                proximo_estado <= ESPERA;
        end case;
    end process;

end Behavioral; 