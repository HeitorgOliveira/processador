LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY registrador IS
GENERIC (N: integer := 8);
PORT (
	d: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	clk, reset, enable: IN STD_LOGIC;
	q: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END registrador;

ARCHITECTURE behave OF registrador IS
BEGIN

	PROCESS (clk, reset)
	BEGIN
		IF reset = '0' THEN
			q <= (OTHERS => '0');
		ELSIF clk'EVENT AND clk = '1' THEN
			IF enable = '1' THEN
				q <= d;
			END IF;
		END IF;
	END PROCESS;
END behave;