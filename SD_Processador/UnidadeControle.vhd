library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UnidadeControle is
    Port (
        clk         : in std_logic;
        reset       : in std_logic;
        opcode      : in std_logic_vector(3 downto 0); -- OpCode de 4 bits
        zero_flag   : in std_logic; -- Flag Zero da ULA
        sign_flag   : in std_logic; -- Flag Sign da ULA
        carry_flag  : in std_logic; -- Flag Carry da ULA
        overflow_flag: in std_logic; -- Flag Overflow da ULA
        mem_enable  : out std_logic; -- Enable que é necessário para operar com a memória
        read_enable : out std_logic; -- Enable de leitura da memória
        write_enable: out std_logic; -- Enable de escrita na memória
        input_enable: out std_logic; -- Enable para que as entradas mudem
        output_enable: out std_logic; -- Enable para que a saída mude
        pc_enable   : out std_logic; -- Enable que possibilita mudar a operação
        alu_enable  : out std_logic; -- Enable que habilita a ULA
        reg_a_enable: out std_logic; -- Enable específico do registrador A
        reg_b_enable: out std_logic -- Enable específico do registrador B
    );
end UnidadeControle;

architecture Behavioral of UnidadeControle is
    -- Definindo os estados em português
    type state_type is (ESPERA, BUSCA, DECODIFICA, EXECUTA, ACESSO_MEMORIA, ESCRITA);
    signal estado, proximo_estado : state_type;

begin
    -- Processo para mudar de estado no clock
    process(clk, reset)
    begin
        if reset = '1' then
            estado <= ESPERA;
        elsif rising_edge(clk) then
            estado <= proximo_estado;
        end if;
    end process;

    -- Processo para controlar as saídas e transições de estados
    process(estado, opcode, zero_flag, sign_flag, carry_flag, overflow_flag)
    begin
        -- Valores padrão para evitar latches
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
                pc_enable <= '1'; -- Ativa o contador de programa para buscar a próxima instrução
                proximo_estado <= DECODIFICA;

            when DECODIFICA =>
                case opcode is
                    when "0000" => -- ADD
                        proximo_estado <= EXECUTA;
                    when "0001" => -- SUB
                        proximo_estado <= EXECUTA;
                    when "0010" => -- AND
                        proximo_estado <= EXECUTA;
                    when "0011" => -- OR
                        proximo_estado <= EXECUTA;
                    when "0100" => -- NOT
                        proximo_estado <= EXECUTA;
                    when "0101" => -- CMP
                        proximo_estado <= EXECUTA;
                    when "0110" => -- JMP
                        proximo_estado <= ACESSO_MEMORIA;
                    when "0111" => -- JEQ (salta se Zero flag = 1)
                        if zero_flag = '1' then
                            proximo_estado <= ACESSO_MEMORIA;
                        else
                            proximo_estado <= BUSCA;
                        end if;
                    when "1000" => -- JGR (salta se resultado for maior, sign_flag = 0 e zero_flag = 0)
                        if sign_flag = '0' and zero_flag = '0' then
                            proximo_estado <= ACESSO_MEMORIA;
                        else
                            proximo_estado <= BUSCA;
                        end if;
                    when others =>
                        proximo_estado <= BUSCA;
                end case;

            when EXECUTA =>
                alu_enable <= '1'; -- Habilita a operação da ALU
                reg_a_enable <= '1'; -- Ativa o registrador A para operações aritméticas
                reg_b_enable <= '1'; -- Ativa o registrador B para operações aritméticas
                proximo_estado <= ESCRITA;

            when ACESSO_MEMORIA =>
                if opcode = "0110" or opcode = "0111" or opcode = "1000" then -- Instruções de salto
                    pc_enable <= '1';
                end if;
                proximo_estado <= BUSCA;

            when ESCRITA =>
                output_enable <= '1'; -- Habilita a saída nos LEDs
                proximo_estado <= BUSCA;

            when others =>
                proximo_estado <= ESPERA;
        end case;
    end process;
end Behavioral;
