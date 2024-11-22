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
        pc_enable     : out std_logic; -- Enable para contador de programa
        alu_enable    : out std_logic; -- Enable para ULA
        reg_a_enable  : out std_logic; -- Enable específico para registrador A
        reg_b_enable  : out std_logic; -- Enable específico para registrador B
        reg_r_enable  : out std_logic; -- Enable específico para registrador de resultado (R)
        output_mux_select : out std_logic_vector(1 downto 0) -- Seleção de saída
    );
end UnidadeControle;

architecture Behavioral of UnidadeControle is
    -- Definindo os estados
    type state_type is (ESPERA, BUSCA, DECODIFICA, EXECUTA, ACESSO_MEMORIA, ESCRITA);
    signal estado, proximo_estado : state_type;
    
    signal opcode    : std_logic_vector(3 downto 0); -- OpCode extraído
    signal reg_select: std_logic_vector(3 downto 0); -- Bits de seleção de registrador

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
        reg_a_enable <= '0';
        reg_b_enable <= '0';
        reg_r_enable <= '0';
        output_mux_select <= "00";

        case estado is
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
                case opcode is
                    when "0000" => proximo_estado <= EXECUTA; -- ADD
                    when "0001" => proximo_estado <= EXECUTA; -- SUB
                    when "0010" => proximo_estado <= EXECUTA; -- AND
                    when "0011" => proximo_estado <= EXECUTA; -- OR
                    when "0100" => proximo_estado <= EXECUTA; -- NOT
                    when "1001" => proximo_estado <= ACESSO_MEMORIA; -- IN
                    when "1010" => proximo_estado <= ACESSO_MEMORIA; -- OUT
                    when others => proximo_estado <= BUSCA;
                end case;

            -- Executa operações da ULA
            when EXECUTA =>
                alu_enable <= '1'; -- Ativa a ULA
                reg_r_enable <= '1'; -- Habilita o registrador de resultado
                output_mux_select <= "11"; -- Saída direta da ULA
                proximo_estado <= BUSCA;

            -- Acessa memória ou dispositivos de I/O
            when ACESSO_MEMORIA =>
                case opcode is
                    when "1001" => -- IN
                        input_enable <= '1';
                        reg_a_enable <= '1'; -- Carrega no registrador A
                        output_mux_select <= "00"; -- Saída do registrador A
                    when "1010" => -- OUT
                        output_enable <= '1';
                        output_mux_select <= "10"; -- Seleciona o registrador R como saída
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
