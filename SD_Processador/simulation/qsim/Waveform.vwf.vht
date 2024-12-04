-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/04/2024 17:11:46"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          CPU
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY CPU_vhd_vec_tst IS
END CPU_vhd_vec_tst;
ARCHITECTURE CPU_arch OF CPU_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL carry : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL debug1 : STD_LOGIC;
SIGNAL estado_atual : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL hex0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL hex1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL hex2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL hex3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL hex4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL hex5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL leds : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL overflow : STD_LOGIC;
SIGNAL reg_a_saida : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reg_b_saida : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reg_r_saida : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL sign : STD_LOGIC;
SIGNAL switches : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL zero : STD_LOGIC;
COMPONENT CPU
	PORT (
	carry : OUT STD_LOGIC;
	clock : IN STD_LOGIC;
	debug1 : OUT STD_LOGIC;
	estado_atual : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	hex0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	hex1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	hex2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	hex3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	hex4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	hex5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	leds : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	overflow : OUT STD_LOGIC;
	reg_a_saida : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	reg_b_saida : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	reg_r_saida : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	reset : IN STD_LOGIC;
	sign : OUT STD_LOGIC;
	switches : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	zero : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : CPU
	PORT MAP (
-- list connections between master ports and signals
	carry => carry,
	clock => clock,
	debug1 => debug1,
	estado_atual => estado_atual,
	hex0 => hex0,
	hex1 => hex1,
	hex2 => hex2,
	hex3 => hex3,
	hex4 => hex4,
	hex5 => hex5,
	leds => leds,
	overflow => overflow,
	reg_a_saida => reg_a_saida,
	reg_b_saida => reg_b_saida,
	reg_r_saida => reg_r_saida,
	reset => reset,
	sign => sign,
	switches => switches,
	zero => zero
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 2000 ps;
	clock <= '1';
	WAIT FOR 2000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;
-- switches[7]
t_prcs_switches_7: PROCESS
BEGIN
	switches(7) <= '0';
WAIT;
END PROCESS t_prcs_switches_7;
-- switches[6]
t_prcs_switches_6: PROCESS
BEGIN
	switches(6) <= '0';
WAIT;
END PROCESS t_prcs_switches_6;
-- switches[5]
t_prcs_switches_5: PROCESS
BEGIN
	switches(5) <= '0';
WAIT;
END PROCESS t_prcs_switches_5;
-- switches[4]
t_prcs_switches_4: PROCESS
BEGIN
	switches(4) <= '0';
WAIT;
END PROCESS t_prcs_switches_4;
-- switches[3]
t_prcs_switches_3: PROCESS
BEGIN
	switches(3) <= '0';
WAIT;
END PROCESS t_prcs_switches_3;
-- switches[2]
t_prcs_switches_2: PROCESS
BEGIN
	switches(2) <= '0';
WAIT;
END PROCESS t_prcs_switches_2;
-- switches[1]
t_prcs_switches_1: PROCESS
BEGIN
	switches(1) <= '1';
	WAIT FOR 20000 ps;
	switches(1) <= '0';
WAIT;
END PROCESS t_prcs_switches_1;
-- switches[0]
t_prcs_switches_0: PROCESS
BEGIN
	switches(0) <= '1';
WAIT;
END PROCESS t_prcs_switches_0;
END CPU_arch;
