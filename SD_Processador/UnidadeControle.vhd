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
		  ula_code      : out std_logic_vector(3 downto 0)
    );
end UnidadeControle;

architecture Behavioral of UnidadeControle is
    -- Definindo os estados
    type state_type is (INICIO, ESPERA, BUSCA, BUSCA_2, DECODIFICA, DECODIFICA_2, EXECUTA, ACESSO_IO, ESCRITA, PEGA_LITERAL, ESPERA_LITERAL);
    signal estado, proximo_estado : state_type;
    
    signal opcode    : std_logic_vector(3 downto 0); -- OpCode extraído
	 signal opcode_memory    : std_logic_vector(3 downto 0); -- Caso seja necessario pegar literal
    signal reg_select: std_logic_vector(3 downto 0); -- Bits de seleção de registrador
	 signal reg_select_memory: std_logic_vector(3 downto 0); 

begin
    -- Processo de clock e reset
    process(clk, reset)
    begin
        if reset = '0' then
            estado <= ESPERA;
        elsif rising_edge(clk) then
            estado <= proximo_estado;
        end if;
    end process;

    -- Separação do opcode e seleção do registrador
    opcode <= instrucao(7 downto 4);
    reg_select <= instrucao(3 downto 0);

    -- Controle de estado e habilitação dos registradores
    process(estado, opcode, reg_select, zero_flag, sign_flag, carry_flag, overflow_flag)
    begin
        -- Valores padrão
        mem_enable <= '0';
        read_enable <= '0';
        write_enable <= '0';
        input_enable <= '0';
        output_enable <= '0';
        pc_enable <= '0';
        alu_enable <= '0';
		  literal_enable <= '0';
        reg_select_a <= "00"; -- Padrão: seleciona registrador A
        reg_select_b <= "00"; -- Padrão: seleciona registrador A

        case estado is
				--Estado incial
				when INICIO=>
					 proximo_estado <= DECODIFICA;
					
            -- Estado de espera
            when ESPERA =>
                if reset = '1' then
                    proximo_estado <= BUSCA;
                else
                    proximo_estado <= ESPERA;
                end if;

            -- Busca a próxima instrução na memória
            when BUSCA =>
                pc_enable <= '1'; -- Incrementa o PC
                proximo_estado <= DECODIFICA;

            -- Decodifica a instrução
            when DECODIFICA =>
					 -- Decodificação do opcode
                case opcode is
                    when "0000" => proximo_estado <= EXECUTA; -- ADD
                    when "0001" => proximo_estado <= EXECUTA; -- SUB
                    when "0010" => proximo_estado <= EXECUTA; -- AND
                    when "0011" => proximo_estado <= EXECUTA; -- OR
                    when "0100" => proximo_estado <= EXECUTA; -- NOT
                    when "1001" => proximo_estado <= ACESSO_IO; -- IN
                    when "1010" => proximo_estado <= ACESSO_IO; -- OUT
                    when others => proximo_estado <= BUSCA;
                end case;
				
                -- Decodificação da seleção de registradores
                case reg_select(1 downto 0) is
                    when "00" => reg_select_a <= "00"; -- Registrador A
                    when "01" => reg_select_a <= "01"; -- Registrador B
                    when "10" => reg_select_a <= "10"; -- Registrador R
                    when "11" => 
								reg_select_a <= "11"; -- Literal
								opcode_memory <= opcode;
								reg_select_memory <= reg_select;
								proximo_estado <= PEGA_LITERAL;
								--pc_enable <= '1';
                    when others => reg_select_a <= "00";
                end case;

                case reg_select(3 downto 2) is
                    when "00" => reg_select_b <= "00"; -- Registrador A
                    when "01" => reg_select_b <= "01"; -- Registrador B
                    when "10" => reg_select_b <= "10"; -- Registrador R
                    when "11" => 
								opcode_memory <= opcode;
								reg_select_b <= "11"; -- Literal
								reg_select_memory <= reg_select;
								proximo_estado <= PEGA_LITERAL;
								--pc_enable <= '1';
                    when others => reg_select_b <= "00";
                end case;
					 ula_code <= opcode;

            when PEGA_LITERAL =>
					 pc_enable <= '1';
					 proximo_estado <= ESPERA_LITERAL;
					 --literal_enable <= '1';
					 
				when ESPERA_LITERAL =>
					 literal_enable <= '1';
					 proximo_estado <= DECODIFICA_2;
					 
				-- Decodifica a instrução
            when DECODIFICA_2 =>
					 -- Decodificação do opcode
                case opcode_memory is
                    when "0000" => proximo_estado <= EXECUTA; -- ADD
                    when "0001" => proximo_estado <= EXECUTA; -- SUB
                    when "0010" => proximo_estado <= EXECUTA; -- AND
                    when "0011" => proximo_estado <= EXECUTA; -- OR
                    when "0100" => proximo_estado <= EXECUTA; -- NOT
                    when "1001" => proximo_estado <= ACESSO_IO; -- IN
                    when "1010" => proximo_estado <= ACESSO_IO; -- OUT
                    when others => proximo_estado <= BUSCA;
                end case;
					 
					  -- Decodificação da seleção de registradores
                case reg_select_memory(1 downto 0) is
                    when "00" => reg_select_a <= "00"; -- Registrador A
                    when "01" => reg_select_a <= "01"; -- Registrador B
                    when "10" => reg_select_a <= "10"; -- Registrador R
                    when "11" => reg_select_a <= "11"; -- Literal
                    when others => reg_select_a <= "00";
                end case;

                case reg_select_memory(3 downto 2) is
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

            -- Acessa memória ou dispositivos de I/O
            when ACESSO_IO =>
					 -- Decodificação da seleção de registradores
                case reg_select(1 downto 0) is
                    when "00" => reg_select_a <= "00"; -- Registrador A
                    when "01" => reg_select_a <= "01"; -- Registrador B
                    when "10" => reg_select_a <= "10"; -- Registrador R
                    when "11" => reg_select_a <= "11"; -- Literal
                    when others => reg_select_a <= "00";
                end case;
					 
                case opcode is
                    when "1001" => -- IN
                        input_enable <= '1';
                    when "1010" => -- OUT
                        output_enable <= '1';
                    when others =>
                        -- Não faz nada
                end case;
                proximo_estado <= BUSCA;

            -- Estado de escrita, se necessário
            when ESCRITA =>
                write_enable <= '1';
                proximo_estado <= BUSCA;

            when others =>
                proximo_estado <= ESPERA;
        end case;
    end process;

end Behavioral;