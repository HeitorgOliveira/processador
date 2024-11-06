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
        reg_b_enable  : out std_logic  -- Enable específico para registrador B
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
        if reset = '1' then
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

        case estado is
            when ESPERA =>
                if reset = '0' then
                    proximo_estado <= BUSCA;
                else
                    proximo_estado <= ESPERA;
                end if;

            when BUSCA =>
                pc_enable <= '1'; -- Incrementa o PC para próxima instrução
                proximo_estado <= DECODIFICA;

            when DECODIFICA =>
                case opcode is
                    when "0000" => proximo_estado <= EXECUTA; -- ADD
                    when "0001" => proximo_estado <= EXECUTA; -- SUB
                    when "0010" => proximo_estado <= EXECUTA; -- AND
                    when "0011" => proximo_estado <= EXECUTA; -- OR
                    when "0100" => proximo_estado <= EXECUTA; -- NOT
                    when "0101" => proximo_estado <= EXECUTA; -- CMP
                    when "0110" => proximo_estado <= ACESSO_MEMORIA; -- JMP
                    when "0111" => -- JEQ (salta se Zero flag = 1)
                        if zero_flag = '1' then
                            proximo_estado <= ACESSO_MEMORIA;
                        else
                            proximo_estado <= BUSCA;
                        end if;
                    when "1000" => -- JGR (salta se Sign = 0 e Zero = 0)
                        if sign_flag = '0' and zero_flag = '0' then
                            proximo_estado <= ACESSO_MEMORIA;
                        else
                            proximo_estado <= BUSCA;
                        end if;
                    when others => proximo_estado <= BUSCA;
                end case;

            when EXECUTA =>
                alu_enable <= '1'; -- Ativa ULA

                -- Define o uso dos registradores com base nos bits de reg_select
                case reg_select is
                    when "0000" =>
                        reg_a_enable <= '1'; -- Usa apenas A
                    when "0001" =>
                        reg_b_enable <= '1'; -- Usa apenas B
                    when "0010" =>
                        reg_a_enable <= '1'; -- Usa A e B
                        reg_b_enable <= '1';
                    when "0011" =>
                        reg_a_enable <= '1'; -- Usa A e R (resultado, supondo um registrador R adicional)
                    when others =>
                        reg_a_enable <= '0';
                        reg_b_enable <= '0';
                end case;

                proximo_estado <= ESCRITA;

            when ACESSO_MEMORIA =>
                if opcode = "0110" or opcode = "0111" or opcode = "1000" then -- Saltos
                    pc_enable <= '1';
                end if;
                proximo_estado <= BUSCA;

            when ESCRITA =>
                output_enable <= '1'; -- Ativa saída para LEDs
                proximo_estado <= BUSCA;

            when others =>
                proximo_estado <= ESPERA;
        end case;
    end process;
end Behavioral;
