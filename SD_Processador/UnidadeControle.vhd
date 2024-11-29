library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity UnidadeControle is
    Port (
        clk, reset       : in std_logic;
        instrucao        : in std_logic_vector(7 downto 0);
        zero_flag, sign_flag, carry_flag, overflow_flag : in std_logic;
        mem_enable, read_enable, write_enable : out std_logic;
        input_enable, output_enable, literal_enable : out std_logic;
        pc_enable, alu_enable : out std_logic;
        reg_select_a, reg_select_b : out std_logic_vector(1 downto 0);
        ula_code : out std_logic_vector(3 downto 0)
    );
end UnidadeControle;
architecture Behavioral of UnidadeControle is
    type state_type is (INICIO, BUSCA, DECODIFICA, EXECUTA, ACESSO_IO, PEGA_LITERAL);
    signal estado, proximo_estado : state_type := INICIO;

    signal opcode, opcode_stored : std_logic_vector(3 downto 0);
    signal reg_select, reg_select_stored : std_logic_vector(3 downto 0);
begin
    estado_process: process(clk, reset)
    begin
        if reset = '0' then
            estado <= INICIO;
        elsif rising_edge(clk) then
            estado <= proximo_estado;
        end if;
    end process;
    controle_process: process(estado, opcode, reg_select)
    begin
        -- Valores padrão
        mem_enable <= '0'; read_enable <= '0'; write_enable <= '0';
        input_enable <= '0'; output_enable <= '0';
        pc_enable <= '0'; alu_enable <= '0'; literal_enable <= '0';
        reg_select_a <= "00"; reg_select_b <= "00";
        case estado is
            when INICIO =>
                proximo_estado <= BUSCA;
            when BUSCA =>
                pc_enable <= '1';
                opcode <= instrucao(7 downto 4);
                reg_select <= instrucao(3 downto 0);
                     if reg_select(1 downto 0) = "11" or reg_select(3 downto 2) = "11" then
                         opcode_stored <= opcode;
                         reg_select_stored <= reg_select;
                         proximo_estado <= PEGA_LITERAL;
                         pc_enable <= '1';
                     else
                         proximo_estado <= DECODIFICA;
                     end if;
            when DECODIFICA =>
                     case reg_select(1 downto 0) is
                          when "00" => reg_select_a <= "00";
                          when "01" => reg_select_a <= "01";
                          when "10" => reg_select_a <= "10";
                          when "11" => reg_select_a <= "11";
                     end case;
                     case reg_select(3 downto 2) is
                          when "00" => reg_select_b <= "00";
                          when "01" => reg_select_b <= "01";
                          when "10" => reg_select_b <= "10";
                          when "11" => reg_select_b <= "11";
                     end case;

                case opcode is
                    when "0000" | "0001" | "0010" | "0011" | "0100" => 
                        proximo_estado <= EXECUTA;
                    when "1001" | "1010" => 
                        proximo_estado <= ACESSO_IO;
                    when others => 
                        proximo_estado <= BUSCA;
                end case;
                ula_code <= opcode;
            when PEGA_LITERAL =>
                literal_enable <= '1';
                proximo_estado <= DECODIFICA;
            when EXECUTA =>
                alu_enable <= '1';
                proximo_estado <= BUSCA;
            when ACESSO_IO =>
                case opcode is
                    when "1001" => input_enable <= '1';
                    when "1010" => output_enable <= '1';
                    when others => null;
                end case;
                proximo_estado <= BUSCA;
            when others => 
                proximo_estado <= BUSCA;
        end case;
    end process;
end Behavioral;