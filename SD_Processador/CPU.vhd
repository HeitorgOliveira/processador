library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CPU is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        data_out : out std_logic_vector(7 downto 0); -- Dados a serem escritos na memória
        memoria_enable : out std_logic;               -- Habilita a memória
        flags : out std_logic_vector(3 downto 0)      -- Flags da ULA
    );
end CPU;

architecture Behavioral of CPU is
    signal PC : std_logic_vector(7 downto 0);
    signal IR : std_logic_vector(7 downto 0);
    signal reg1, reg2 : std_logic_vector(7 downto 0);
    signal opCode : std_logic_vector(3 downto 0);
    signal resultado : std_logic_vector(7 downto 0);
    signal zero_flag, sign_flag, carry_flag, overflow_flag : std_logic;
    signal pc_enable : std_logic; -- Declaração do sinal pc_enable

    -- Instância da ROM
    component ROM
        Port (
            addr : in std_logic_vector(7 downto 0);
            data : out std_logic_vector(7 downto 0)
        );
    end component;

    component Decodificador
        Port (
            IR : in std_logic_vector(7 downto 0);
            clk : in std_logic;
            reset : in std_logic;
            reg1 : out std_logic_vector(7 downto 0);
            reg2 : out std_logic_vector(7 downto 0);
            opCode : out std_logic_vector(3 downto 0)
        );
    end component;

    component ULA
        Port (
            A : in std_logic_vector(7 downto 0);
            B : in std_logic_vector(7 downto 0);
            opcode : in std_logic_vector(3 downto 0);
            result : out std_logic_vector(7 downto 0);
            Zero : out std_logic;
            Sign : out std_logic;
            Carry : out std_logic;
            Overflow : out std_logic
        );
    end component;

    component UnidadeControle
        Port (
            opcode : in std_logic_vector(3 downto 0);
            clk : in std_logic;
            reset : in std_logic;
            zero_flag : in std_logic;
            sign_flag : in std_logic;
            carry_flag : in std_logic;
            overflow_flag : in std_logic;
            mem_enable : out std_logic;
            pc_enable : out std_logic; -- Declaração da saída pc_enable na Unidade de Controle
            alu_enable : out std_logic
        );
    end component;

    signal instrucao : std_logic_vector(7 downto 0);

begin
    -- Instância da ROM conectada ao PC
    rom_inst : ROM
        port map (
            addr => PC,
            data => instrucao
        );

    -- Processamento do PC e busca de instruções
    process(clk, reset)
    begin
        if reset = '1' then
            PC <= (others => '0');
        elsif rising_edge(clk) then
            if pc_enable = '1' then
                IR <= instrucao;       -- Carrega a instrução atual do ROM
                PC <= PC + 1;          -- Incrementa o Program Counter
            end if;
        end if;
    end process;

    -- Instância do Decodificador
    decodificador_inst : Decodificador
        port map (
            IR => IR,
            clk => clk,
            reset => reset,
            reg1 => reg1,
            reg2 => reg2,
            opCode => opCode
        );

    -- Instância da ULA
    ula_inst : ULA
        port map (
            A => reg1,
            B => reg2,
            opcode => opCode,
            result => resultado,
            Zero => zero_flag,
            Sign => sign_flag,
            Carry => carry_flag,
            Overflow => overflow_flag
        );

    -- Instância da Unidade de Controle
    unidade_controle_inst : UnidadeControle
        port map (
            opcode => opCode,
            clk => clk,
            reset => reset,
            zero_flag => zero_flag,
            sign_flag => sign_flag,
            carry_flag => carry_flag,
            overflow_flag => overflow_flag,
            mem_enable => memoria_enable,
            pc_enable => pc_enable,      -- Conecta pc_enable na Unidade de Controle
            alu_enable => open           -- Se não utilizado, pode ser desconectado com "open"
        );

    -- Conectando as flags da ULA à saída da CPU
    flags <= zero_flag & sign_flag & carry_flag & overflow_flag;

end Behavioral;
