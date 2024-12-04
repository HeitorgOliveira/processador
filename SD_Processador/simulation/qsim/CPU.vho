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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"

-- DATE "12/04/2024 17:11:47"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CPU IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	switches : IN std_logic_vector(7 DOWNTO 0);
	leds : OUT std_logic_vector(7 DOWNTO 0);
	hex0 : OUT std_logic_vector(6 DOWNTO 0);
	hex1 : OUT std_logic_vector(6 DOWNTO 0);
	hex2 : OUT std_logic_vector(6 DOWNTO 0);
	hex3 : OUT std_logic_vector(6 DOWNTO 0);
	hex4 : OUT std_logic_vector(6 DOWNTO 0);
	hex5 : OUT std_logic_vector(6 DOWNTO 0);
	debug1 : OUT std_logic;
	reg_a_saida : OUT std_logic_vector(7 DOWNTO 0);
	reg_b_saida : OUT std_logic_vector(7 DOWNTO 0);
	reg_r_saida : OUT std_logic_vector(7 DOWNTO 0);
	zero : OUT std_logic;
	sign : OUT std_logic;
	overflow : OUT std_logic;
	carry : OUT std_logic;
	estado_atual : OUT std_logic_vector(4 DOWNTO 0)
	);
END CPU;

-- Design Ports Information
-- leds[0]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[1]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[2]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[3]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[4]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[5]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[6]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[7]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[0]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[1]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[2]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[3]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[4]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[5]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[6]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[0]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[1]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[2]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[3]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[4]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[5]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[6]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[0]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[1]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[2]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[3]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[4]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[5]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[6]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex3[0]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex3[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex3[2]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex3[3]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex3[4]	=>  Location: PIN_U17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex3[5]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex3[6]	=>  Location: PIN_V19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex4[0]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex4[1]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex4[2]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex4[3]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex4[4]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex4[5]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex4[6]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[0]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[1]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[2]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[3]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[4]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[5]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[6]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- debug1	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_a_saida[0]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_a_saida[1]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_a_saida[2]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_a_saida[3]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_a_saida[4]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_a_saida[5]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_a_saida[6]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_a_saida[7]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_saida[0]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_saida[1]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_saida[2]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_saida[3]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_saida[4]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_saida[5]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_saida[6]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_saida[7]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_r_saida[0]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_r_saida[1]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_r_saida[2]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_r_saida[3]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_r_saida[4]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_r_saida[5]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_r_saida[6]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_r_saida[7]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- zero	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sign	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- overflow	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carry	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- estado_atual[0]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- estado_atual[1]	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- estado_atual[2]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- estado_atual[3]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- estado_atual[4]	=>  Location: PIN_T20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[0]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[1]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[2]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[3]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[4]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[5]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[7]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CPU IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_switches : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_leds : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_hex0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_debug1 : std_logic;
SIGNAL ww_reg_a_saida : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_reg_b_saida : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_reg_r_saida : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_zero : std_logic;
SIGNAL ww_sign : std_logic;
SIGNAL ww_overflow : std_logic;
SIGNAL ww_carry : std_logic;
SIGNAL ww_estado_atual : std_logic_vector(4 DOWNTO 0);
SIGNAL \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \switches[0]~input_o\ : std_logic;
SIGNAL \PC|Add0~1_sumout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \PC|Add0~2\ : std_logic;
SIGNAL \PC|Add0~5_sumout\ : std_logic;
SIGNAL \PC|Add0~6\ : std_logic;
SIGNAL \PC|Add0~9_sumout\ : std_logic;
SIGNAL \PC|Add0~10\ : std_logic;
SIGNAL \PC|Add0~13_sumout\ : std_logic;
SIGNAL \mem_address[3]~feeder_combout\ : std_logic;
SIGNAL \PC|Add0~14\ : std_logic;
SIGNAL \PC|Add0~17_sumout\ : std_logic;
SIGNAL \PC|Add0~18\ : std_logic;
SIGNAL \PC|Add0~21_sumout\ : std_logic;
SIGNAL \mem_address[5]~feeder_combout\ : std_logic;
SIGNAL \switches[5]~input_o\ : std_logic;
SIGNAL \Controle|proximo_estado.ESPERA_MEMORIA_575~combout\ : std_logic;
SIGNAL \Controle|estado.ESPERA_MEMORIA~q\ : std_logic;
SIGNAL \Controle|proximo_estado.ESPERA_MEMORIA_2_564~combout\ : std_logic;
SIGNAL \Controle|estado.ESPERA_MEMORIA_2~q\ : std_logic;
SIGNAL \reg_b[0]~2_combout\ : std_logic;
SIGNAL \Controle|Selector9~2_combout\ : std_logic;
SIGNAL \Controle|Selector9~0_combout\ : std_logic;
SIGNAL \Controle|Selector10~2_combout\ : std_logic;
SIGNAL \reg_r[3]~1_combout\ : std_logic;
SIGNAL \Controle|Selector7~1_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.PEGA_LITERAL_630~combout\ : std_logic;
SIGNAL \Controle|estado.PEGA_LITERAL~feeder_combout\ : std_logic;
SIGNAL \Controle|estado.PEGA_LITERAL~q\ : std_logic;
SIGNAL \Controle|proximo_estado.ESPERA_LITERAL_619~combout\ : std_logic;
SIGNAL \Controle|estado.ESPERA_LITERAL~q\ : std_logic;
SIGNAL \Controle|proximo_estado.DECODIFICA_2_670~combout\ : std_logic;
SIGNAL \Controle|estado.DECODIFICA_2~q\ : std_logic;
SIGNAL \Controle|WideOr23~0_combout\ : std_logic;
SIGNAL \PC|Add0~22\ : std_logic;
SIGNAL \PC|Add0~25_sumout\ : std_logic;
SIGNAL \mem_address[6]~feeder_combout\ : std_logic;
SIGNAL \reg_literal[6]~feeder_combout\ : std_logic;
SIGNAL \reg_literal~0_combout\ : std_logic;
SIGNAL \reg_literal[2]~1_combout\ : std_logic;
SIGNAL \Controle|read_enable~0_combout\ : std_logic;
SIGNAL \reg_literal[2]~2_combout\ : std_logic;
SIGNAL \switches[6]~input_o\ : std_logic;
SIGNAL \reg_b~0_combout\ : std_logic;
SIGNAL \reg_b~9_combout\ : std_logic;
SIGNAL \Controle|input_enable~0_combout\ : std_logic;
SIGNAL \reg_b[0]~3_combout\ : std_logic;
SIGNAL \reg_a~0_combout\ : std_logic;
SIGNAL \reg_a~9_combout\ : std_logic;
SIGNAL \Controle|Selector9~1_combout\ : std_logic;
SIGNAL \reg_a[4]~3_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Controle|Selector2~0_combout\ : std_logic;
SIGNAL \ULA|Mux10~2_combout\ : std_logic;
SIGNAL \Controle|Selector4~0_combout\ : std_logic;
SIGNAL \Controle|Selector5~0_combout\ : std_logic;
SIGNAL \reg_b~8_combout\ : std_logic;
SIGNAL \reg_a~8_combout\ : std_logic;
SIGNAL \reg_literal[5]~feeder_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \switches[4]~input_o\ : std_logic;
SIGNAL \reg_b~7_combout\ : std_logic;
SIGNAL \reg_literal[4]~feeder_combout\ : std_logic;
SIGNAL \reg_a~7_combout\ : std_logic;
SIGNAL \Controle|Selector42~0_combout\ : std_logic;
SIGNAL \Controle|Selector12~0_combout\ : std_logic;
SIGNAL \Controle|Selector11~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \reg_r[3]~0_combout\ : std_logic;
SIGNAL \switches[3]~input_o\ : std_logic;
SIGNAL \reg_b~6_combout\ : std_logic;
SIGNAL \reg_literal[2]~feeder_combout\ : std_logic;
SIGNAL \switches[2]~input_o\ : std_logic;
SIGNAL \reg_a~5_combout\ : std_logic;
SIGNAL \reg_b~5_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \ULA|Mux3~2_combout\ : std_logic;
SIGNAL \switches[1]~input_o\ : std_logic;
SIGNAL \reg_b~4_combout\ : std_logic;
SIGNAL \reg_literal[0]~feeder_combout\ : std_logic;
SIGNAL \ULA|Add0~21_sumout\ : std_logic;
SIGNAL \ULA|Add1~21_sumout\ : std_logic;
SIGNAL \ULA|Mux8~0_combout\ : std_logic;
SIGNAL \ULA|Mux13~0_combout\ : std_logic;
SIGNAL \reg_r~2_combout\ : std_logic;
SIGNAL \Controle|Mux5~0_combout\ : std_logic;
SIGNAL \Controle|Selector33~0_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.EXECUTA_659~combout\ : std_logic;
SIGNAL \Controle|estado.EXECUTA~q\ : std_logic;
SIGNAL \reg_r[3]~3_combout\ : std_logic;
SIGNAL \reg_r[3]~4_combout\ : std_logic;
SIGNAL \reg_a~2_combout\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \ULA|Add1~22\ : std_logic;
SIGNAL \ULA|Add1~23\ : std_logic;
SIGNAL \ULA|Add1~25_sumout\ : std_logic;
SIGNAL \ULA|Add0~22\ : std_logic;
SIGNAL \ULA|Add0~25_sumout\ : std_logic;
SIGNAL \ULA|Mux7~0_combout\ : std_logic;
SIGNAL \ULA|Mux12~0_combout\ : std_logic;
SIGNAL \reg_r~5_combout\ : std_logic;
SIGNAL \reg_literal[1]~feeder_combout\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \reg_a~4_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \ULA|Add1~26\ : std_logic;
SIGNAL \ULA|Add1~27\ : std_logic;
SIGNAL \ULA|Add1~17_sumout\ : std_logic;
SIGNAL \ULA|Add0~26\ : std_logic;
SIGNAL \ULA|Add0~17_sumout\ : std_logic;
SIGNAL \ULA|Mux6~0_combout\ : std_logic;
SIGNAL \ULA|Mux11~0_combout\ : std_logic;
SIGNAL \reg_r~6_combout\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \ULA|Add1~18\ : std_logic;
SIGNAL \ULA|Add1~19\ : std_logic;
SIGNAL \ULA|Add1~13_sumout\ : std_logic;
SIGNAL \ULA|Add0~18\ : std_logic;
SIGNAL \ULA|Add0~13_sumout\ : std_logic;
SIGNAL \ULA|Mux5~0_combout\ : std_logic;
SIGNAL \ULA|Mux0~0_combout\ : std_logic;
SIGNAL \reg_r~7_combout\ : std_logic;
SIGNAL \reg_literal[3]~feeder_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \ULA|Add0~14\ : std_logic;
SIGNAL \ULA|Add0~9_sumout\ : std_logic;
SIGNAL \ULA|Add1~14\ : std_logic;
SIGNAL \ULA|Add1~15\ : std_logic;
SIGNAL \ULA|Add1~9_sumout\ : std_logic;
SIGNAL \ULA|Mux4~0_combout\ : std_logic;
SIGNAL \ULA|Mux14~0_combout\ : std_logic;
SIGNAL \reg_r~8_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \ULA|Add1~10\ : std_logic;
SIGNAL \ULA|Add1~11\ : std_logic;
SIGNAL \ULA|Add1~2\ : std_logic;
SIGNAL \ULA|Add1~3\ : std_logic;
SIGNAL \ULA|Add1~5_sumout\ : std_logic;
SIGNAL \ULA|Add0~10\ : std_logic;
SIGNAL \ULA|Add0~2\ : std_logic;
SIGNAL \ULA|Add0~5_sumout\ : std_logic;
SIGNAL \ULA|Mux2~0_combout\ : std_logic;
SIGNAL \ULA|Mux16~0_combout\ : std_logic;
SIGNAL \reg_r~10_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Controle|Mux9~0_combout\ : std_logic;
SIGNAL \Controle|Mux16~0_combout\ : std_logic;
SIGNAL \Controle|Selector6~3_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.PRE_ACESSO_MEMORIA_597~combout\ : std_logic;
SIGNAL \Controle|estado.PRE_ACESSO_MEMORIA~q\ : std_logic;
SIGNAL \Controle|WideOr23~1_combout\ : std_logic;
SIGNAL \Controle|Selector8~0_combout\ : std_logic;
SIGNAL \Controle|WideOr1~0_combout\ : std_logic;
SIGNAL \Controle|Selector6~1_combout\ : std_logic;
SIGNAL \Controle|Selector6~0_combout\ : std_logic;
SIGNAL \ULA|Mux3~1_combout\ : std_logic;
SIGNAL \ULA|Add2~22\ : std_logic;
SIGNAL \ULA|Add2~23\ : std_logic;
SIGNAL \ULA|Add2~26\ : std_logic;
SIGNAL \ULA|Add2~27\ : std_logic;
SIGNAL \ULA|Add2~17_sumout\ : std_logic;
SIGNAL \ULA|Mux22~0_combout\ : std_logic;
SIGNAL \ULA|Mux3~4_combout\ : std_logic;
SIGNAL \ULA|Mux6~1_combout\ : std_logic;
SIGNAL \ULA|Add2~18\ : std_logic;
SIGNAL \ULA|Add2~19\ : std_logic;
SIGNAL \ULA|Add2~14\ : std_logic;
SIGNAL \ULA|Add2~15\ : std_logic;
SIGNAL \ULA|Add2~9_sumout\ : std_logic;
SIGNAL \ULA|Mux24~0_combout\ : std_logic;
SIGNAL \ULA|Mux4~1_combout\ : std_logic;
SIGNAL \ULA|Add2~10\ : std_logic;
SIGNAL \ULA|Add2~11\ : std_logic;
SIGNAL \ULA|Add2~2\ : std_logic;
SIGNAL \ULA|Add2~3\ : std_logic;
SIGNAL \ULA|Add2~5_sumout\ : std_logic;
SIGNAL \ULA|Mux26~0_combout\ : std_logic;
SIGNAL \ULA|Mux2~1_combout\ : std_logic;
SIGNAL \ULA|Add2~1_sumout\ : std_logic;
SIGNAL \ULA|Add1~1_sumout\ : std_logic;
SIGNAL \ULA|Add0~1_sumout\ : std_logic;
SIGNAL \ULA|Mux3~0_combout\ : std_logic;
SIGNAL \ULA|Mux25~0_combout\ : std_logic;
SIGNAL \ULA|Mux3~3_combout\ : std_logic;
SIGNAL \ULA|Add2~21_sumout\ : std_logic;
SIGNAL \ULA|Mux19~0_combout\ : std_logic;
SIGNAL \ULA|Add2~25_sumout\ : std_logic;
SIGNAL \ULA|Equal0~1_combout\ : std_logic;
SIGNAL \ULA|Mux21~0_combout\ : std_logic;
SIGNAL \ULA|Equal0~2_combout\ : std_logic;
SIGNAL \ULA|Add2~13_sumout\ : std_logic;
SIGNAL \ULA|Mux23~0_combout\ : std_logic;
SIGNAL \ULA|Mux5~1_combout\ : std_logic;
SIGNAL \ULA|Equal0~0_combout\ : std_logic;
SIGNAL \overflow_flag~0_combout\ : std_logic;
SIGNAL \zero_flag~q\ : std_logic;
SIGNAL \Controle|Selector0~0_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.NAO_PULOU_520~combout\ : std_logic;
SIGNAL \Controle|estado.NAO_PULOU~q\ : std_logic;
SIGNAL \Controle|proximo_estado.ESPERA_PULO_531~combout\ : std_logic;
SIGNAL \Controle|estado.ESPERA_PULO~q\ : std_logic;
SIGNAL \Controle|Selector6~4_combout\ : std_logic;
SIGNAL \Controle|Selector6~5_combout\ : std_logic;
SIGNAL \PC|Add0~26\ : std_logic;
SIGNAL \PC|Add0~29_sumout\ : std_logic;
SIGNAL \mem_address[7]~feeder_combout\ : std_logic;
SIGNAL \reg_literal[7]~feeder_combout\ : std_logic;
SIGNAL \switches[7]~input_o\ : std_logic;
SIGNAL \reg_a~10_combout\ : std_logic;
SIGNAL \reg_b~10_combout\ : std_logic;
SIGNAL \ULA|Add0~6\ : std_logic;
SIGNAL \ULA|Add0~29_sumout\ : std_logic;
SIGNAL \ULA|Add1~6\ : std_logic;
SIGNAL \ULA|Add1~7\ : std_logic;
SIGNAL \ULA|Add1~29_sumout\ : std_logic;
SIGNAL \ULA|Mux17~0_combout\ : std_logic;
SIGNAL \ULA|Mux17~1_combout\ : std_logic;
SIGNAL \reg_r~11_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Controle|Selector3~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \ULA|Mux15~0_combout\ : std_logic;
SIGNAL \reg_r~9_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \mem_address[4]~feeder_combout\ : std_logic;
SIGNAL \Controle|Selector18~1_combout\ : std_logic;
SIGNAL \Controle|Selector18~0_combout\ : std_logic;
SIGNAL \Controle|Selector18~2_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.MOVER_553~combout\ : std_logic;
SIGNAL \Controle|estado.MOVER~q\ : std_logic;
SIGNAL \Controle|WideOr26~0_combout\ : std_logic;
SIGNAL \reg_a~1_combout\ : std_logic;
SIGNAL \reg_a~6_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Controle|process_2~0_combout\ : std_logic;
SIGNAL \Controle|Selector7~0_combout\ : std_logic;
SIGNAL \mem_address[2]~feeder_combout\ : std_logic;
SIGNAL \mem_address[1]~feeder_combout\ : std_logic;
SIGNAL \Controle|Selector10~0_combout\ : std_logic;
SIGNAL \Controle|Selector10~1_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \ULA|Add2~6\ : std_logic;
SIGNAL \ULA|Add2~7\ : std_logic;
SIGNAL \ULA|Add2~29_sumout\ : std_logic;
SIGNAL \ULA|Mux1~0_combout\ : std_logic;
SIGNAL \sign_flag~feeder_combout\ : std_logic;
SIGNAL \sign_flag~q\ : std_logic;
SIGNAL \Controle|Selector6~2_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.PULANDO_542~combout\ : std_logic;
SIGNAL \Controle|estado.PULANDO~q\ : std_logic;
SIGNAL \mem_address[0]~feeder_combout\ : std_logic;
SIGNAL \Controle|Mux13~0_combout\ : std_logic;
SIGNAL \Controle|Mux19~0_combout\ : std_logic;
SIGNAL \Controle|Selector27~0_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.SALTO_ADR_608~combout\ : std_logic;
SIGNAL \Controle|estado.SALTO_ADR~q\ : std_logic;
SIGNAL \Controle|Selector42~2_combout\ : std_logic;
SIGNAL \Controle|Selector42~1_combout\ : std_logic;
SIGNAL \Controle|Selector42~3_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.ESPERA_714~combout\ : std_logic;
SIGNAL \Controle|estado.ESPERA~q\ : std_logic;
SIGNAL \Controle|Mux2~0_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.ESPERA_SAIDA_509~combout\ : std_logic;
SIGNAL \Controle|estado.ESPERA_SAIDA~q\ : std_logic;
SIGNAL \Controle|Selector40~0_combout\ : std_logic;
SIGNAL \Controle|Selector40~1_combout\ : std_logic;
SIGNAL \Controle|Selector40~2_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.BUSCA_703~combout\ : std_logic;
SIGNAL \Controle|estado.BUSCA~0_combout\ : std_logic;
SIGNAL \Controle|estado.BUSCA~q\ : std_logic;
SIGNAL \Controle|proximo_estado.ESPERA_PC_692~combout\ : std_logic;
SIGNAL \Controle|estado.ESPERA_PC~q\ : std_logic;
SIGNAL \Controle|proximo_estado.DECODIFICA_681~combout\ : std_logic;
SIGNAL \Controle|estado.DECODIFICA~q\ : std_logic;
SIGNAL \Controle|Selector32~0_combout\ : std_logic;
SIGNAL \Controle|Selector32~1_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.ACESSO_IO_648~combout\ : std_logic;
SIGNAL \Controle|estado.ACESSO_IO~q\ : std_logic;
SIGNAL \Controle|Selector41~0_combout\ : std_logic;
SIGNAL \Controle|proximo_estado.ACESSO_MEMORIA_586~combout\ : std_logic;
SIGNAL \Controle|estado.ACESSO_MEMORIA~q\ : std_logic;
SIGNAL \Controle|Selector13~0_combout\ : std_logic;
SIGNAL \reg_b~1_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \HEX0_Driver|Mux6~0_combout\ : std_logic;
SIGNAL \HEX0_Driver|Mux5~0_combout\ : std_logic;
SIGNAL \HEX0_Driver|Mux4~0_combout\ : std_logic;
SIGNAL \HEX0_Driver|Mux3~0_combout\ : std_logic;
SIGNAL \HEX0_Driver|Mux2~0_combout\ : std_logic;
SIGNAL \HEX0_Driver|Mux1~0_combout\ : std_logic;
SIGNAL \HEX0_Driver|Mux0~0_combout\ : std_logic;
SIGNAL \HEX1_Driver|Mux6~0_combout\ : std_logic;
SIGNAL \HEX1_Driver|Mux5~0_combout\ : std_logic;
SIGNAL \HEX1_Driver|Mux4~0_combout\ : std_logic;
SIGNAL \HEX1_Driver|Mux3~0_combout\ : std_logic;
SIGNAL \HEX1_Driver|Mux2~0_combout\ : std_logic;
SIGNAL \HEX1_Driver|Mux1~0_combout\ : std_logic;
SIGNAL \HEX1_Driver|Mux0~0_combout\ : std_logic;
SIGNAL \HEX2_Driver|Mux6~0_combout\ : std_logic;
SIGNAL \HEX2_Driver|Mux5~0_combout\ : std_logic;
SIGNAL \HEX2_Driver|Mux4~0_combout\ : std_logic;
SIGNAL \HEX2_Driver|Mux3~0_combout\ : std_logic;
SIGNAL \HEX2_Driver|Mux2~0_combout\ : std_logic;
SIGNAL \HEX2_Driver|Mux1~0_combout\ : std_logic;
SIGNAL \HEX2_Driver|Mux0~0_combout\ : std_logic;
SIGNAL \HEX3_Driver|Mux6~0_combout\ : std_logic;
SIGNAL \HEX3_Driver|Mux5~0_combout\ : std_logic;
SIGNAL \HEX3_Driver|Mux4~0_combout\ : std_logic;
SIGNAL \HEX3_Driver|Mux3~0_combout\ : std_logic;
SIGNAL \HEX3_Driver|Mux2~0_combout\ : std_logic;
SIGNAL \HEX3_Driver|Mux1~0_combout\ : std_logic;
SIGNAL \HEX3_Driver|Mux0~0_combout\ : std_logic;
SIGNAL \HEX4_Driver|Mux6~0_combout\ : std_logic;
SIGNAL \HEX4_Driver|Mux5~0_combout\ : std_logic;
SIGNAL \HEX4_Driver|Mux4~0_combout\ : std_logic;
SIGNAL \HEX4_Driver|Mux3~0_combout\ : std_logic;
SIGNAL \HEX4_Driver|Mux2~0_combout\ : std_logic;
SIGNAL \HEX4_Driver|Mux1~0_combout\ : std_logic;
SIGNAL \HEX4_Driver|Mux0~0_combout\ : std_logic;
SIGNAL \HEX5_Driver|Mux6~0_combout\ : std_logic;
SIGNAL \HEX5_Driver|Mux5~0_combout\ : std_logic;
SIGNAL \HEX5_Driver|Mux4~0_combout\ : std_logic;
SIGNAL \HEX5_Driver|Mux3~0_combout\ : std_logic;
SIGNAL \HEX5_Driver|Mux2~0_combout\ : std_logic;
SIGNAL \HEX5_Driver|Mux1~0_combout\ : std_logic;
SIGNAL \HEX5_Driver|Mux0~0_combout\ : std_logic;
SIGNAL \ULA|Mux10~0_combout\ : std_logic;
SIGNAL \ULA|Mux9~0_combout\ : std_logic;
SIGNAL \overflow_flag~q\ : std_logic;
SIGNAL \ULA|Add1~30\ : std_logic;
SIGNAL \ULA|Add1~31\ : std_logic;
SIGNAL \ULA|Add1~33_sumout\ : std_logic;
SIGNAL \ULA|Add0~30\ : std_logic;
SIGNAL \ULA|Add0~33_sumout\ : std_logic;
SIGNAL \ULA|Mux10~1_combout\ : std_logic;
SIGNAL \carry_flag~q\ : std_logic;
SIGNAL \Controle|WideOr3~0_combout\ : std_logic;
SIGNAL \Controle|WideOr4~combout\ : std_logic;
SIGNAL \Controle|WideOr3~combout\ : std_logic;
SIGNAL \Controle|WideOr2~combout\ : std_logic;
SIGNAL \Controle|WideOr1~combout\ : std_logic;
SIGNAL \Controle|WideOr0~combout\ : std_logic;
SIGNAL mem_address : std_logic_vector(7 DOWNTO 0);
SIGNAL reg_literal : std_logic_vector(7 DOWNTO 0);
SIGNAL reg_r : std_logic_vector(7 DOWNTO 0);
SIGNAL \PC|pc\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\ : std_logic_vector(7 DOWNTO 0);
SIGNAL reg_b : std_logic_vector(7 DOWNTO 0);
SIGNAL reg_inter_1 : std_logic_vector(7 DOWNTO 0);
SIGNAL \Saida|output_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL reg_a : std_logic_vector(7 DOWNTO 0);
SIGNAL reg_inter_2 : std_logic_vector(7 DOWNTO 0);
SIGNAL \Controle|reg_select_memory\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Controle|opcode_memory\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ULA|result\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Controle|ula_code\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ULA|resultado\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ULA|ALT_INV_Add2~9_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add2~5_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add2~1_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \PC|ALT_INV_pc\ : std_logic_vector(7 DOWNTO 0);
SIGNAL ALT_INV_reg_literal : std_logic_vector(7 DOWNTO 0);
SIGNAL ALT_INV_mem_address : std_logic_vector(3 DOWNTO 0);
SIGNAL \Controle|ALT_INV_estado.PULANDO~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.BUSCA~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.DECODIFICA~q\ : std_logic;
SIGNAL \Controle|ALT_INV_process_2~0_combout\ : std_logic;
SIGNAL \HEX5_Driver|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \HEX4_Driver|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \HEX3_Driver|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \HEX2_Driver|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL ALT_INV_reg_r : std_logic_vector(7 DOWNTO 0);
SIGNAL \HEX1_Driver|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL ALT_INV_reg_b : std_logic_vector(7 DOWNTO 0);
SIGNAL \HEX0_Driver|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL ALT_INV_reg_a : std_logic_vector(7 DOWNTO 0);
SIGNAL \ULA|ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add2~29_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add1~33_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add2~25_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add2~21_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add2~17_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add2~13_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux5~1_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux4~1_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux2~1_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux3~3_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux3~2_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux3~1_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL ALT_INV_reg_inter_2 : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reg_literal[2]~1_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector6~4_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector6~3_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector6~2_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector6~1_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector6~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Mux16~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_WideOr23~1_combout\ : std_logic;
SIGNAL \ALT_INV_reg_r[3]~3_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_reg_r[3]~1_combout\ : std_logic;
SIGNAL \ALT_INV_reg_r[3]~0_combout\ : std_logic;
SIGNAL \ALT_INV_reg_b[0]~2_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector9~2_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector10~2_combout\ : std_logic;
SIGNAL \ALT_INV_reg_b~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_input_enable~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector9~1_combout\ : std_logic;
SIGNAL \ALT_INV_reg_a~1_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_read_enable~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector9~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector10~1_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector10~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_WideOr26~0_combout\ : std_logic;
SIGNAL \ALT_INV_reg_a~0_combout\ : std_logic;
SIGNAL ALT_INV_reg_inter_1 : std_logic_vector(7 DOWNTO 0);
SIGNAL \Controle|ALT_INV_estado.MOVER~q\ : std_logic;
SIGNAL \Controle|ALT_INV_WideOr23~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_WideOr1~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.PRE_ACESSO_MEMORIA~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.ESPERA_SAIDA~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.ESPERA_PULO~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.ESPERA_MEMORIA~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.ESPERA_LITERAL~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.EXECUTA~q\ : std_logic;
SIGNAL \Controle|ALT_INV_WideOr3~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.ESPERA_MEMORIA_2~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.ACESSO_IO~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.ESPERA_PC~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.PEGA_LITERAL~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.ACESSO_MEMORIA~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.DECODIFICA_2~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.ESPERA~q\ : std_logic;
SIGNAL \ALT_INV_sign_flag~q\ : std_logic;
SIGNAL \ALT_INV_zero_flag~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.NAO_PULOU~q\ : std_logic;
SIGNAL \Controle|ALT_INV_estado.SALTO_ADR~q\ : std_logic;
SIGNAL \ALT_INV_switches[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \Controle|ALT_INV_reg_select_memory\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Controle|ALT_INV_proximo_estado.MOVER_553~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.PRE_ACESSO_MEMORIA_597~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.ESPERA_SAIDA_509~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.ESPERA_PULO_531~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.ESPERA_MEMORIA_575~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.ESPERA_LITERAL_619~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.EXECUTA_659~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.ESPERA_MEMORIA_2_564~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.ACESSO_IO_648~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.ESPERA_PC_692~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.PEGA_LITERAL_630~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.ACESSO_MEMORIA_586~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.DECODIFICA_2_670~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.ESPERA_714~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \ULA|ALT_INV_result\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Controle|ALT_INV_proximo_estado.NAO_PULOU_520~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.SALTO_ADR_608~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.PULANDO_542~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.BUSCA_703~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_proximo_estado.DECODIFICA_681~combout\ : std_logic;
SIGNAL \Controle|ALT_INV_ula_code\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Controle|ALT_INV_opcode_memory\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ULA|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector18~2_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector18~1_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector18~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector33~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector32~1_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector32~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector7~1_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector42~3_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector42~2_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector42~1_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux21~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux19~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux22~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux23~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux24~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux26~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux3~4_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux25~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux17~1_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux17~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux16~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux15~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux14~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector27~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Mux13~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector40~2_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector40~1_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Mux19~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector40~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector41~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux11~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux12~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector5~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector4~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux13~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux10~2_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector11~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector12~0_combout\ : std_logic;
SIGNAL \Controle|ALT_INV_Selector42~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux10~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux8~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux6~1_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \ALT_INV_switches[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_switches[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_switches[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_switches[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_switches[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_switches[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_switches[1]~input_o\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_switches <= switches;
leds <= ww_leds;
hex0 <= ww_hex0;
hex1 <= ww_hex1;
hex2 <= ww_hex2;
hex3 <= ww_hex3;
hex4 <= ww_hex4;
hex5 <= ww_hex5;
debug1 <= ww_debug1;
reg_a_saida <= ww_reg_a_saida;
reg_b_saida <= ww_reg_b_saida;
reg_r_saida <= ww_reg_r_saida;
zero <= ww_zero;
sign <= ww_sign;
overflow <= ww_overflow;
carry <= ww_carry;
estado_atual <= ww_estado_atual;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & reg_inter_1(7) & reg_inter_1(6) & reg_inter_1(5) & reg_inter_1(4) & reg_inter_1(3) & reg_inter_1(2) & reg_inter_1(1) & reg_inter_1(0));

\Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (mem_address(7) & mem_address(6) & mem_address(5) & mem_address(4) & mem_address(3) & mem_address(2) & mem_address(1) & mem_address(0));

\Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (mem_address(7) & mem_address(6) & mem_address(5) & mem_address(4) & mem_address(3) & mem_address(2) & mem_address(1) & mem_address(0));

\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0) <= \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) <= \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) <= \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3) <= \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) <= \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) <= \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6) <= \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) <= \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\ULA|ALT_INV_Add2~9_sumout\ <= NOT \ULA|Add2~9_sumout\;
\ULA|ALT_INV_Add0~9_sumout\ <= NOT \ULA|Add0~9_sumout\;
\ULA|ALT_INV_Add1~9_sumout\ <= NOT \ULA|Add1~9_sumout\;
\ULA|ALT_INV_Add2~5_sumout\ <= NOT \ULA|Add2~5_sumout\;
\ULA|ALT_INV_Add0~5_sumout\ <= NOT \ULA|Add0~5_sumout\;
\ULA|ALT_INV_Add1~5_sumout\ <= NOT \ULA|Add1~5_sumout\;
\ULA|ALT_INV_Add2~1_sumout\ <= NOT \ULA|Add2~1_sumout\;
\ULA|ALT_INV_Add0~1_sumout\ <= NOT \ULA|Add0~1_sumout\;
\ULA|ALT_INV_Add1~1_sumout\ <= NOT \ULA|Add1~1_sumout\;
\Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1) <= NOT \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1);
\Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(2) <= NOT \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2);
\Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(3) <= NOT \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3);
\Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4) <= NOT \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4);
\Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5) <= NOT \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5);
\Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6) <= NOT \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6);
\Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7) <= NOT \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7);
\Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0) <= NOT \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0);
\PC|ALT_INV_pc\(3) <= NOT \PC|pc\(3);
\PC|ALT_INV_pc\(2) <= NOT \PC|pc\(2);
\PC|ALT_INV_pc\(1) <= NOT \PC|pc\(1);
\PC|ALT_INV_pc\(0) <= NOT \PC|pc\(0);
ALT_INV_reg_literal(3) <= NOT reg_literal(3);
ALT_INV_reg_literal(2) <= NOT reg_literal(2);
ALT_INV_reg_literal(1) <= NOT reg_literal(1);
ALT_INV_reg_literal(0) <= NOT reg_literal(0);
ALT_INV_mem_address(3) <= NOT mem_address(3);
ALT_INV_mem_address(2) <= NOT mem_address(2);
ALT_INV_mem_address(1) <= NOT mem_address(1);
ALT_INV_mem_address(0) <= NOT mem_address(0);
\Controle|ALT_INV_estado.PULANDO~q\ <= NOT \Controle|estado.PULANDO~q\;
\Controle|ALT_INV_estado.BUSCA~q\ <= NOT \Controle|estado.BUSCA~q\;
\Controle|ALT_INV_estado.DECODIFICA~q\ <= NOT \Controle|estado.DECODIFICA~q\;
\Controle|ALT_INV_process_2~0_combout\ <= NOT \Controle|process_2~0_combout\;
\HEX5_Driver|ALT_INV_Mux0~0_combout\ <= NOT \HEX5_Driver|Mux0~0_combout\;
\HEX4_Driver|ALT_INV_Mux0~0_combout\ <= NOT \HEX4_Driver|Mux0~0_combout\;
\HEX3_Driver|ALT_INV_Mux0~0_combout\ <= NOT \HEX3_Driver|Mux0~0_combout\;
\HEX2_Driver|ALT_INV_Mux0~0_combout\ <= NOT \HEX2_Driver|Mux0~0_combout\;
ALT_INV_reg_r(3) <= NOT reg_r(3);
ALT_INV_reg_r(2) <= NOT reg_r(2);
ALT_INV_reg_r(1) <= NOT reg_r(1);
ALT_INV_reg_r(0) <= NOT reg_r(0);
\HEX1_Driver|ALT_INV_Mux0~0_combout\ <= NOT \HEX1_Driver|Mux0~0_combout\;
ALT_INV_reg_b(3) <= NOT reg_b(3);
ALT_INV_reg_b(2) <= NOT reg_b(2);
ALT_INV_reg_b(1) <= NOT reg_b(1);
ALT_INV_reg_b(0) <= NOT reg_b(0);
\HEX0_Driver|ALT_INV_Mux0~0_combout\ <= NOT \HEX0_Driver|Mux0~0_combout\;
ALT_INV_reg_a(3) <= NOT reg_a(3);
ALT_INV_reg_a(2) <= NOT reg_a(2);
ALT_INV_reg_a(1) <= NOT reg_a(1);
ALT_INV_reg_a(0) <= NOT reg_a(0);
\ULA|ALT_INV_Equal0~2_combout\ <= NOT \ULA|Equal0~2_combout\;
\ULA|ALT_INV_Add2~29_sumout\ <= NOT \ULA|Add2~29_sumout\;
\PC|ALT_INV_pc\(7) <= NOT \PC|pc\(7);
\PC|ALT_INV_pc\(6) <= NOT \PC|pc\(6);
\PC|ALT_INV_pc\(5) <= NOT \PC|pc\(5);
\PC|ALT_INV_pc\(4) <= NOT \PC|pc\(4);
ALT_INV_reg_literal(7) <= NOT reg_literal(7);
ALT_INV_reg_literal(6) <= NOT reg_literal(6);
ALT_INV_reg_literal(5) <= NOT reg_literal(5);
ALT_INV_reg_literal(4) <= NOT reg_literal(4);
\ULA|ALT_INV_Add0~33_sumout\ <= NOT \ULA|Add0~33_sumout\;
\ULA|ALT_INV_Add1~33_sumout\ <= NOT \ULA|Add1~33_sumout\;
\ULA|ALT_INV_Add0~29_sumout\ <= NOT \ULA|Add0~29_sumout\;
\ULA|ALT_INV_Add1~29_sumout\ <= NOT \ULA|Add1~29_sumout\;
\ULA|ALT_INV_Add2~25_sumout\ <= NOT \ULA|Add2~25_sumout\;
\ULA|ALT_INV_Add0~25_sumout\ <= NOT \ULA|Add0~25_sumout\;
\ULA|ALT_INV_Add1~25_sumout\ <= NOT \ULA|Add1~25_sumout\;
\ULA|ALT_INV_Add2~21_sumout\ <= NOT \ULA|Add2~21_sumout\;
\ULA|ALT_INV_Add0~21_sumout\ <= NOT \ULA|Add0~21_sumout\;
\ULA|ALT_INV_Add1~21_sumout\ <= NOT \ULA|Add1~21_sumout\;
\ULA|ALT_INV_Add2~17_sumout\ <= NOT \ULA|Add2~17_sumout\;
\ULA|ALT_INV_Add0~17_sumout\ <= NOT \ULA|Add0~17_sumout\;
\ULA|ALT_INV_Add1~17_sumout\ <= NOT \ULA|Add1~17_sumout\;
\ULA|ALT_INV_Add2~13_sumout\ <= NOT \ULA|Add2~13_sumout\;
\ULA|ALT_INV_Add0~13_sumout\ <= NOT \ULA|Add0~13_sumout\;
\ULA|ALT_INV_Add1~13_sumout\ <= NOT \ULA|Add1~13_sumout\;
\ULA|ALT_INV_Mux5~1_combout\ <= NOT \ULA|Mux5~1_combout\;
\ULA|ALT_INV_Mux5~0_combout\ <= NOT \ULA|Mux5~0_combout\;
\ULA|ALT_INV_Mux4~1_combout\ <= NOT \ULA|Mux4~1_combout\;
\ULA|ALT_INV_Mux4~0_combout\ <= NOT \ULA|Mux4~0_combout\;
\ULA|ALT_INV_Mux2~1_combout\ <= NOT \ULA|Mux2~1_combout\;
\ULA|ALT_INV_Mux2~0_combout\ <= NOT \ULA|Mux2~0_combout\;
\ULA|ALT_INV_Mux3~3_combout\ <= NOT \ULA|Mux3~3_combout\;
\ULA|ALT_INV_Mux3~2_combout\ <= NOT \ULA|Mux3~2_combout\;
\ULA|ALT_INV_Mux3~1_combout\ <= NOT \ULA|Mux3~1_combout\;
\ULA|ALT_INV_Mux3~0_combout\ <= NOT \ULA|Mux3~0_combout\;
ALT_INV_reg_inter_2(7) <= NOT reg_inter_2(7);
ALT_INV_reg_inter_2(6) <= NOT reg_inter_2(6);
ALT_INV_reg_inter_2(5) <= NOT reg_inter_2(5);
ALT_INV_reg_inter_2(4) <= NOT reg_inter_2(4);
\ALT_INV_reg_literal[2]~1_combout\ <= NOT \reg_literal[2]~1_combout\;
\Controle|ALT_INV_Selector6~4_combout\ <= NOT \Controle|Selector6~4_combout\;
\Controle|ALT_INV_Selector6~3_combout\ <= NOT \Controle|Selector6~3_combout\;
\Controle|ALT_INV_Selector6~2_combout\ <= NOT \Controle|Selector6~2_combout\;
\Controle|ALT_INV_Selector6~1_combout\ <= NOT \Controle|Selector6~1_combout\;
\Controle|ALT_INV_Selector6~0_combout\ <= NOT \Controle|Selector6~0_combout\;
\Controle|ALT_INV_Mux9~0_combout\ <= NOT \Controle|Mux9~0_combout\;
\Controle|ALT_INV_Mux16~0_combout\ <= NOT \Controle|Mux16~0_combout\;
\Controle|ALT_INV_WideOr23~1_combout\ <= NOT \Controle|WideOr23~1_combout\;
\ALT_INV_reg_r[3]~3_combout\ <= NOT \reg_r[3]~3_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_reg_r[3]~1_combout\ <= NOT \reg_r[3]~1_combout\;
\ALT_INV_reg_r[3]~0_combout\ <= NOT \reg_r[3]~0_combout\;
\ALT_INV_reg_b[0]~2_combout\ <= NOT \reg_b[0]~2_combout\;
\Controle|ALT_INV_Selector9~2_combout\ <= NOT \Controle|Selector9~2_combout\;
\Controle|ALT_INV_Selector10~2_combout\ <= NOT \Controle|Selector10~2_combout\;
\ALT_INV_reg_b~0_combout\ <= NOT \reg_b~0_combout\;
ALT_INV_reg_inter_2(3) <= NOT reg_inter_2(3);
ALT_INV_reg_inter_2(2) <= NOT reg_inter_2(2);
ALT_INV_reg_inter_2(1) <= NOT reg_inter_2(1);
\Controle|ALT_INV_input_enable~0_combout\ <= NOT \Controle|input_enable~0_combout\;
\Controle|ALT_INV_Selector9~1_combout\ <= NOT \Controle|Selector9~1_combout\;
\ALT_INV_reg_a~1_combout\ <= NOT \reg_a~1_combout\;
\Controle|ALT_INV_read_enable~0_combout\ <= NOT \Controle|read_enable~0_combout\;
\Controle|ALT_INV_Selector9~0_combout\ <= NOT \Controle|Selector9~0_combout\;
\Controle|ALT_INV_Selector10~1_combout\ <= NOT \Controle|Selector10~1_combout\;
\Controle|ALT_INV_Selector10~0_combout\ <= NOT \Controle|Selector10~0_combout\;
\Controle|ALT_INV_WideOr26~0_combout\ <= NOT \Controle|WideOr26~0_combout\;
\ALT_INV_reg_a~0_combout\ <= NOT \reg_a~0_combout\;
ALT_INV_reg_inter_2(0) <= NOT reg_inter_2(0);
ALT_INV_reg_inter_1(7) <= NOT reg_inter_1(7);
ALT_INV_reg_inter_1(6) <= NOT reg_inter_1(6);
ALT_INV_reg_inter_1(5) <= NOT reg_inter_1(5);
ALT_INV_reg_inter_1(4) <= NOT reg_inter_1(4);
ALT_INV_reg_inter_1(3) <= NOT reg_inter_1(3);
ALT_INV_reg_inter_1(2) <= NOT reg_inter_1(2);
ALT_INV_reg_inter_1(1) <= NOT reg_inter_1(1);
ALT_INV_reg_inter_1(0) <= NOT reg_inter_1(0);
\Controle|ALT_INV_estado.MOVER~q\ <= NOT \Controle|estado.MOVER~q\;
\Controle|ALT_INV_WideOr23~0_combout\ <= NOT \Controle|WideOr23~0_combout\;
\Controle|ALT_INV_WideOr1~0_combout\ <= NOT \Controle|WideOr1~0_combout\;
\Controle|ALT_INV_estado.PRE_ACESSO_MEMORIA~q\ <= NOT \Controle|estado.PRE_ACESSO_MEMORIA~q\;
\Controle|ALT_INV_estado.ESPERA_SAIDA~q\ <= NOT \Controle|estado.ESPERA_SAIDA~q\;
\Controle|ALT_INV_estado.ESPERA_PULO~q\ <= NOT \Controle|estado.ESPERA_PULO~q\;
\Controle|ALT_INV_estado.ESPERA_MEMORIA~q\ <= NOT \Controle|estado.ESPERA_MEMORIA~q\;
\Controle|ALT_INV_estado.ESPERA_LITERAL~q\ <= NOT \Controle|estado.ESPERA_LITERAL~q\;
\Controle|ALT_INV_estado.EXECUTA~q\ <= NOT \Controle|estado.EXECUTA~q\;
\Controle|ALT_INV_WideOr3~0_combout\ <= NOT \Controle|WideOr3~0_combout\;
\Controle|ALT_INV_estado.ESPERA_MEMORIA_2~q\ <= NOT \Controle|estado.ESPERA_MEMORIA_2~q\;
\Controle|ALT_INV_estado.ACESSO_IO~q\ <= NOT \Controle|estado.ACESSO_IO~q\;
\Controle|ALT_INV_estado.ESPERA_PC~q\ <= NOT \Controle|estado.ESPERA_PC~q\;
\Controle|ALT_INV_estado.PEGA_LITERAL~q\ <= NOT \Controle|estado.PEGA_LITERAL~q\;
\Controle|ALT_INV_estado.ACESSO_MEMORIA~q\ <= NOT \Controle|estado.ACESSO_MEMORIA~q\;
\Controle|ALT_INV_estado.DECODIFICA_2~q\ <= NOT \Controle|estado.DECODIFICA_2~q\;
\Controle|ALT_INV_estado.ESPERA~q\ <= NOT \Controle|estado.ESPERA~q\;
\ALT_INV_sign_flag~q\ <= NOT \sign_flag~q\;
\ALT_INV_zero_flag~q\ <= NOT \zero_flag~q\;
ALT_INV_reg_r(7) <= NOT reg_r(7);
ALT_INV_reg_r(6) <= NOT reg_r(6);
ALT_INV_reg_r(5) <= NOT reg_r(5);
ALT_INV_reg_r(4) <= NOT reg_r(4);
ALT_INV_reg_b(7) <= NOT reg_b(7);
ALT_INV_reg_b(6) <= NOT reg_b(6);
ALT_INV_reg_b(5) <= NOT reg_b(5);
ALT_INV_reg_b(4) <= NOT reg_b(4);
ALT_INV_reg_a(7) <= NOT reg_a(7);
ALT_INV_reg_a(6) <= NOT reg_a(6);
ALT_INV_reg_a(5) <= NOT reg_a(5);
ALT_INV_reg_a(4) <= NOT reg_a(4);
\Controle|ALT_INV_estado.NAO_PULOU~q\ <= NOT \Controle|estado.NAO_PULOU~q\;
\Controle|ALT_INV_estado.SALTO_ADR~q\ <= NOT \Controle|estado.SALTO_ADR~q\;
\ALT_INV_switches[0]~input_o\ <= NOT \switches[0]~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\Controle|ALT_INV_reg_select_memory\(1) <= NOT \Controle|reg_select_memory\(1);
\Controle|ALT_INV_reg_select_memory\(0) <= NOT \Controle|reg_select_memory\(0);
\Controle|ALT_INV_proximo_estado.MOVER_553~combout\ <= NOT \Controle|proximo_estado.MOVER_553~combout\;
\Controle|ALT_INV_proximo_estado.PRE_ACESSO_MEMORIA_597~combout\ <= NOT \Controle|proximo_estado.PRE_ACESSO_MEMORIA_597~combout\;
\Controle|ALT_INV_proximo_estado.ESPERA_SAIDA_509~combout\ <= NOT \Controle|proximo_estado.ESPERA_SAIDA_509~combout\;
\Controle|ALT_INV_proximo_estado.ESPERA_PULO_531~combout\ <= NOT \Controle|proximo_estado.ESPERA_PULO_531~combout\;
\Controle|ALT_INV_proximo_estado.ESPERA_MEMORIA_575~combout\ <= NOT \Controle|proximo_estado.ESPERA_MEMORIA_575~combout\;
\Controle|ALT_INV_proximo_estado.ESPERA_LITERAL_619~combout\ <= NOT \Controle|proximo_estado.ESPERA_LITERAL_619~combout\;
\Controle|ALT_INV_proximo_estado.EXECUTA_659~combout\ <= NOT \Controle|proximo_estado.EXECUTA_659~combout\;
\Controle|ALT_INV_proximo_estado.ESPERA_MEMORIA_2_564~combout\ <= NOT \Controle|proximo_estado.ESPERA_MEMORIA_2_564~combout\;
\Controle|ALT_INV_proximo_estado.ACESSO_IO_648~combout\ <= NOT \Controle|proximo_estado.ACESSO_IO_648~combout\;
\Controle|ALT_INV_proximo_estado.ESPERA_PC_692~combout\ <= NOT \Controle|proximo_estado.ESPERA_PC_692~combout\;
\Controle|ALT_INV_proximo_estado.PEGA_LITERAL_630~combout\ <= NOT \Controle|proximo_estado.PEGA_LITERAL_630~combout\;
\Controle|ALT_INV_proximo_estado.ACESSO_MEMORIA_586~combout\ <= NOT \Controle|proximo_estado.ACESSO_MEMORIA_586~combout\;
\Controle|ALT_INV_proximo_estado.DECODIFICA_2_670~combout\ <= NOT \Controle|proximo_estado.DECODIFICA_2_670~combout\;
\Controle|ALT_INV_proximo_estado.ESPERA_714~combout\ <= NOT \Controle|proximo_estado.ESPERA_714~combout\;
\ULA|ALT_INV_resultado\(1) <= NOT \ULA|resultado\(1);
\ULA|ALT_INV_resultado\(0) <= NOT \ULA|resultado\(0);
\ULA|ALT_INV_resultado\(2) <= NOT \ULA|resultado\(2);
\ULA|ALT_INV_resultado\(3) <= NOT \ULA|resultado\(3);
\ULA|ALT_INV_resultado\(4) <= NOT \ULA|resultado\(4);
\ULA|ALT_INV_resultado\(6) <= NOT \ULA|resultado\(6);
\ULA|ALT_INV_resultado\(5) <= NOT \ULA|resultado\(5);
\ULA|ALT_INV_result\(7) <= NOT \ULA|result\(7);
\ULA|ALT_INV_result\(6) <= NOT \ULA|result\(6);
\ULA|ALT_INV_result\(5) <= NOT \ULA|result\(5);
\ULA|ALT_INV_result\(4) <= NOT \ULA|result\(4);
\Controle|ALT_INV_proximo_estado.NAO_PULOU_520~combout\ <= NOT \Controle|proximo_estado.NAO_PULOU_520~combout\;
\Controle|ALT_INV_proximo_estado.SALTO_ADR_608~combout\ <= NOT \Controle|proximo_estado.SALTO_ADR_608~combout\;
\Controle|ALT_INV_proximo_estado.PULANDO_542~combout\ <= NOT \Controle|proximo_estado.PULANDO_542~combout\;
\Controle|ALT_INV_proximo_estado.BUSCA_703~combout\ <= NOT \Controle|proximo_estado.BUSCA_703~combout\;
\Controle|ALT_INV_proximo_estado.DECODIFICA_681~combout\ <= NOT \Controle|proximo_estado.DECODIFICA_681~combout\;
\ULA|ALT_INV_result\(3) <= NOT \ULA|result\(3);
\ULA|ALT_INV_result\(2) <= NOT \ULA|result\(2);
\ULA|ALT_INV_result\(1) <= NOT \ULA|result\(1);
\Controle|ALT_INV_ula_code\(0) <= NOT \Controle|ula_code\(0);
\Controle|ALT_INV_ula_code\(1) <= NOT \Controle|ula_code\(1);
\Controle|ALT_INV_ula_code\(2) <= NOT \Controle|ula_code\(2);
\Controle|ALT_INV_ula_code\(3) <= NOT \Controle|ula_code\(3);
\ULA|ALT_INV_result\(0) <= NOT \ULA|result\(0);
\Controle|ALT_INV_opcode_memory\(2) <= NOT \Controle|opcode_memory\(2);
\Controle|ALT_INV_opcode_memory\(3) <= NOT \Controle|opcode_memory\(3);
\Controle|ALT_INV_opcode_memory\(0) <= NOT \Controle|opcode_memory\(0);
\Controle|ALT_INV_opcode_memory\(1) <= NOT \Controle|opcode_memory\(1);
\Controle|ALT_INV_reg_select_memory\(3) <= NOT \Controle|reg_select_memory\(3);
\Controle|ALT_INV_reg_select_memory\(2) <= NOT \Controle|reg_select_memory\(2);
\ULA|ALT_INV_Equal0~1_combout\ <= NOT \ULA|Equal0~1_combout\;
\Controle|ALT_INV_Selector18~2_combout\ <= NOT \Controle|Selector18~2_combout\;
\Controle|ALT_INV_Selector18~1_combout\ <= NOT \Controle|Selector18~1_combout\;
\Controle|ALT_INV_Selector18~0_combout\ <= NOT \Controle|Selector18~0_combout\;
\Controle|ALT_INV_Selector33~0_combout\ <= NOT \Controle|Selector33~0_combout\;
\Controle|ALT_INV_Mux5~0_combout\ <= NOT \Controle|Mux5~0_combout\;
\Controle|ALT_INV_Selector32~1_combout\ <= NOT \Controle|Selector32~1_combout\;
\Controle|ALT_INV_Selector32~0_combout\ <= NOT \Controle|Selector32~0_combout\;
\Controle|ALT_INV_Selector7~1_combout\ <= NOT \Controle|Selector7~1_combout\;
\Controle|ALT_INV_Selector42~3_combout\ <= NOT \Controle|Selector42~3_combout\;
\Controle|ALT_INV_Selector42~2_combout\ <= NOT \Controle|Selector42~2_combout\;
\Controle|ALT_INV_Selector42~1_combout\ <= NOT \Controle|Selector42~1_combout\;
\ULA|ALT_INV_Mux21~0_combout\ <= NOT \ULA|Mux21~0_combout\;
\ULA|ALT_INV_Mux19~0_combout\ <= NOT \ULA|Mux19~0_combout\;
\ULA|ALT_INV_Mux1~0_combout\ <= NOT \ULA|Mux1~0_combout\;
\ULA|ALT_INV_Mux22~0_combout\ <= NOT \ULA|Mux22~0_combout\;
\ULA|ALT_INV_Mux23~0_combout\ <= NOT \ULA|Mux23~0_combout\;
\ULA|ALT_INV_Mux24~0_combout\ <= NOT \ULA|Mux24~0_combout\;
\ULA|ALT_INV_Mux26~0_combout\ <= NOT \ULA|Mux26~0_combout\;
\ULA|ALT_INV_Mux3~4_combout\ <= NOT \ULA|Mux3~4_combout\;
\ULA|ALT_INV_Mux25~0_combout\ <= NOT \ULA|Mux25~0_combout\;
\ULA|ALT_INV_Mux17~1_combout\ <= NOT \ULA|Mux17~1_combout\;
\ULA|ALT_INV_Mux17~0_combout\ <= NOT \ULA|Mux17~0_combout\;
\ULA|ALT_INV_Mux16~0_combout\ <= NOT \ULA|Mux16~0_combout\;
\ULA|ALT_INV_Mux15~0_combout\ <= NOT \ULA|Mux15~0_combout\;
\ULA|ALT_INV_Mux14~0_combout\ <= NOT \ULA|Mux14~0_combout\;
\Controle|ALT_INV_Selector0~0_combout\ <= NOT \Controle|Selector0~0_combout\;
\Controle|ALT_INV_Selector27~0_combout\ <= NOT \Controle|Selector27~0_combout\;
\Controle|ALT_INV_Mux13~0_combout\ <= NOT \Controle|Mux13~0_combout\;
\Controle|ALT_INV_Selector40~2_combout\ <= NOT \Controle|Selector40~2_combout\;
\Controle|ALT_INV_Selector40~1_combout\ <= NOT \Controle|Selector40~1_combout\;
\Controle|ALT_INV_Mux19~0_combout\ <= NOT \Controle|Mux19~0_combout\;
\Controle|ALT_INV_Selector40~0_combout\ <= NOT \Controle|Selector40~0_combout\;
\Controle|ALT_INV_Selector41~0_combout\ <= NOT \Controle|Selector41~0_combout\;
\Controle|ALT_INV_Mux2~0_combout\ <= NOT \Controle|Mux2~0_combout\;
\ULA|ALT_INV_Mux0~0_combout\ <= NOT \ULA|Mux0~0_combout\;
\ULA|ALT_INV_Mux11~0_combout\ <= NOT \ULA|Mux11~0_combout\;
\ULA|ALT_INV_Mux12~0_combout\ <= NOT \ULA|Mux12~0_combout\;
\Controle|ALT_INV_Selector5~0_combout\ <= NOT \Controle|Selector5~0_combout\;
\Controle|ALT_INV_Selector4~0_combout\ <= NOT \Controle|Selector4~0_combout\;
\Controle|ALT_INV_Selector3~0_combout\ <= NOT \Controle|Selector3~0_combout\;
\Controle|ALT_INV_Selector2~0_combout\ <= NOT \Controle|Selector2~0_combout\;
\ULA|ALT_INV_Mux13~0_combout\ <= NOT \ULA|Mux13~0_combout\;
\ULA|ALT_INV_Mux10~2_combout\ <= NOT \ULA|Mux10~2_combout\;
\Controle|ALT_INV_Selector11~0_combout\ <= NOT \Controle|Selector11~0_combout\;
\Controle|ALT_INV_Selector12~0_combout\ <= NOT \Controle|Selector12~0_combout\;
\Controle|ALT_INV_Selector42~0_combout\ <= NOT \Controle|Selector42~0_combout\;
\ULA|ALT_INV_Mux10~0_combout\ <= NOT \ULA|Mux10~0_combout\;
\ULA|ALT_INV_Mux7~0_combout\ <= NOT \ULA|Mux7~0_combout\;
\ULA|ALT_INV_Mux8~0_combout\ <= NOT \ULA|Mux8~0_combout\;
\ULA|ALT_INV_Mux6~1_combout\ <= NOT \ULA|Mux6~1_combout\;
\ULA|ALT_INV_Mux6~0_combout\ <= NOT \ULA|Mux6~0_combout\;
\ALT_INV_switches[7]~input_o\ <= NOT \switches[7]~input_o\;
\ALT_INV_switches[6]~input_o\ <= NOT \switches[6]~input_o\;
\ALT_INV_switches[5]~input_o\ <= NOT \switches[5]~input_o\;
\ALT_INV_switches[4]~input_o\ <= NOT \switches[4]~input_o\;
\ALT_INV_switches[3]~input_o\ <= NOT \switches[3]~input_o\;
\ALT_INV_switches[2]~input_o\ <= NOT \switches[2]~input_o\;
\ALT_INV_switches[1]~input_o\ <= NOT \switches[1]~input_o\;

-- Location: IOOBUF_X0_Y18_N79
\leds[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Saida|output_reg\(0),
	devoe => ww_devoe,
	o => ww_leds(0));

-- Location: IOOBUF_X0_Y18_N96
\leds[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Saida|output_reg\(1),
	devoe => ww_devoe,
	o => ww_leds(1));

-- Location: IOOBUF_X0_Y18_N62
\leds[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Saida|output_reg\(2),
	devoe => ww_devoe,
	o => ww_leds(2));

-- Location: IOOBUF_X0_Y18_N45
\leds[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Saida|output_reg\(3),
	devoe => ww_devoe,
	o => ww_leds(3));

-- Location: IOOBUF_X0_Y19_N39
\leds[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Saida|output_reg\(4),
	devoe => ww_devoe,
	o => ww_leds(4));

-- Location: IOOBUF_X0_Y19_N56
\leds[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Saida|output_reg\(5),
	devoe => ww_devoe,
	o => ww_leds(5));

-- Location: IOOBUF_X0_Y19_N5
\leds[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Saida|output_reg\(6),
	devoe => ww_devoe,
	o => ww_leds(6));

-- Location: IOOBUF_X0_Y19_N22
\leds[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Saida|output_reg\(7),
	devoe => ww_devoe,
	o => ww_leds(7));

-- Location: IOOBUF_X52_Y0_N53
\hex0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_Driver|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(0));

-- Location: IOOBUF_X51_Y0_N36
\hex0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_Driver|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(1));

-- Location: IOOBUF_X48_Y0_N76
\hex0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_Driver|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(2));

-- Location: IOOBUF_X50_Y0_N36
\hex0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_Driver|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(3));

-- Location: IOOBUF_X48_Y0_N93
\hex0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_Driver|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(4));

-- Location: IOOBUF_X50_Y0_N53
\hex0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_Driver|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(5));

-- Location: IOOBUF_X46_Y0_N36
\hex0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX0_Driver|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(6));

-- Location: IOOBUF_X44_Y0_N36
\hex1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_Driver|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(0));

-- Location: IOOBUF_X40_Y0_N93
\hex1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_Driver|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(1));

-- Location: IOOBUF_X44_Y0_N53
\hex1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_Driver|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(2));

-- Location: IOOBUF_X43_Y0_N36
\hex1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_Driver|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(3));

-- Location: IOOBUF_X38_Y0_N36
\hex1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_Driver|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(4));

-- Location: IOOBUF_X43_Y0_N53
\hex1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_Driver|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(5));

-- Location: IOOBUF_X51_Y0_N53
\hex1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX1_Driver|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(6));

-- Location: IOOBUF_X48_Y0_N42
\hex2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_Driver|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_hex2(0));

-- Location: IOOBUF_X38_Y0_N53
\hex2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_Driver|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_hex2(1));

-- Location: IOOBUF_X22_Y0_N53
\hex2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_Driver|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_hex2(2));

-- Location: IOOBUF_X36_Y0_N19
\hex2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_Driver|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_hex2(3));

-- Location: IOOBUF_X38_Y0_N19
\hex2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_Driver|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_hex2(4));

-- Location: IOOBUF_X46_Y0_N53
\hex2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_Driver|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_hex2(5));

-- Location: IOOBUF_X40_Y0_N76
\hex2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX2_Driver|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_hex2(6));

-- Location: IOOBUF_X40_Y0_N59
\hex3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_Driver|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_hex3(0));

-- Location: IOOBUF_X46_Y0_N2
\hex3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_Driver|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_hex3(1));

-- Location: IOOBUF_X40_Y0_N42
\hex3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_Driver|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_hex3(2));

-- Location: IOOBUF_X46_Y0_N19
\hex3[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_Driver|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_hex3(3));

-- Location: IOOBUF_X52_Y0_N2
\hex3[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_Driver|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_hex3(4));

-- Location: IOOBUF_X51_Y0_N2
\hex3[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_Driver|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_hex3(5));

-- Location: IOOBUF_X51_Y0_N19
\hex3[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3_Driver|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_hex3(6));

-- Location: IOOBUF_X52_Y0_N36
\hex4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_Driver|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_hex4(0));

-- Location: IOOBUF_X48_Y0_N59
\hex4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_Driver|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_hex4(1));

-- Location: IOOBUF_X44_Y0_N19
\hex4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_Driver|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_hex4(2));

-- Location: IOOBUF_X52_Y0_N19
\hex4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_Driver|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_hex4(3));

-- Location: IOOBUF_X43_Y0_N2
\hex4[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_Driver|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_hex4(4));

-- Location: IOOBUF_X36_Y0_N2
\hex4[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_Driver|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_hex4(5));

-- Location: IOOBUF_X29_Y0_N19
\hex4[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX4_Driver|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_hex4(6));

-- Location: IOOBUF_X29_Y0_N2
\hex5[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_Driver|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_hex5(0));

-- Location: IOOBUF_X22_Y0_N19
\hex5[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_Driver|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_hex5(1));

-- Location: IOOBUF_X43_Y0_N19
\hex5[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_Driver|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_hex5(2));

-- Location: IOOBUF_X50_Y0_N19
\hex5[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_Driver|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_hex5(3));

-- Location: IOOBUF_X0_Y21_N56
\hex5[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_Driver|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_hex5(4));

-- Location: IOOBUF_X0_Y21_N39
\hex5[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_Driver|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_hex5(5));

-- Location: IOOBUF_X44_Y0_N2
\hex5[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX5_Driver|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_hex5(6));

-- Location: IOOBUF_X25_Y0_N53
\debug1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Controle|Selector7~0_combout\,
	devoe => ww_devoe,
	o => ww_debug1);

-- Location: IOOBUF_X25_Y0_N2
\reg_a_saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_a(0),
	devoe => ww_devoe,
	o => ww_reg_a_saida(0));

-- Location: IOOBUF_X24_Y0_N2
\reg_a_saida[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_a(1),
	devoe => ww_devoe,
	o => ww_reg_a_saida(1));

-- Location: IOOBUF_X50_Y0_N2
\reg_a_saida[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_a(2),
	devoe => ww_devoe,
	o => ww_reg_a_saida(2));

-- Location: IOOBUF_X16_Y0_N93
\reg_a_saida[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_a(3),
	devoe => ww_devoe,
	o => ww_reg_a_saida(3));

-- Location: IOOBUF_X25_Y0_N36
\reg_a_saida[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_a(4),
	devoe => ww_devoe,
	o => ww_reg_a_saida(4));

-- Location: IOOBUF_X32_Y45_N76
\reg_a_saida[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_a(5),
	devoe => ww_devoe,
	o => ww_reg_a_saida(5));

-- Location: IOOBUF_X38_Y45_N53
\reg_a_saida[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_a(6),
	devoe => ww_devoe,
	o => ww_reg_a_saida(6));

-- Location: IOOBUF_X19_Y0_N53
\reg_a_saida[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_a(7),
	devoe => ww_devoe,
	o => ww_reg_a_saida(7));

-- Location: IOOBUF_X34_Y45_N19
\reg_b_saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_b(0),
	devoe => ww_devoe,
	o => ww_reg_b_saida(0));

-- Location: IOOBUF_X34_Y45_N2
\reg_b_saida[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_b(1),
	devoe => ww_devoe,
	o => ww_reg_b_saida(1));

-- Location: IOOBUF_X29_Y0_N36
\reg_b_saida[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_b(2),
	devoe => ww_devoe,
	o => ww_reg_b_saida(2));

-- Location: IOOBUF_X24_Y0_N53
\reg_b_saida[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_b(3),
	devoe => ww_devoe,
	o => ww_reg_b_saida(3));

-- Location: IOOBUF_X23_Y0_N42
\reg_b_saida[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_b(4),
	devoe => ww_devoe,
	o => ww_reg_b_saida(4));

-- Location: IOOBUF_X25_Y0_N19
\reg_b_saida[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_b(5),
	devoe => ww_devoe,
	o => ww_reg_b_saida(5));

-- Location: IOOBUF_X38_Y45_N2
\reg_b_saida[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_b(6),
	devoe => ww_devoe,
	o => ww_reg_b_saida(6));

-- Location: IOOBUF_X24_Y0_N19
\reg_b_saida[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_b(7),
	devoe => ww_devoe,
	o => ww_reg_b_saida(7));

-- Location: IOOBUF_X38_Y45_N19
\reg_r_saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_r(0),
	devoe => ww_devoe,
	o => ww_reg_r_saida(0));

-- Location: IOOBUF_X18_Y0_N53
\reg_r_saida[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_r(1),
	devoe => ww_devoe,
	o => ww_reg_r_saida(1));

-- Location: IOOBUF_X16_Y0_N76
\reg_r_saida[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_r(2),
	devoe => ww_devoe,
	o => ww_reg_r_saida(2));

-- Location: IOOBUF_X23_Y0_N59
\reg_r_saida[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_r(3),
	devoe => ww_devoe,
	o => ww_reg_r_saida(3));

-- Location: IOOBUF_X29_Y0_N53
\reg_r_saida[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_r(4),
	devoe => ww_devoe,
	o => ww_reg_r_saida(4));

-- Location: IOOBUF_X24_Y0_N36
\reg_r_saida[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_r(5),
	devoe => ww_devoe,
	o => ww_reg_r_saida(5));

-- Location: IOOBUF_X38_Y45_N36
\reg_r_saida[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_r(6),
	devoe => ww_devoe,
	o => ww_reg_r_saida(6));

-- Location: IOOBUF_X23_Y0_N76
\reg_r_saida[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => reg_r(7),
	devoe => ww_devoe,
	o => ww_reg_r_saida(7));

-- Location: IOOBUF_X0_Y20_N56
\zero~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \zero_flag~q\,
	devoe => ww_devoe,
	o => ww_zero);

-- Location: IOOBUF_X0_Y20_N39
\sign~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sign_flag~q\,
	devoe => ww_devoe,
	o => ww_sign);

-- Location: IOOBUF_X33_Y0_N93
\overflow~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \overflow_flag~q\,
	devoe => ww_devoe,
	o => ww_overflow);

-- Location: IOOBUF_X32_Y45_N42
\carry~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \carry_flag~q\,
	devoe => ww_devoe,
	o => ww_carry);

-- Location: IOOBUF_X38_Y0_N2
\estado_atual[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Controle|WideOr4~combout\,
	devoe => ww_devoe,
	o => ww_estado_atual(0));

-- Location: IOOBUF_X54_Y14_N79
\estado_atual[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Controle|WideOr3~combout\,
	devoe => ww_devoe,
	o => ww_estado_atual(1));

-- Location: IOOBUF_X23_Y0_N93
\estado_atual[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Controle|WideOr2~combout\,
	devoe => ww_devoe,
	o => ww_estado_atual(2));

-- Location: IOOBUF_X33_Y0_N76
\estado_atual[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Controle|WideOr1~combout\,
	devoe => ww_devoe,
	o => ww_estado_atual(3));

-- Location: IOOBUF_X54_Y14_N96
\estado_atual[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Controle|WideOr0~combout\,
	devoe => ww_devoe,
	o => ww_estado_atual(4));

-- Location: IOIBUF_X11_Y0_N35
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G5
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: IOIBUF_X33_Y0_N41
\switches[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(0),
	o => \switches[0]~input_o\);

-- Location: LABCELL_X39_Y5_N0
\PC|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC|Add0~1_sumout\ = SUM(( \PC|pc\(0) ) + ( VCC ) + ( !VCC ))
-- \PC|Add0~2\ = CARRY(( \PC|pc\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_pc\(0),
	cin => GND,
	sumout => \PC|Add0~1_sumout\,
	cout => \PC|Add0~2\);

-- Location: IOIBUF_X10_Y0_N92
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LABCELL_X39_Y5_N3
\PC|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC|Add0~5_sumout\ = SUM(( \PC|pc\(1) ) + ( GND ) + ( \PC|Add0~2\ ))
-- \PC|Add0~6\ = CARRY(( \PC|pc\(1) ) + ( GND ) + ( \PC|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_pc\(1),
	cin => \PC|Add0~2\,
	sumout => \PC|Add0~5_sumout\,
	cout => \PC|Add0~6\);

-- Location: LABCELL_X39_Y5_N6
\PC|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC|Add0~9_sumout\ = SUM(( \PC|pc\(2) ) + ( GND ) + ( \PC|Add0~6\ ))
-- \PC|Add0~10\ = CARRY(( \PC|pc\(2) ) + ( GND ) + ( \PC|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_pc\(2),
	cin => \PC|Add0~6\,
	sumout => \PC|Add0~9_sumout\,
	cout => \PC|Add0~10\);

-- Location: LABCELL_X39_Y5_N9
\PC|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC|Add0~13_sumout\ = SUM(( \PC|pc\(3) ) + ( GND ) + ( \PC|Add0~10\ ))
-- \PC|Add0~14\ = CARRY(( \PC|pc\(3) ) + ( GND ) + ( \PC|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_pc\(3),
	cin => \PC|Add0~10\,
	sumout => \PC|Add0~13_sumout\,
	cout => \PC|Add0~14\);

-- Location: FF_X39_Y5_N11
\PC|pc[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \PC|Add0~13_sumout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3),
	clrn => \reset~input_o\,
	sload => \Controle|estado.PULANDO~q\,
	ena => \Controle|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|pc\(3));

-- Location: MLABCELL_X42_Y5_N51
\mem_address[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem_address[3]~feeder_combout\ = \PC|pc\(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \PC|ALT_INV_pc\(3),
	combout => \mem_address[3]~feeder_combout\);

-- Location: MLABCELL_X34_Y6_N24
\Controle|reg_select_memory[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|reg_select_memory\(3) = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3) & ( (\Controle|estado.DECODIFICA~q\) # (\Controle|reg_select_memory\(3)) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3) & ( 
-- (\Controle|reg_select_memory\(3) & !\Controle|estado.DECODIFICA~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000001011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_reg_select_memory\(3),
	datac => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(3),
	combout => \Controle|reg_select_memory\(3));

-- Location: LABCELL_X39_Y5_N12
\PC|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC|Add0~17_sumout\ = SUM(( \PC|pc\(4) ) + ( GND ) + ( \PC|Add0~14\ ))
-- \PC|Add0~18\ = CARRY(( \PC|pc\(4) ) + ( GND ) + ( \PC|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_pc\(4),
	cin => \PC|Add0~14\,
	sumout => \PC|Add0~17_sumout\,
	cout => \PC|Add0~18\);

-- Location: LABCELL_X39_Y5_N15
\PC|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC|Add0~21_sumout\ = SUM(( \PC|pc\(5) ) + ( GND ) + ( \PC|Add0~18\ ))
-- \PC|Add0~22\ = CARRY(( \PC|pc\(5) ) + ( GND ) + ( \PC|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_pc\(5),
	cin => \PC|Add0~18\,
	sumout => \PC|Add0~21_sumout\,
	cout => \PC|Add0~22\);

-- Location: FF_X39_Y5_N17
\PC|pc[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \PC|Add0~21_sumout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5),
	clrn => \reset~input_o\,
	sload => \Controle|estado.PULANDO~q\,
	ena => \Controle|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|pc\(5));

-- Location: MLABCELL_X42_Y5_N21
\mem_address[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem_address[5]~feeder_combout\ = ( \PC|pc\(5) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \PC|ALT_INV_pc\(5),
	combout => \mem_address[5]~feeder_combout\);

-- Location: IOIBUF_X36_Y0_N52
\switches[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(5),
	o => \switches[5]~input_o\);

-- Location: LABCELL_X41_Y5_N24
\Controle|proximo_estado.ESPERA_MEMORIA_575\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.ESPERA_MEMORIA_575~combout\ = ( \Controle|estado.ACESSO_MEMORIA~q\ & ( (\Controle|proximo_estado.ESPERA_MEMORIA_575~combout\) # (\Controle|Selector41~0_combout\) ) ) # ( !\Controle|estado.ACESSO_MEMORIA~q\ & ( 
-- (!\Controle|Selector41~0_combout\ & \Controle|proximo_estado.ESPERA_MEMORIA_575~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101001011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector41~0_combout\,
	datac => \Controle|ALT_INV_proximo_estado.ESPERA_MEMORIA_575~combout\,
	dataf => \Controle|ALT_INV_estado.ACESSO_MEMORIA~q\,
	combout => \Controle|proximo_estado.ESPERA_MEMORIA_575~combout\);

-- Location: FF_X40_Y5_N41
\Controle|estado.ESPERA_MEMORIA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \Controle|proximo_estado.ESPERA_MEMORIA_575~combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.ESPERA_MEMORIA~q\);

-- Location: LABCELL_X40_Y5_N48
\Controle|proximo_estado.ESPERA_MEMORIA_2_564\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.ESPERA_MEMORIA_2_564~combout\ = ( \Controle|estado.ESPERA_MEMORIA~q\ & ( (\Controle|proximo_estado.ESPERA_MEMORIA_2_564~combout\) # (\Controle|Selector41~0_combout\) ) ) # ( !\Controle|estado.ESPERA_MEMORIA~q\ & ( 
-- (!\Controle|Selector41~0_combout\ & \Controle|proximo_estado.ESPERA_MEMORIA_2_564~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_Selector41~0_combout\,
	datad => \Controle|ALT_INV_proximo_estado.ESPERA_MEMORIA_2_564~combout\,
	dataf => \Controle|ALT_INV_estado.ESPERA_MEMORIA~q\,
	combout => \Controle|proximo_estado.ESPERA_MEMORIA_2_564~combout\);

-- Location: FF_X40_Y5_N50
\Controle|estado.ESPERA_MEMORIA_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|proximo_estado.ESPERA_MEMORIA_2_564~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.ESPERA_MEMORIA_2~q\);

-- Location: MLABCELL_X37_Y5_N39
\Controle|opcode_memory[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|opcode_memory\(3) = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & ( (\Controle|estado.DECODIFICA~q\) # (\Controle|opcode_memory\(3)) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & ( 
-- (\Controle|opcode_memory\(3) & !\Controle|estado.DECODIFICA~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_opcode_memory\(3),
	datad => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	combout => \Controle|opcode_memory\(3));

-- Location: MLABCELL_X37_Y5_N3
\Controle|opcode_memory[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|opcode_memory\(0) = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( (\Controle|estado.DECODIFICA~q\) # (\Controle|opcode_memory\(0)) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( 
-- (\Controle|opcode_memory\(0) & !\Controle|estado.DECODIFICA~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_opcode_memory\(0),
	datad => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	combout => \Controle|opcode_memory\(0));

-- Location: MLABCELL_X34_Y5_N18
\reg_b[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b[0]~2_combout\ = ( \Controle|opcode_memory\(3) & ( \Controle|opcode_memory\(0) & ( (!\Controle|estado.MOVER~q\ & (((!\Controle|estado.ESPERA_MEMORIA_2~q\) # (\Controle|opcode_memory\(2))) # (\Controle|opcode_memory\(1)))) ) ) ) # ( 
-- !\Controle|opcode_memory\(3) & ( \Controle|opcode_memory\(0) & ( !\Controle|estado.MOVER~q\ ) ) ) # ( \Controle|opcode_memory\(3) & ( !\Controle|opcode_memory\(0) & ( !\Controle|estado.MOVER~q\ ) ) ) # ( !\Controle|opcode_memory\(3) & ( 
-- !\Controle|opcode_memory\(0) & ( !\Controle|estado.MOVER~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001101000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_opcode_memory\(1),
	datab => \Controle|ALT_INV_estado.ESPERA_MEMORIA_2~q\,
	datac => \Controle|ALT_INV_estado.MOVER~q\,
	datad => \Controle|ALT_INV_opcode_memory\(2),
	datae => \Controle|ALT_INV_opcode_memory\(3),
	dataf => \Controle|ALT_INV_opcode_memory\(0),
	combout => \reg_b[0]~2_combout\);

-- Location: MLABCELL_X34_Y5_N45
\Controle|Selector9~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector9~2_combout\ = ( \Controle|reg_select_memory\(3) & ( (!\Controle|WideOr26~0_combout\) # (\Controle|estado.ACESSO_IO~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datad => \Controle|ALT_INV_WideOr26~0_combout\,
	dataf => \Controle|ALT_INV_reg_select_memory\(3),
	combout => \Controle|Selector9~2_combout\);

-- Location: MLABCELL_X37_Y5_N33
\Controle|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector9~0_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3) & ( (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & (\Controle|estado.DECODIFICA~q\ & 
-- ((!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0)) # (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000101010000000000010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(2),
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	datad => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(3),
	combout => \Controle|Selector9~0_combout\);

-- Location: LABCELL_X35_Y5_N15
\Controle|reg_select_memory[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|reg_select_memory\(2) = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & ( (\Controle|estado.DECODIFICA~q\) # (\Controle|reg_select_memory\(2)) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & ( 
-- (\Controle|reg_select_memory\(2) & !\Controle|estado.DECODIFICA~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_reg_select_memory\(2),
	datad => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(2),
	combout => \Controle|reg_select_memory\(2));

-- Location: MLABCELL_X34_Y5_N3
\Controle|Selector10~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector10~2_combout\ = ( \Controle|reg_select_memory\(2) & ( (!\Controle|WideOr26~0_combout\) # (\Controle|estado.ACESSO_IO~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datad => \Controle|ALT_INV_WideOr26~0_combout\,
	dataf => \Controle|ALT_INV_reg_select_memory\(2),
	combout => \Controle|Selector10~2_combout\);

-- Location: LABCELL_X35_Y5_N6
\reg_r[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r[3]~1_combout\ = ( !\Controle|Selector10~2_combout\ & ( (!\Controle|Selector10~0_combout\ & (!\reg_b[0]~2_combout\ & ((\Controle|Selector9~0_combout\) # (\Controle|Selector9~2_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100010001000000010001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector10~0_combout\,
	datab => \ALT_INV_reg_b[0]~2_combout\,
	datac => \Controle|ALT_INV_Selector9~2_combout\,
	datad => \Controle|ALT_INV_Selector9~0_combout\,
	dataf => \Controle|ALT_INV_Selector10~2_combout\,
	combout => \reg_r[3]~1_combout\);

-- Location: MLABCELL_X37_Y7_N48
\Controle|Selector7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector7~1_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0) & ( (\Controle|estado.DECODIFICA~q\ & (((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3) & 
-- \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2))) # (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1)))) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0) & ( 
-- (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3) & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & \Controle|estado.DECODIFICA~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000010100000000001101110000000000110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(3),
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(2),
	datad => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	combout => \Controle|Selector7~1_combout\);

-- Location: MLABCELL_X37_Y7_N33
\Controle|proximo_estado.PEGA_LITERAL_630\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.PEGA_LITERAL_630~combout\ = ( \Controle|Selector41~0_combout\ & ( \Controle|Selector7~1_combout\ ) ) # ( !\Controle|Selector41~0_combout\ & ( \Controle|Selector7~1_combout\ & ( \Controle|proximo_estado.PEGA_LITERAL_630~combout\ ) 
-- ) ) # ( !\Controle|Selector41~0_combout\ & ( !\Controle|Selector7~1_combout\ & ( \Controle|proximo_estado.PEGA_LITERAL_630~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000000000000000000000111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \Controle|ALT_INV_proximo_estado.PEGA_LITERAL_630~combout\,
	datae => \Controle|ALT_INV_Selector41~0_combout\,
	dataf => \Controle|ALT_INV_Selector7~1_combout\,
	combout => \Controle|proximo_estado.PEGA_LITERAL_630~combout\);

-- Location: MLABCELL_X37_Y7_N42
\Controle|estado.PEGA_LITERAL~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|estado.PEGA_LITERAL~feeder_combout\ = ( \Controle|proximo_estado.PEGA_LITERAL_630~combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Controle|ALT_INV_proximo_estado.PEGA_LITERAL_630~combout\,
	combout => \Controle|estado.PEGA_LITERAL~feeder_combout\);

-- Location: FF_X37_Y7_N44
\Controle|estado.PEGA_LITERAL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|estado.PEGA_LITERAL~feeder_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.PEGA_LITERAL~q\);

-- Location: MLABCELL_X37_Y7_N36
\Controle|proximo_estado.ESPERA_LITERAL_619\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.ESPERA_LITERAL_619~combout\ = ( \Controle|Selector41~0_combout\ & ( \Controle|estado.PEGA_LITERAL~q\ ) ) # ( !\Controle|Selector41~0_combout\ & ( \Controle|estado.PEGA_LITERAL~q\ & ( 
-- \Controle|proximo_estado.ESPERA_LITERAL_619~combout\ ) ) ) # ( !\Controle|Selector41~0_combout\ & ( !\Controle|estado.PEGA_LITERAL~q\ & ( \Controle|proximo_estado.ESPERA_LITERAL_619~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_proximo_estado.ESPERA_LITERAL_619~combout\,
	datae => \Controle|ALT_INV_Selector41~0_combout\,
	dataf => \Controle|ALT_INV_estado.PEGA_LITERAL~q\,
	combout => \Controle|proximo_estado.ESPERA_LITERAL_619~combout\);

-- Location: FF_X37_Y7_N17
\Controle|estado.ESPERA_LITERAL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \Controle|proximo_estado.ESPERA_LITERAL_619~combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.ESPERA_LITERAL~q\);

-- Location: MLABCELL_X37_Y7_N24
\Controle|proximo_estado.DECODIFICA_2_670\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.DECODIFICA_2_670~combout\ = ( \Controle|estado.ESPERA_LITERAL~q\ & ( (\Controle|Selector41~0_combout\) # (\Controle|proximo_estado.DECODIFICA_2_670~combout\) ) ) # ( !\Controle|estado.ESPERA_LITERAL~q\ & ( 
-- (\Controle|proximo_estado.DECODIFICA_2_670~combout\ & !\Controle|Selector41~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_proximo_estado.DECODIFICA_2_670~combout\,
	datad => \Controle|ALT_INV_Selector41~0_combout\,
	dataf => \Controle|ALT_INV_estado.ESPERA_LITERAL~q\,
	combout => \Controle|proximo_estado.DECODIFICA_2_670~combout\);

-- Location: FF_X37_Y7_N26
\Controle|estado.DECODIFICA_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|proximo_estado.DECODIFICA_2_670~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.DECODIFICA_2~q\);

-- Location: MLABCELL_X37_Y7_N54
\Controle|WideOr23~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|WideOr23~0_combout\ = ( !\Controle|estado.DECODIFICA_2~q\ & ( !\Controle|estado.DECODIFICA~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	combout => \Controle|WideOr23~0_combout\);

-- Location: LABCELL_X39_Y5_N18
\PC|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC|Add0~25_sumout\ = SUM(( \PC|pc\(6) ) + ( GND ) + ( \PC|Add0~22\ ))
-- \PC|Add0~26\ = CARRY(( \PC|pc\(6) ) + ( GND ) + ( \PC|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_pc\(6),
	cin => \PC|Add0~22\,
	sumout => \PC|Add0~25_sumout\,
	cout => \PC|Add0~26\);

-- Location: FF_X39_Y5_N20
\PC|pc[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \PC|Add0~25_sumout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6),
	clrn => \reset~input_o\,
	sload => \Controle|estado.PULANDO~q\,
	ena => \Controle|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|pc\(6));

-- Location: MLABCELL_X42_Y5_N0
\mem_address[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem_address[6]~feeder_combout\ = \PC|pc\(6)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \PC|ALT_INV_pc\(6),
	combout => \mem_address[6]~feeder_combout\);

-- Location: MLABCELL_X34_Y6_N18
\reg_literal[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal[6]~feeder_combout\ = reg_inter_2(6)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(6),
	combout => \reg_literal[6]~feeder_combout\);

-- Location: LABCELL_X35_Y4_N54
\reg_literal~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal~0_combout\ = ( \Controle|reg_select_memory\(2) & ( (!\Controle|estado.MOVER~q\) # (!\Controle|reg_select_memory\(3)) ) ) # ( !\Controle|reg_select_memory\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111100001111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_estado.MOVER~q\,
	datad => \Controle|ALT_INV_reg_select_memory\(3),
	dataf => \Controle|ALT_INV_reg_select_memory\(2),
	combout => \reg_literal~0_combout\);

-- Location: MLABCELL_X34_Y6_N15
\reg_literal[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal[2]~1_combout\ = ( \Controle|reg_select_memory\(3) & ( (!\Controle|estado.ESPERA_LITERAL~q\ & ((!\Controle|reg_select_memory\(2)) # (!\Controle|estado.MOVER~q\))) ) ) # ( !\Controle|reg_select_memory\(3) & ( !\Controle|estado.ESPERA_LITERAL~q\ 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101000001010101010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.ESPERA_LITERAL~q\,
	datac => \Controle|ALT_INV_reg_select_memory\(2),
	datad => \Controle|ALT_INV_estado.MOVER~q\,
	dataf => \Controle|ALT_INV_reg_select_memory\(3),
	combout => \reg_literal[2]~1_combout\);

-- Location: MLABCELL_X37_Y5_N21
\Controle|read_enable~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|read_enable~0_combout\ = ( \Controle|opcode_memory\(0) & ( (!\Controle|opcode_memory\(1) & (\Controle|estado.ESPERA_MEMORIA_2~q\ & (\Controle|opcode_memory\(3) & !\Controle|opcode_memory\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_opcode_memory\(1),
	datab => \Controle|ALT_INV_estado.ESPERA_MEMORIA_2~q\,
	datac => \Controle|ALT_INV_opcode_memory\(3),
	datad => \Controle|ALT_INV_opcode_memory\(2),
	dataf => \Controle|ALT_INV_opcode_memory\(0),
	combout => \Controle|read_enable~0_combout\);

-- Location: MLABCELL_X34_Y6_N6
\reg_literal[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal[2]~2_combout\ = ( \Controle|Selector9~2_combout\ & ( \Controle|Selector10~2_combout\ & ( (!\reg_literal[2]~1_combout\) # (\Controle|read_enable~0_combout\) ) ) ) # ( !\Controle|Selector9~2_combout\ & ( \Controle|Selector10~2_combout\ & ( 
-- (!\reg_literal[2]~1_combout\) # ((\Controle|Selector9~0_combout\ & \Controle|read_enable~0_combout\)) ) ) ) # ( \Controle|Selector9~2_combout\ & ( !\Controle|Selector10~2_combout\ & ( (!\reg_literal[2]~1_combout\) # ((\Controle|Selector10~0_combout\ & 
-- \Controle|read_enable~0_combout\)) ) ) ) # ( !\Controle|Selector9~2_combout\ & ( !\Controle|Selector10~2_combout\ & ( (!\reg_literal[2]~1_combout\) # ((\Controle|Selector9~0_combout\ & (\Controle|Selector10~0_combout\ & \Controle|read_enable~0_combout\))) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001101110011001100111111001100110111011100110011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector9~0_combout\,
	datab => \ALT_INV_reg_literal[2]~1_combout\,
	datac => \Controle|ALT_INV_Selector10~0_combout\,
	datad => \Controle|ALT_INV_read_enable~0_combout\,
	datae => \Controle|ALT_INV_Selector9~2_combout\,
	dataf => \Controle|ALT_INV_Selector10~2_combout\,
	combout => \reg_literal[2]~2_combout\);

-- Location: FF_X34_Y6_N20
\reg_literal[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_literal[6]~feeder_combout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6),
	clrn => \reset~input_o\,
	sload => \reg_literal~0_combout\,
	ena => \reg_literal[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_literal(6));

-- Location: IOIBUF_X34_Y0_N52
\switches[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(6),
	o => \switches[6]~input_o\);

-- Location: LABCELL_X41_Y5_N54
\reg_b~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b~0_combout\ = ( \Controle|reg_select_memory\(2) & ( (\Controle|estado.MOVER~q\ & !\Controle|reg_select_memory\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.MOVER~q\,
	datac => \Controle|ALT_INV_reg_select_memory\(3),
	dataf => \Controle|ALT_INV_reg_select_memory\(2),
	combout => \reg_b~0_combout\);

-- Location: LABCELL_X32_Y5_N48
\reg_b~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b~9_combout\ = ( \reg_b~0_combout\ & ( \Controle|Selector10~1_combout\ & ( reg_inter_2(6) ) ) ) # ( !\reg_b~0_combout\ & ( \Controle|Selector10~1_combout\ & ( \switches[6]~input_o\ ) ) ) # ( \reg_b~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( 
-- reg_inter_2(6) ) ) ) # ( !\reg_b~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( (!\reg_a~1_combout\ & ((\switches[6]~input_o\))) # (\reg_a~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000000001111111100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	datab => \ALT_INV_reg_a~1_combout\,
	datac => \ALT_INV_switches[6]~input_o\,
	datad => ALT_INV_reg_inter_2(6),
	datae => \ALT_INV_reg_b~0_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_b~9_combout\);

-- Location: LABCELL_X35_Y5_N12
\Controle|input_enable~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|input_enable~0_combout\ = ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & ( (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & 
-- (\Controle|estado.ACESSO_IO~q\ & \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	datac => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	combout => \Controle|input_enable~0_combout\);

-- Location: LABCELL_X35_Y5_N18
\reg_b[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b[0]~3_combout\ = ( \Controle|Selector10~0_combout\ & ( !\Controle|Selector9~2_combout\ & ( (!\Controle|Selector9~0_combout\ & ((!\reg_b[0]~2_combout\) # (\Controle|input_enable~0_combout\))) ) ) ) # ( !\Controle|Selector10~0_combout\ & ( 
-- !\Controle|Selector9~2_combout\ & ( (\Controle|Selector10~2_combout\ & (!\Controle|Selector9~0_combout\ & ((!\reg_b[0]~2_combout\) # (\Controle|input_enable~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000110000101000001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_b[0]~2_combout\,
	datab => \Controle|ALT_INV_Selector10~2_combout\,
	datac => \Controle|ALT_INV_Selector9~0_combout\,
	datad => \Controle|ALT_INV_input_enable~0_combout\,
	datae => \Controle|ALT_INV_Selector10~0_combout\,
	dataf => \Controle|ALT_INV_Selector9~2_combout\,
	combout => \reg_b[0]~3_combout\);

-- Location: FF_X32_Y5_N50
\reg_b[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_b~9_combout\,
	clrn => \reset~input_o\,
	ena => \reg_b[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_b(6));

-- Location: MLABCELL_X34_Y5_N24
\reg_a~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a~0_combout\ = ( !\Controle|reg_select_memory\(2) & ( (!\Controle|reg_select_memory\(3) & \Controle|estado.MOVER~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_reg_select_memory\(3),
	datad => \Controle|ALT_INV_estado.MOVER~q\,
	dataf => \Controle|ALT_INV_reg_select_memory\(2),
	combout => \reg_a~0_combout\);

-- Location: LABCELL_X32_Y5_N45
\reg_a~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a~9_combout\ = ( \Controle|Selector10~1_combout\ & ( \reg_a~0_combout\ & ( reg_inter_2(6) ) ) ) # ( !\Controle|Selector10~1_combout\ & ( \reg_a~0_combout\ & ( reg_inter_2(6) ) ) ) # ( \Controle|Selector10~1_combout\ & ( !\reg_a~0_combout\ & ( 
-- (!\reg_a~1_combout\ & ((\switches[6]~input_o\))) # (\reg_a~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6))) ) ) ) # ( !\Controle|Selector10~1_combout\ & ( !\reg_a~0_combout\ & ( \switches[6]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000001011111010100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	datab => ALT_INV_reg_inter_2(6),
	datac => \ALT_INV_reg_a~1_combout\,
	datad => \ALT_INV_switches[6]~input_o\,
	datae => \Controle|ALT_INV_Selector10~1_combout\,
	dataf => \ALT_INV_reg_a~0_combout\,
	combout => \reg_a~9_combout\);

-- Location: LABCELL_X36_Y5_N18
\Controle|Selector9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector9~1_combout\ = ( !\Controle|Selector9~0_combout\ & ( (!\Controle|reg_select_memory\(3)) # ((!\Controle|estado.ACESSO_IO~q\ & \Controle|WideOr26~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011111100111100001111110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datac => \Controle|ALT_INV_reg_select_memory\(3),
	datad => \Controle|ALT_INV_WideOr26~0_combout\,
	dataf => \Controle|ALT_INV_Selector9~0_combout\,
	combout => \Controle|Selector9~1_combout\);

-- Location: LABCELL_X36_Y5_N30
\reg_a[4]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a[4]~3_combout\ = ( \Controle|Selector9~1_combout\ & ( ((\Controle|Selector10~1_combout\ & ((\Controle|read_enable~0_combout\) # (\Controle|input_enable~0_combout\)))) # (\reg_a~0_combout\) ) ) # ( !\Controle|Selector9~1_combout\ & ( 
-- ((\Controle|input_enable~0_combout\ & !\Controle|Selector10~1_combout\)) # (\reg_a~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011100110011011101110011001100110011011111110011001101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_input_enable~0_combout\,
	datab => \ALT_INV_reg_a~0_combout\,
	datac => \Controle|ALT_INV_read_enable~0_combout\,
	datad => \Controle|ALT_INV_Selector10~1_combout\,
	dataf => \Controle|ALT_INV_Selector9~1_combout\,
	combout => \reg_a[4]~3_combout\);

-- Location: FF_X32_Y5_N47
\reg_a[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_a~9_combout\,
	clrn => \reset~input_o\,
	ena => \reg_a[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_a(6));

-- Location: LABCELL_X39_Y6_N6
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( reg_literal(6) & ( \Controle|Selector9~1_combout\ & ( (!\Controle|Selector10~1_combout\ & (reg_b(6))) # (\Controle|Selector10~1_combout\ & ((reg_a(6)))) ) ) ) # ( !reg_literal(6) & ( \Controle|Selector9~1_combout\ & ( 
-- (!\Controle|Selector10~1_combout\ & (reg_b(6))) # (\Controle|Selector10~1_combout\ & ((reg_a(6)))) ) ) ) # ( reg_literal(6) & ( !\Controle|Selector9~1_combout\ & ( (!\Controle|Selector10~1_combout\) # (reg_r(6)) ) ) ) # ( !reg_literal(6) & ( 
-- !\Controle|Selector9~1_combout\ & ( (\Controle|Selector10~1_combout\ & reg_r(6)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001101110111011101100001010010111110000101001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector10~1_combout\,
	datab => ALT_INV_reg_r(6),
	datac => ALT_INV_reg_b(6),
	datad => ALT_INV_reg_a(6),
	datae => ALT_INV_reg_literal(6),
	dataf => \Controle|ALT_INV_Selector9~1_combout\,
	combout => \Mux1~0_combout\);

-- Location: FF_X39_Y6_N8
\reg_inter_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux1~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_1(6));

-- Location: MLABCELL_X37_Y5_N51
\Controle|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector2~0_combout\ = ( \Controle|opcode_memory\(3) & ( (\Controle|estado.DECODIFICA_2~q\) # (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7)) ) ) # ( !\Controle|opcode_memory\(3) & ( 
-- (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & !\Controle|estado.DECODIFICA_2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	datad => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	dataf => \Controle|ALT_INV_opcode_memory\(3),
	combout => \Controle|Selector2~0_combout\);

-- Location: LABCELL_X36_Y5_N48
\Controle|ula_code[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|ula_code\(3) = ( \Controle|Selector2~0_combout\ & ( (!\Controle|WideOr23~0_combout\) # (\Controle|ula_code\(3)) ) ) # ( !\Controle|Selector2~0_combout\ & ( (\Controle|ula_code\(3) & \Controle|WideOr23~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_ula_code\(3),
	datad => \Controle|ALT_INV_WideOr23~0_combout\,
	dataf => \Controle|ALT_INV_Selector2~0_combout\,
	combout => \Controle|ula_code\(3));

-- Location: LABCELL_X36_Y5_N0
\ULA|Mux10~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux10~2_combout\ = (!\Controle|ula_code\(3) & !\Controle|ula_code\(2))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_ula_code\(3),
	datad => \Controle|ALT_INV_ula_code\(2),
	combout => \ULA|Mux10~2_combout\);

-- Location: MLABCELL_X37_Y5_N18
\Controle|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector4~0_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & ( (!\Controle|estado.DECODIFICA_2~q\) # (\Controle|opcode_memory\(1)) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & ( 
-- (\Controle|opcode_memory\(1) & \Controle|estado.DECODIFICA_2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_opcode_memory\(1),
	datad => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	combout => \Controle|Selector4~0_combout\);

-- Location: LABCELL_X36_Y5_N33
\Controle|ula_code[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|ula_code\(1) = ( \Controle|Selector4~0_combout\ & ( (!\Controle|WideOr23~0_combout\) # (\Controle|ula_code\(1)) ) ) # ( !\Controle|Selector4~0_combout\ & ( (\Controle|WideOr23~0_combout\ & \Controle|ula_code\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_WideOr23~0_combout\,
	datad => \Controle|ALT_INV_ula_code\(1),
	dataf => \Controle|ALT_INV_Selector4~0_combout\,
	combout => \Controle|ula_code\(1));

-- Location: MLABCELL_X37_Y5_N9
\Controle|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector5~0_combout\ = ( \Controle|estado.DECODIFICA_2~q\ & ( \Controle|opcode_memory\(0) ) ) # ( !\Controle|estado.DECODIFICA_2~q\ & ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_opcode_memory\(0),
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	dataf => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	combout => \Controle|Selector5~0_combout\);

-- Location: MLABCELL_X37_Y5_N15
\Controle|ula_code[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|ula_code\(0) = ( \Controle|Selector5~0_combout\ & ( (!\Controle|WideOr23~0_combout\) # (\Controle|ula_code\(0)) ) ) # ( !\Controle|Selector5~0_combout\ & ( (\Controle|ula_code\(0) & \Controle|WideOr23~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_ula_code\(0),
	datad => \Controle|ALT_INV_WideOr23~0_combout\,
	dataf => \Controle|ALT_INV_Selector5~0_combout\,
	combout => \Controle|ula_code\(0));

-- Location: MLABCELL_X34_Y5_N6
\reg_b~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b~8_combout\ = ( \reg_a~1_combout\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & ((\switches[5]~input_o\))) # (\reg_b~0_combout\ & (reg_inter_2(5))) ) ) ) # ( !\reg_a~1_combout\ & ( \Controle|Selector10~1_combout\ & ( 
-- (!\reg_b~0_combout\ & ((\switches[5]~input_o\))) # (\reg_b~0_combout\ & (reg_inter_2(5))) ) ) ) # ( \reg_a~1_combout\ & ( !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5))) # 
-- (\reg_b~0_combout\ & ((reg_inter_2(5)))) ) ) ) # ( !\reg_a~1_combout\ & ( !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & ((\switches[5]~input_o\))) # (\reg_b~0_combout\ & (reg_inter_2(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011010100110101001100000011111100110000001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	datab => ALT_INV_reg_inter_2(5),
	datac => \ALT_INV_reg_b~0_combout\,
	datad => \ALT_INV_switches[5]~input_o\,
	datae => \ALT_INV_reg_a~1_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_b~8_combout\);

-- Location: FF_X34_Y5_N8
\reg_b[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_b~8_combout\,
	clrn => \reset~input_o\,
	ena => \reg_b[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_b(5));

-- Location: LABCELL_X36_Y7_N24
\reg_a~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a~8_combout\ = ( \switches[5]~input_o\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_a~0_combout\ & ((!\reg_a~1_combout\) # ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5))))) # (\reg_a~0_combout\ & (((reg_inter_2(5))))) ) ) ) # 
-- ( !\switches[5]~input_o\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_a~0_combout\ & (\reg_a~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5)))) # (\reg_a~0_combout\ & (((reg_inter_2(5))))) ) ) ) # ( \switches[5]~input_o\ 
-- & ( !\Controle|Selector10~1_combout\ & ( (!\reg_a~0_combout\) # (reg_inter_2(5)) ) ) ) # ( !\switches[5]~input_o\ & ( !\Controle|Selector10~1_combout\ & ( (reg_inter_2(5) & \reg_a~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111111110000111100010001000011111011101100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_a~1_combout\,
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	datac => ALT_INV_reg_inter_2(5),
	datad => \ALT_INV_reg_a~0_combout\,
	datae => \ALT_INV_switches[5]~input_o\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_a~8_combout\);

-- Location: FF_X36_Y7_N26
\reg_a[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_a~8_combout\,
	clrn => \reset~input_o\,
	ena => \reg_a[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_a(5));

-- Location: MLABCELL_X34_Y6_N27
\reg_literal[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal[5]~feeder_combout\ = reg_inter_2(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(5),
	combout => \reg_literal[5]~feeder_combout\);

-- Location: FF_X34_Y6_N29
\reg_literal[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_literal[5]~feeder_combout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5),
	clrn => \reset~input_o\,
	sload => \reg_literal~0_combout\,
	ena => \reg_literal[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_literal(5));

-- Location: LABCELL_X35_Y6_N24
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \Controle|Selector9~1_combout\ & ( \Controle|Selector10~1_combout\ & ( reg_a(5) ) ) ) # ( !\Controle|Selector9~1_combout\ & ( \Controle|Selector10~1_combout\ & ( reg_r(5) ) ) ) # ( \Controle|Selector9~1_combout\ & ( 
-- !\Controle|Selector10~1_combout\ & ( reg_b(5) ) ) ) # ( !\Controle|Selector9~1_combout\ & ( !\Controle|Selector10~1_combout\ & ( reg_literal(5) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111010101010101010100001111000011110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_b(5),
	datab => ALT_INV_reg_a(5),
	datac => ALT_INV_reg_r(5),
	datad => ALT_INV_reg_literal(5),
	datae => \Controle|ALT_INV_Selector9~1_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \Mux2~0_combout\);

-- Location: FF_X35_Y6_N26
\reg_inter_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux2~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_1(5));

-- Location: IOIBUF_X36_Y0_N35
\switches[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(4),
	o => \switches[4]~input_o\);

-- Location: MLABCELL_X34_Y5_N12
\reg_b~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b~7_combout\ = ( \reg_a~1_combout\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & ((\switches[4]~input_o\))) # (\reg_b~0_combout\ & (reg_inter_2(4))) ) ) ) # ( !\reg_a~1_combout\ & ( \Controle|Selector10~1_combout\ & ( 
-- (!\reg_b~0_combout\ & ((\switches[4]~input_o\))) # (\reg_b~0_combout\ & (reg_inter_2(4))) ) ) ) # ( \reg_a~1_combout\ & ( !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4))) # 
-- (\reg_b~0_combout\ & ((reg_inter_2(4)))) ) ) ) # ( !\reg_a~1_combout\ & ( !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & ((\switches[4]~input_o\))) # (\reg_b~0_combout\ & (reg_inter_2(4))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011010100110101001100000011111100110000001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	datab => ALT_INV_reg_inter_2(4),
	datac => \ALT_INV_reg_b~0_combout\,
	datad => \ALT_INV_switches[4]~input_o\,
	datae => \ALT_INV_reg_a~1_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_b~7_combout\);

-- Location: FF_X34_Y5_N14
\reg_b[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_b~7_combout\,
	clrn => \reset~input_o\,
	ena => \reg_b[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_b(4));

-- Location: MLABCELL_X34_Y6_N21
\reg_literal[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal[4]~feeder_combout\ = reg_inter_2(4)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_2(4),
	combout => \reg_literal[4]~feeder_combout\);

-- Location: FF_X34_Y6_N23
\reg_literal[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_literal[4]~feeder_combout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4),
	clrn => \reset~input_o\,
	sload => \reg_literal~0_combout\,
	ena => \reg_literal[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_literal(4));

-- Location: LABCELL_X36_Y7_N30
\reg_a~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a~7_combout\ = ( \reg_a~0_combout\ & ( \Controle|Selector10~1_combout\ & ( reg_inter_2(4) ) ) ) # ( !\reg_a~0_combout\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_a~1_combout\ & (\switches[4]~input_o\)) # (\reg_a~1_combout\ & 
-- ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4)))) ) ) ) # ( \reg_a~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( reg_inter_2(4) ) ) ) # ( !\reg_a~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( \switches[4]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000000001111111100100111001001110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_a~1_combout\,
	datab => \ALT_INV_switches[4]~input_o\,
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	datad => ALT_INV_reg_inter_2(4),
	datae => \ALT_INV_reg_a~0_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_a~7_combout\);

-- Location: FF_X36_Y7_N32
\reg_a[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_a~7_combout\,
	clrn => \reset~input_o\,
	ena => \reg_a[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_a(4));

-- Location: MLABCELL_X37_Y5_N12
\Controle|Selector42~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector42~0_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) & ( (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0) & (\Controle|estado.DECODIFICA~q\ & 
-- ((!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3)) # (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2))))) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) & ( (\Controle|estado.DECODIFICA~q\ 
-- & ((!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3)) # (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111010000000001111101000000000110010000000000011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(3),
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(2),
	datad => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	combout => \Controle|Selector42~0_combout\);

-- Location: MLABCELL_X37_Y5_N6
\Controle|reg_select_memory[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|reg_select_memory\(0) = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0) & ( (\Controle|reg_select_memory\(0)) # (\Controle|estado.DECODIFICA~q\) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0) & ( 
-- (!\Controle|estado.DECODIFICA~q\ & \Controle|reg_select_memory\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.DECODIFICA~q\,
	datad => \Controle|ALT_INV_reg_select_memory\(0),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	combout => \Controle|reg_select_memory\(0));

-- Location: MLABCELL_X34_Y6_N54
\Controle|Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector12~0_combout\ = ( \Controle|reg_select_memory\(0) & ( (!\Controle|WideOr26~0_combout\) # ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0) & \Controle|Selector42~0_combout\)) ) ) # ( !\Controle|reg_select_memory\(0) & ( 
-- (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0) & \Controle|Selector42~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111110101010101011111010101010101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_WideOr26~0_combout\,
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	datad => \Controle|ALT_INV_Selector42~0_combout\,
	dataf => \Controle|ALT_INV_reg_select_memory\(0),
	combout => \Controle|Selector12~0_combout\);

-- Location: LABCELL_X32_Y5_N54
\Controle|reg_select_memory[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|reg_select_memory\(1) = ( \Controle|estado.DECODIFICA~q\ & ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) ) ) # ( !\Controle|estado.DECODIFICA~q\ & ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) & ( 
-- \Controle|reg_select_memory\(1) ) ) ) # ( !\Controle|estado.DECODIFICA~q\ & ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) & ( \Controle|reg_select_memory\(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_reg_select_memory\(1),
	datae => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	combout => \Controle|reg_select_memory\(1));

-- Location: LABCELL_X32_Y6_N48
\Controle|Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector11~0_combout\ = ( \Controle|Selector42~0_combout\ & ( \Controle|reg_select_memory\(1) & ( (!\Controle|WideOr26~0_combout\) # (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1)) ) ) ) # ( !\Controle|Selector42~0_combout\ & 
-- ( \Controle|reg_select_memory\(1) & ( !\Controle|WideOr26~0_combout\ ) ) ) # ( \Controle|Selector42~0_combout\ & ( !\Controle|reg_select_memory\(1) & ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010111110000111100001111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	datac => \Controle|ALT_INV_WideOr26~0_combout\,
	datae => \Controle|ALT_INV_Selector42~0_combout\,
	dataf => \Controle|ALT_INV_reg_select_memory\(1),
	combout => \Controle|Selector11~0_combout\);

-- Location: LABCELL_X32_Y6_N12
\Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = ( \Controle|Selector12~0_combout\ & ( \Controle|Selector11~0_combout\ & ( reg_literal(4) ) ) ) # ( !\Controle|Selector12~0_combout\ & ( \Controle|Selector11~0_combout\ & ( reg_r(4) ) ) ) # ( \Controle|Selector12~0_combout\ & ( 
-- !\Controle|Selector11~0_combout\ & ( reg_b(4) ) ) ) # ( !\Controle|Selector12~0_combout\ & ( !\Controle|Selector11~0_combout\ & ( reg_a(4) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111010101010101010100001111000011110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_b(4),
	datab => ALT_INV_reg_literal(4),
	datac => ALT_INV_reg_r(4),
	datad => ALT_INV_reg_a(4),
	datae => \Controle|ALT_INV_Selector12~0_combout\,
	dataf => \Controle|ALT_INV_Selector11~0_combout\,
	combout => \Mux11~0_combout\);

-- Location: FF_X32_Y6_N14
\reg_inter_2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux11~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_2(4));

-- Location: LABCELL_X35_Y5_N48
\reg_r[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r[3]~0_combout\ = ( !\Controle|Selector10~0_combout\ & ( \Controle|Selector9~2_combout\ & ( (!\Controle|Selector10~2_combout\ & ((\Controle|input_enable~0_combout\) # (\Controle|read_enable~0_combout\))) ) ) ) # ( !\Controle|Selector10~0_combout\ & ( 
-- !\Controle|Selector9~2_combout\ & ( (\Controle|Selector9~0_combout\ & (!\Controle|Selector10~2_combout\ & ((\Controle|input_enable~0_combout\) # (\Controle|read_enable~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000000000000000000000001110111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_read_enable~0_combout\,
	datab => \Controle|ALT_INV_input_enable~0_combout\,
	datac => \Controle|ALT_INV_Selector9~0_combout\,
	datad => \Controle|ALT_INV_Selector10~2_combout\,
	datae => \Controle|ALT_INV_Selector10~0_combout\,
	dataf => \Controle|ALT_INV_Selector9~2_combout\,
	combout => \reg_r[3]~0_combout\);

-- Location: IOIBUF_X34_Y0_N18
\switches[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(3),
	o => \switches[3]~input_o\);

-- Location: MLABCELL_X34_Y5_N30
\reg_b~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b~6_combout\ = ( \reg_a~1_combout\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & (\switches[3]~input_o\)) # (\reg_b~0_combout\ & ((reg_inter_2(3)))) ) ) ) # ( !\reg_a~1_combout\ & ( \Controle|Selector10~1_combout\ & ( 
-- (!\reg_b~0_combout\ & (\switches[3]~input_o\)) # (\reg_b~0_combout\ & ((reg_inter_2(3)))) ) ) ) # ( \reg_a~1_combout\ & ( !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3)))) # 
-- (\reg_b~0_combout\ & (reg_inter_2(3))) ) ) ) # ( !\reg_a~1_combout\ & ( !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & (\switches[3]~input_o\)) # (\reg_b~0_combout\ & ((reg_inter_2(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001101010011000000111111001101010011010100110101001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switches[3]~input_o\,
	datab => ALT_INV_reg_inter_2(3),
	datac => \ALT_INV_reg_b~0_combout\,
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(3),
	datae => \ALT_INV_reg_a~1_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_b~6_combout\);

-- Location: FF_X34_Y5_N32
\reg_b[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_b~6_combout\,
	clrn => \reset~input_o\,
	ena => \reg_b[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_b(3));

-- Location: MLABCELL_X34_Y6_N57
\reg_literal[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal[2]~feeder_combout\ = reg_inter_2(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(2),
	combout => \reg_literal[2]~feeder_combout\);

-- Location: FF_X34_Y6_N59
\reg_literal[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_literal[2]~feeder_combout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2),
	clrn => \reset~input_o\,
	sload => \reg_literal~0_combout\,
	ena => \reg_literal[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_literal(2));

-- Location: IOIBUF_X34_Y0_N1
\switches[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(2),
	o => \switches[2]~input_o\);

-- Location: LABCELL_X32_Y5_N3
\reg_a~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a~5_combout\ = ( \Controle|Selector10~1_combout\ & ( \reg_a~0_combout\ & ( reg_inter_2(2) ) ) ) # ( !\Controle|Selector10~1_combout\ & ( \reg_a~0_combout\ & ( reg_inter_2(2) ) ) ) # ( \Controle|Selector10~1_combout\ & ( !\reg_a~0_combout\ & ( 
-- (!\reg_a~1_combout\ & ((\switches[2]~input_o\))) # (\reg_a~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2))) ) ) ) # ( !\Controle|Selector10~1_combout\ & ( !\reg_a~0_combout\ & ( \switches[2]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000001011111010100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(2),
	datab => ALT_INV_reg_inter_2(2),
	datac => \ALT_INV_reg_a~1_combout\,
	datad => \ALT_INV_switches[2]~input_o\,
	datae => \Controle|ALT_INV_Selector10~1_combout\,
	dataf => \ALT_INV_reg_a~0_combout\,
	combout => \reg_a~5_combout\);

-- Location: FF_X32_Y5_N5
\reg_a[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_a~5_combout\,
	clrn => \reset~input_o\,
	ena => \reg_a[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_a(2));

-- Location: LABCELL_X32_Y5_N39
\reg_b~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b~5_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & ( \Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & ((\switches[2]~input_o\))) # (\reg_b~0_combout\ & (reg_inter_2(2))) ) ) ) # ( 
-- !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & ( \Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & ((\switches[2]~input_o\))) # (\reg_b~0_combout\ & (reg_inter_2(2))) ) ) ) # ( 
-- \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & ( !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & (((\switches[2]~input_o\)) # (\reg_a~1_combout\))) # (\reg_b~0_combout\ & (((reg_inter_2(2))))) ) ) ) # ( 
-- !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & ( !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & (!\reg_a~1_combout\ & ((\switches[2]~input_o\)))) # (\reg_b~0_combout\ & (((reg_inter_2(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110001101001001111010111100000101101011110000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_b~0_combout\,
	datab => \ALT_INV_reg_a~1_combout\,
	datac => ALT_INV_reg_inter_2(2),
	datad => \ALT_INV_switches[2]~input_o\,
	datae => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(2),
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_b~5_combout\);

-- Location: FF_X32_Y5_N41
\reg_b[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_b~5_combout\,
	clrn => \reset~input_o\,
	ena => \reg_b[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_b(2));

-- Location: LABCELL_X32_Y6_N45
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( \Controle|Selector10~1_combout\ & ( \Controle|Selector9~1_combout\ & ( reg_a(2) ) ) ) # ( !\Controle|Selector10~1_combout\ & ( \Controle|Selector9~1_combout\ & ( reg_b(2) ) ) ) # ( \Controle|Selector10~1_combout\ & ( 
-- !\Controle|Selector9~1_combout\ & ( reg_r(2) ) ) ) # ( !\Controle|Selector10~1_combout\ & ( !\Controle|Selector9~1_combout\ & ( reg_literal(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100110011001100110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_a(2),
	datab => ALT_INV_reg_b(2),
	datac => ALT_INV_reg_r(2),
	datad => ALT_INV_reg_literal(2),
	datae => \Controle|ALT_INV_Selector10~1_combout\,
	dataf => \Controle|ALT_INV_Selector9~1_combout\,
	combout => \Mux5~0_combout\);

-- Location: FF_X32_Y6_N47
\reg_inter_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux5~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_1(2));

-- Location: LABCELL_X36_Y5_N54
\ULA|Mux3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux3~2_combout\ = ( !\Controle|ula_code\(1) & ( (!\Controle|ula_code\(3) & \Controle|ula_code\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_ula_code\(3),
	datab => \Controle|ALT_INV_ula_code\(2),
	dataf => \Controle|ALT_INV_ula_code\(1),
	combout => \ULA|Mux3~2_combout\);

-- Location: IOIBUF_X33_Y0_N58
\switches[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(1),
	o => \switches[1]~input_o\);

-- Location: LABCELL_X32_Y5_N6
\reg_b~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b~4_combout\ = ( reg_inter_2(1) & ( \Controle|Selector10~1_combout\ & ( (\switches[1]~input_o\) # (\reg_b~0_combout\) ) ) ) # ( !reg_inter_2(1) & ( \Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & \switches[1]~input_o\) ) ) ) # ( 
-- reg_inter_2(1) & ( !\Controle|Selector10~1_combout\ & ( ((!\reg_a~1_combout\ & (\switches[1]~input_o\)) # (\reg_a~1_combout\ & ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1))))) # (\reg_b~0_combout\) ) ) ) # ( !reg_inter_2(1) & ( 
-- !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & ((!\reg_a~1_combout\ & (\switches[1]~input_o\)) # (\reg_a~1_combout\ & ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010010111010111111100001010000010100101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_b~0_combout\,
	datab => \ALT_INV_reg_a~1_combout\,
	datac => \ALT_INV_switches[1]~input_o\,
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	datae => ALT_INV_reg_inter_2(1),
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_b~4_combout\);

-- Location: FF_X32_Y5_N8
\reg_b[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_b~4_combout\,
	clrn => \reset~input_o\,
	ena => \reg_b[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_b(1));

-- Location: MLABCELL_X34_Y6_N0
\reg_literal[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal[0]~feeder_combout\ = reg_inter_2(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_reg_inter_2(0),
	combout => \reg_literal[0]~feeder_combout\);

-- Location: FF_X34_Y6_N2
\reg_literal[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_literal[0]~feeder_combout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0),
	clrn => \reset~input_o\,
	sload => \reg_literal~0_combout\,
	ena => \reg_literal[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_literal(0));

-- Location: MLABCELL_X37_Y6_N0
\ULA|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~21_sumout\ = SUM(( reg_inter_2(0) ) + ( reg_inter_1(0) ) + ( !VCC ))
-- \ULA|Add0~22\ = CARRY(( reg_inter_2(0) ) + ( reg_inter_1(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(0),
	datad => ALT_INV_reg_inter_2(0),
	cin => GND,
	sumout => \ULA|Add0~21_sumout\,
	cout => \ULA|Add0~22\);

-- Location: LABCELL_X36_Y6_N30
\ULA|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add1~21_sumout\ = SUM(( !reg_inter_2(0) $ (!reg_inter_1(0)) ) + ( !VCC ) + ( !VCC ))
-- \ULA|Add1~22\ = CARRY(( !reg_inter_2(0) $ (!reg_inter_1(0)) ) + ( !VCC ) + ( !VCC ))
-- \ULA|Add1~23\ = SHARE((!reg_inter_2(0)) # (reg_inter_1(0)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(0),
	datad => ALT_INV_reg_inter_1(0),
	cin => GND,
	sharein => GND,
	sumout => \ULA|Add1~21_sumout\,
	cout => \ULA|Add1~22\,
	shareout => \ULA|Add1~23\);

-- Location: LABCELL_X36_Y4_N30
\ULA|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux8~0_combout\ = ( \Controle|ula_code\(1) & ( \Controle|ula_code\(0) & ( (reg_inter_2(0)) # (reg_inter_1(0)) ) ) ) # ( !\Controle|ula_code\(1) & ( \Controle|ula_code\(0) & ( \ULA|Add1~21_sumout\ ) ) ) # ( \Controle|ula_code\(1) & ( 
-- !\Controle|ula_code\(0) & ( (reg_inter_1(0) & reg_inter_2(0)) ) ) ) # ( !\Controle|ula_code\(1) & ( !\Controle|ula_code\(0) & ( \ULA|Add0~21_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000100010001000100000000111111110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(0),
	datab => ALT_INV_reg_inter_2(0),
	datac => \ULA|ALT_INV_Add0~21_sumout\,
	datad => \ULA|ALT_INV_Add1~21_sumout\,
	datae => \Controle|ALT_INV_ula_code\(1),
	dataf => \Controle|ALT_INV_ula_code\(0),
	combout => \ULA|Mux8~0_combout\);

-- Location: LABCELL_X36_Y5_N51
\ULA|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux13~0_combout\ = ( \ULA|Mux8~0_combout\ & ( ((!reg_inter_1(0) & \ULA|Mux3~2_combout\)) # (\ULA|Mux10~2_combout\) ) ) # ( !\ULA|Mux8~0_combout\ & ( (!reg_inter_1(0) & \ULA|Mux3~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000001010101111101010101010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Mux10~2_combout\,
	datac => ALT_INV_reg_inter_1(0),
	datad => \ULA|ALT_INV_Mux3~2_combout\,
	dataf => \ULA|ALT_INV_Mux8~0_combout\,
	combout => \ULA|Mux13~0_combout\);

-- Location: LABCELL_X36_Y5_N57
\ULA|result[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|result\(0) = ( \ULA|Mux13~0_combout\ & ( (!\Equal0~0_combout\) # (\ULA|result\(0)) ) ) # ( !\ULA|Mux13~0_combout\ & ( (\Equal0~0_combout\ & \ULA|result\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Equal0~0_combout\,
	datad => \ULA|ALT_INV_result\(0),
	dataf => \ULA|ALT_INV_Mux13~0_combout\,
	combout => \ULA|result\(0));

-- Location: LABCELL_X36_Y5_N12
\reg_r~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r~2_combout\ = ( \reg_r[3]~1_combout\ & ( \reg_r[3]~0_combout\ & ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0) ) ) ) # ( !\reg_r[3]~1_combout\ & ( \reg_r[3]~0_combout\ & ( \switches[0]~input_o\ ) ) ) # ( \reg_r[3]~1_combout\ & ( 
-- !\reg_r[3]~0_combout\ & ( reg_inter_2(0) ) ) ) # ( !\reg_r[3]~1_combout\ & ( !\reg_r[3]~0_combout\ & ( \ULA|result\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111001100110011001100001111000011110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	datab => ALT_INV_reg_inter_2(0),
	datac => \ALT_INV_switches[0]~input_o\,
	datad => \ULA|ALT_INV_result\(0),
	datae => \ALT_INV_reg_r[3]~1_combout\,
	dataf => \ALT_INV_reg_r[3]~0_combout\,
	combout => \reg_r~2_combout\);

-- Location: LABCELL_X39_Y5_N30
\Controle|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Mux5~0_combout\ = ( !\Controle|process_2~0_combout\ & ( (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & ((!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6)) # 
-- (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011000000111100001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	dataf => \Controle|ALT_INV_process_2~0_combout\,
	combout => \Controle|Mux5~0_combout\);

-- Location: LABCELL_X40_Y5_N30
\Controle|Selector33~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector33~0_combout\ = ( \Controle|opcode_memory\(3) & ( \Controle|Mux5~0_combout\ & ( \Controle|estado.DECODIFICA~q\ ) ) ) # ( !\Controle|opcode_memory\(3) & ( \Controle|Mux5~0_combout\ & ( ((\Controle|estado.DECODIFICA_2~q\ & 
-- ((!\Controle|opcode_memory\(2)) # (!\Controle|opcode_memory\(1))))) # (\Controle|estado.DECODIFICA~q\) ) ) ) # ( !\Controle|opcode_memory\(3) & ( !\Controle|Mux5~0_combout\ & ( (\Controle|estado.DECODIFICA_2~q\ & ((!\Controle|opcode_memory\(2)) # 
-- (!\Controle|opcode_memory\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111000001110000000000000000000001110111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_opcode_memory\(2),
	datab => \Controle|ALT_INV_opcode_memory\(1),
	datac => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	datad => \Controle|ALT_INV_estado.DECODIFICA~q\,
	datae => \Controle|ALT_INV_opcode_memory\(3),
	dataf => \Controle|ALT_INV_Mux5~0_combout\,
	combout => \Controle|Selector33~0_combout\);

-- Location: LABCELL_X40_Y5_N3
\Controle|proximo_estado.EXECUTA_659\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.EXECUTA_659~combout\ = ( \Controle|Selector33~0_combout\ & ( (\Controle|proximo_estado.EXECUTA_659~combout\) # (\Controle|Selector41~0_combout\) ) ) # ( !\Controle|Selector33~0_combout\ & ( (!\Controle|Selector41~0_combout\ & 
-- \Controle|proximo_estado.EXECUTA_659~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_Selector41~0_combout\,
	datad => \Controle|ALT_INV_proximo_estado.EXECUTA_659~combout\,
	dataf => \Controle|ALT_INV_Selector33~0_combout\,
	combout => \Controle|proximo_estado.EXECUTA_659~combout\);

-- Location: FF_X40_Y5_N5
\Controle|estado.EXECUTA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|proximo_estado.EXECUTA_659~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.EXECUTA~q\);

-- Location: MLABCELL_X37_Y5_N54
\reg_r[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r[3]~3_combout\ = ( \Equal0~0_combout\ & ( (\Controle|reg_select_memory\(3) & (!\Controle|reg_select_memory\(2) & \Controle|estado.MOVER~q\)) ) ) # ( !\Equal0~0_combout\ & ( ((\Controle|reg_select_memory\(3) & (!\Controle|reg_select_memory\(2) & 
-- \Controle|estado.MOVER~q\))) # (\Controle|estado.EXECUTA~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001101110011001100110111001100000000010100000000000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_reg_select_memory\(3),
	datab => \Controle|ALT_INV_estado.EXECUTA~q\,
	datac => \Controle|ALT_INV_reg_select_memory\(2),
	datad => \Controle|ALT_INV_estado.MOVER~q\,
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \reg_r[3]~3_combout\);

-- Location: LABCELL_X36_Y5_N3
\reg_r[3]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r[3]~4_combout\ = ( \Controle|Selector10~1_combout\ & ( ((!\Controle|Selector9~1_combout\ & ((\Controle|read_enable~0_combout\) # (\Controle|input_enable~0_combout\)))) # (\reg_r[3]~3_combout\) ) ) # ( !\Controle|Selector10~1_combout\ & ( 
-- \reg_r[3]~3_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001101110011111100110111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_input_enable~0_combout\,
	datab => \ALT_INV_reg_r[3]~3_combout\,
	datac => \Controle|ALT_INV_Selector9~1_combout\,
	datad => \Controle|ALT_INV_read_enable~0_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_r[3]~4_combout\);

-- Location: FF_X36_Y5_N14
\reg_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_r~2_combout\,
	clrn => \reset~input_o\,
	ena => \reg_r[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_r(0));

-- Location: LABCELL_X36_Y7_N39
\reg_a~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a~2_combout\ = ( \reg_a~0_combout\ & ( \Controle|Selector10~1_combout\ & ( reg_inter_2(0) ) ) ) # ( !\reg_a~0_combout\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_a~1_combout\ & ((\switches[0]~input_o\))) # (\reg_a~1_combout\ & 
-- (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0))) ) ) ) # ( \reg_a~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( reg_inter_2(0) ) ) ) # ( !\reg_a~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( \switches[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111001100110011001100000101101011110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_a~1_combout\,
	datab => ALT_INV_reg_inter_2(0),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	datad => \ALT_INV_switches[0]~input_o\,
	datae => \ALT_INV_reg_a~0_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_a~2_combout\);

-- Location: FF_X36_Y7_N41
\reg_a[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_a~2_combout\,
	clrn => \reset~input_o\,
	ena => \reg_a[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_a(0));

-- Location: LABCELL_X35_Y6_N48
\Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = ( \Controle|Selector11~0_combout\ & ( \Controle|Selector12~0_combout\ & ( reg_literal(0) ) ) ) # ( !\Controle|Selector11~0_combout\ & ( \Controle|Selector12~0_combout\ & ( reg_b(0) ) ) ) # ( \Controle|Selector11~0_combout\ & ( 
-- !\Controle|Selector12~0_combout\ & ( reg_r(0) ) ) ) # ( !\Controle|Selector11~0_combout\ & ( !\Controle|Selector12~0_combout\ & ( reg_a(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111101010101010101010011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_b(0),
	datab => ALT_INV_reg_literal(0),
	datac => ALT_INV_reg_r(0),
	datad => ALT_INV_reg_a(0),
	datae => \Controle|ALT_INV_Selector11~0_combout\,
	dataf => \Controle|ALT_INV_Selector12~0_combout\,
	combout => \Mux15~0_combout\);

-- Location: FF_X35_Y6_N50
\reg_inter_2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux15~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_2(0));

-- Location: LABCELL_X36_Y6_N33
\ULA|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add1~25_sumout\ = SUM(( !reg_inter_1(1) $ (reg_inter_2(1)) ) + ( \ULA|Add1~23\ ) + ( \ULA|Add1~22\ ))
-- \ULA|Add1~26\ = CARRY(( !reg_inter_1(1) $ (reg_inter_2(1)) ) + ( \ULA|Add1~23\ ) + ( \ULA|Add1~22\ ))
-- \ULA|Add1~27\ = SHARE((reg_inter_1(1) & !reg_inter_2(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(1),
	datad => ALT_INV_reg_inter_2(1),
	cin => \ULA|Add1~22\,
	sharein => \ULA|Add1~23\,
	sumout => \ULA|Add1~25_sumout\,
	cout => \ULA|Add1~26\,
	shareout => \ULA|Add1~27\);

-- Location: MLABCELL_X37_Y6_N3
\ULA|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~25_sumout\ = SUM(( reg_inter_1(1) ) + ( reg_inter_2(1) ) + ( \ULA|Add0~22\ ))
-- \ULA|Add0~26\ = CARRY(( reg_inter_1(1) ) + ( reg_inter_2(1) ) + ( \ULA|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(1),
	datad => ALT_INV_reg_inter_1(1),
	cin => \ULA|Add0~22\,
	sumout => \ULA|Add0~25_sumout\,
	cout => \ULA|Add0~26\);

-- Location: MLABCELL_X37_Y4_N30
\ULA|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux7~0_combout\ = ( \ULA|Add0~25_sumout\ & ( \Controle|ula_code\(1) & ( (!reg_inter_1(1) & (reg_inter_2(1) & \Controle|ula_code\(0))) # (reg_inter_1(1) & ((\Controle|ula_code\(0)) # (reg_inter_2(1)))) ) ) ) # ( !\ULA|Add0~25_sumout\ & ( 
-- \Controle|ula_code\(1) & ( (!reg_inter_1(1) & (reg_inter_2(1) & \Controle|ula_code\(0))) # (reg_inter_1(1) & ((\Controle|ula_code\(0)) # (reg_inter_2(1)))) ) ) ) # ( \ULA|Add0~25_sumout\ & ( !\Controle|ula_code\(1) & ( (!\Controle|ula_code\(0)) # 
-- (\ULA|Add1~25_sumout\) ) ) ) # ( !\ULA|Add0~25_sumout\ & ( !\Controle|ula_code\(1) & ( (\Controle|ula_code\(0) & \ULA|Add1~25_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111100001111111100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(1),
	datab => ALT_INV_reg_inter_2(1),
	datac => \Controle|ALT_INV_ula_code\(0),
	datad => \ULA|ALT_INV_Add1~25_sumout\,
	datae => \ULA|ALT_INV_Add0~25_sumout\,
	dataf => \Controle|ALT_INV_ula_code\(1),
	combout => \ULA|Mux7~0_combout\);

-- Location: MLABCELL_X37_Y4_N42
\ULA|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux12~0_combout\ = ( \ULA|Mux3~2_combout\ & ( \ULA|Mux7~0_combout\ & ( (!reg_inter_1(1)) # (\ULA|Mux10~2_combout\) ) ) ) # ( !\ULA|Mux3~2_combout\ & ( \ULA|Mux7~0_combout\ & ( \ULA|Mux10~2_combout\ ) ) ) # ( \ULA|Mux3~2_combout\ & ( 
-- !\ULA|Mux7~0_combout\ & ( !reg_inter_1(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(1),
	datad => \ULA|ALT_INV_Mux10~2_combout\,
	datae => \ULA|ALT_INV_Mux3~2_combout\,
	dataf => \ULA|ALT_INV_Mux7~0_combout\,
	combout => \ULA|Mux12~0_combout\);

-- Location: MLABCELL_X37_Y4_N24
\ULA|result[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|result\(1) = ( \ULA|result\(1) & ( (\Equal0~0_combout\) # (\ULA|Mux12~0_combout\) ) ) # ( !\ULA|result\(1) & ( (\ULA|Mux12~0_combout\ & !\Equal0~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ULA|ALT_INV_Mux12~0_combout\,
	datac => \ALT_INV_Equal0~0_combout\,
	dataf => \ULA|ALT_INV_result\(1),
	combout => \ULA|result\(1));

-- Location: LABCELL_X35_Y5_N36
\reg_r~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r~5_combout\ = ( \ULA|result\(1) & ( \reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & (\switches[1]~input_o\)) # (\reg_r[3]~1_combout\ & ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1)))) ) ) ) # ( !\ULA|result\(1) & ( 
-- \reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & (\switches[1]~input_o\)) # (\reg_r[3]~1_combout\ & ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1)))) ) ) ) # ( \ULA|result\(1) & ( !\reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\) # 
-- (reg_inter_2(1)) ) ) ) # ( !\ULA|result\(1) & ( !\reg_r[3]~0_combout\ & ( (reg_inter_2(1) & \reg_r[3]~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011111111110011001101010101000011110101010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switches[1]~input_o\,
	datab => ALT_INV_reg_inter_2(1),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	datad => \ALT_INV_reg_r[3]~1_combout\,
	datae => \ULA|ALT_INV_result\(1),
	dataf => \ALT_INV_reg_r[3]~0_combout\,
	combout => \reg_r~5_combout\);

-- Location: FF_X35_Y5_N38
\reg_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_r~5_combout\,
	clrn => \reset~input_o\,
	ena => \reg_r[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_r(1));

-- Location: LABCELL_X35_Y6_N3
\reg_literal[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal[1]~feeder_combout\ = ( reg_inter_2(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_reg_inter_2(1),
	combout => \reg_literal[1]~feeder_combout\);

-- Location: FF_X35_Y6_N5
\reg_literal[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_literal[1]~feeder_combout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1),
	clrn => \reset~input_o\,
	sload => \reg_literal~0_combout\,
	ena => \reg_literal[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_literal(1));

-- Location: LABCELL_X35_Y6_N18
\Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = ( reg_literal(1) & ( \Controle|Selector12~0_combout\ & ( (\Controle|Selector11~0_combout\) # (reg_b(1)) ) ) ) # ( !reg_literal(1) & ( \Controle|Selector12~0_combout\ & ( (reg_b(1) & !\Controle|Selector11~0_combout\) ) ) ) # ( 
-- reg_literal(1) & ( !\Controle|Selector12~0_combout\ & ( (!\Controle|Selector11~0_combout\ & (reg_a(1))) # (\Controle|Selector11~0_combout\ & ((reg_r(1)))) ) ) ) # ( !reg_literal(1) & ( !\Controle|Selector12~0_combout\ & ( (!\Controle|Selector11~0_combout\ 
-- & (reg_a(1))) # (\Controle|Selector11~0_combout\ & ((reg_r(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001011111010100000101111100110000001100000011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_a(1),
	datab => ALT_INV_reg_b(1),
	datac => \Controle|ALT_INV_Selector11~0_combout\,
	datad => ALT_INV_reg_r(1),
	datae => ALT_INV_reg_literal(1),
	dataf => \Controle|ALT_INV_Selector12~0_combout\,
	combout => \Mux14~0_combout\);

-- Location: FF_X35_Y6_N20
\reg_inter_2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux14~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_2(1));

-- Location: LABCELL_X36_Y7_N6
\reg_a~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a~4_combout\ = ( \reg_a~0_combout\ & ( \Controle|Selector10~1_combout\ & ( reg_inter_2(1) ) ) ) # ( !\reg_a~0_combout\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_a~1_combout\ & (\switches[1]~input_o\)) # (\reg_a~1_combout\ & 
-- ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1)))) ) ) ) # ( \reg_a~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( reg_inter_2(1) ) ) ) # ( !\reg_a~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( \switches[1]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111001100110011001100001010010111110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_a~1_combout\,
	datab => ALT_INV_reg_inter_2(1),
	datac => \ALT_INV_switches[1]~input_o\,
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	datae => \ALT_INV_reg_a~0_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_a~4_combout\);

-- Location: FF_X36_Y7_N8
\reg_a[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_a~4_combout\,
	clrn => \reset~input_o\,
	ena => \reg_a[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_a(1));

-- Location: LABCELL_X35_Y6_N12
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( reg_literal(1) & ( \Controle|Selector10~1_combout\ & ( (!\Controle|Selector9~1_combout\ & ((reg_r(1)))) # (\Controle|Selector9~1_combout\ & (reg_a(1))) ) ) ) # ( !reg_literal(1) & ( \Controle|Selector10~1_combout\ & ( 
-- (!\Controle|Selector9~1_combout\ & ((reg_r(1)))) # (\Controle|Selector9~1_combout\ & (reg_a(1))) ) ) ) # ( reg_literal(1) & ( !\Controle|Selector10~1_combout\ & ( (!\Controle|Selector9~1_combout\) # (reg_b(1)) ) ) ) # ( !reg_literal(1) & ( 
-- !\Controle|Selector10~1_combout\ & ( (\Controle|Selector9~1_combout\ & reg_b(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111100001111111100110101001101010011010100110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_a(1),
	datab => ALT_INV_reg_r(1),
	datac => \Controle|ALT_INV_Selector9~1_combout\,
	datad => ALT_INV_reg_b(1),
	datae => ALT_INV_reg_literal(1),
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \Mux6~0_combout\);

-- Location: FF_X35_Y6_N14
\reg_inter_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux6~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_1(1));

-- Location: LABCELL_X36_Y6_N36
\ULA|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add1~17_sumout\ = SUM(( !reg_inter_2(2) $ (reg_inter_1(2)) ) + ( \ULA|Add1~27\ ) + ( \ULA|Add1~26\ ))
-- \ULA|Add1~18\ = CARRY(( !reg_inter_2(2) $ (reg_inter_1(2)) ) + ( \ULA|Add1~27\ ) + ( \ULA|Add1~26\ ))
-- \ULA|Add1~19\ = SHARE((!reg_inter_2(2) & reg_inter_1(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(2),
	datad => ALT_INV_reg_inter_1(2),
	cin => \ULA|Add1~26\,
	sharein => \ULA|Add1~27\,
	sumout => \ULA|Add1~17_sumout\,
	cout => \ULA|Add1~18\,
	shareout => \ULA|Add1~19\);

-- Location: MLABCELL_X37_Y6_N6
\ULA|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~17_sumout\ = SUM(( reg_inter_1(2) ) + ( reg_inter_2(2) ) + ( \ULA|Add0~26\ ))
-- \ULA|Add0~18\ = CARRY(( reg_inter_1(2) ) + ( reg_inter_2(2) ) + ( \ULA|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(2),
	datad => ALT_INV_reg_inter_1(2),
	cin => \ULA|Add0~26\,
	sumout => \ULA|Add0~17_sumout\,
	cout => \ULA|Add0~18\);

-- Location: LABCELL_X36_Y5_N24
\ULA|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux6~0_combout\ = ( \Controle|ula_code\(0) & ( \ULA|Add0~17_sumout\ & ( (!\Controle|ula_code\(1) & (((\ULA|Add1~17_sumout\)))) # (\Controle|ula_code\(1) & (((reg_inter_1(2))) # (reg_inter_2(2)))) ) ) ) # ( !\Controle|ula_code\(0) & ( 
-- \ULA|Add0~17_sumout\ & ( (!\Controle|ula_code\(1)) # ((reg_inter_2(2) & reg_inter_1(2))) ) ) ) # ( \Controle|ula_code\(0) & ( !\ULA|Add0~17_sumout\ & ( (!\Controle|ula_code\(1) & (((\ULA|Add1~17_sumout\)))) # (\Controle|ula_code\(1) & (((reg_inter_1(2))) 
-- # (reg_inter_2(2)))) ) ) ) # ( !\Controle|ula_code\(0) & ( !\ULA|Add0~17_sumout\ & ( (reg_inter_2(2) & (reg_inter_1(2) & \Controle|ula_code\(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000001111111011111110001111100010000011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_2(2),
	datab => ALT_INV_reg_inter_1(2),
	datac => \Controle|ALT_INV_ula_code\(1),
	datad => \ULA|ALT_INV_Add1~17_sumout\,
	datae => \Controle|ALT_INV_ula_code\(0),
	dataf => \ULA|ALT_INV_Add0~17_sumout\,
	combout => \ULA|Mux6~0_combout\);

-- Location: LABCELL_X36_Y5_N9
\ULA|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux11~0_combout\ = ( \ULA|Mux6~0_combout\ & ( ((!reg_inter_1(2) & \ULA|Mux3~2_combout\)) # (\ULA|Mux10~2_combout\) ) ) # ( !\ULA|Mux6~0_combout\ & ( (!reg_inter_1(2) & \ULA|Mux3~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000001010101111101010101010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Mux10~2_combout\,
	datac => ALT_INV_reg_inter_1(2),
	datad => \ULA|ALT_INV_Mux3~2_combout\,
	dataf => \ULA|ALT_INV_Mux6~0_combout\,
	combout => \ULA|Mux11~0_combout\);

-- Location: LABCELL_X36_Y5_N6
\ULA|result[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|result\(2) = ( \ULA|result\(2) & ( (\ULA|Mux11~0_combout\) # (\Equal0~0_combout\) ) ) # ( !\ULA|result\(2) & ( (!\Equal0~0_combout\ & \ULA|Mux11~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Equal0~0_combout\,
	datac => \ULA|ALT_INV_Mux11~0_combout\,
	dataf => \ULA|ALT_INV_result\(2),
	combout => \ULA|result\(2));

-- Location: LABCELL_X35_Y5_N30
\reg_r~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r~6_combout\ = ( \ULA|result\(2) & ( \reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & (\switches[2]~input_o\)) # (\reg_r[3]~1_combout\ & ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2)))) ) ) ) # ( !\ULA|result\(2) & ( 
-- \reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & (\switches[2]~input_o\)) # (\reg_r[3]~1_combout\ & ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2)))) ) ) ) # ( \ULA|result\(2) & ( !\reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\) # 
-- (reg_inter_2(2)) ) ) ) # ( !\ULA|result\(2) & ( !\reg_r[3]~0_combout\ & ( (reg_inter_2(2) & \reg_r[3]~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001110111011101110100001100001111110000110000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_2(2),
	datab => \ALT_INV_reg_r[3]~1_combout\,
	datac => \ALT_INV_switches[2]~input_o\,
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(2),
	datae => \ULA|ALT_INV_result\(2),
	dataf => \ALT_INV_reg_r[3]~0_combout\,
	combout => \reg_r~6_combout\);

-- Location: FF_X35_Y5_N32
\reg_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_r~6_combout\,
	clrn => \reset~input_o\,
	ena => \reg_r[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_r(2));

-- Location: LABCELL_X35_Y6_N54
\Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = ( \Controle|Selector11~0_combout\ & ( \Controle|Selector12~0_combout\ & ( reg_literal(2) ) ) ) # ( !\Controle|Selector11~0_combout\ & ( \Controle|Selector12~0_combout\ & ( reg_b(2) ) ) ) # ( \Controle|Selector11~0_combout\ & ( 
-- !\Controle|Selector12~0_combout\ & ( reg_r(2) ) ) ) # ( !\Controle|Selector11~0_combout\ & ( !\Controle|Selector12~0_combout\ & ( reg_a(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000000001111111100001111000011110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_literal(2),
	datab => ALT_INV_reg_a(2),
	datac => ALT_INV_reg_b(2),
	datad => ALT_INV_reg_r(2),
	datae => \Controle|ALT_INV_Selector11~0_combout\,
	dataf => \Controle|ALT_INV_Selector12~0_combout\,
	combout => \Mux13~0_combout\);

-- Location: FF_X35_Y6_N56
\reg_inter_2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux13~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_2(2));

-- Location: LABCELL_X36_Y6_N39
\ULA|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add1~13_sumout\ = SUM(( !reg_inter_1(3) $ (reg_inter_2(3)) ) + ( \ULA|Add1~19\ ) + ( \ULA|Add1~18\ ))
-- \ULA|Add1~14\ = CARRY(( !reg_inter_1(3) $ (reg_inter_2(3)) ) + ( \ULA|Add1~19\ ) + ( \ULA|Add1~18\ ))
-- \ULA|Add1~15\ = SHARE((reg_inter_1(3) & !reg_inter_2(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(3),
	datad => ALT_INV_reg_inter_2(3),
	cin => \ULA|Add1~18\,
	sharein => \ULA|Add1~19\,
	sumout => \ULA|Add1~13_sumout\,
	cout => \ULA|Add1~14\,
	shareout => \ULA|Add1~15\);

-- Location: MLABCELL_X37_Y6_N9
\ULA|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~13_sumout\ = SUM(( reg_inter_1(3) ) + ( reg_inter_2(3) ) + ( \ULA|Add0~18\ ))
-- \ULA|Add0~14\ = CARRY(( reg_inter_1(3) ) + ( reg_inter_2(3) ) + ( \ULA|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(3),
	datad => ALT_INV_reg_inter_1(3),
	cin => \ULA|Add0~18\,
	sumout => \ULA|Add0~13_sumout\,
	cout => \ULA|Add0~14\);

-- Location: LABCELL_X36_Y6_N18
\ULA|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux5~0_combout\ = ( \ULA|Add0~13_sumout\ & ( \Controle|ula_code\(1) & ( (!reg_inter_2(3) & (\Controle|ula_code\(0) & reg_inter_1(3))) # (reg_inter_2(3) & ((reg_inter_1(3)) # (\Controle|ula_code\(0)))) ) ) ) # ( !\ULA|Add0~13_sumout\ & ( 
-- \Controle|ula_code\(1) & ( (!reg_inter_2(3) & (\Controle|ula_code\(0) & reg_inter_1(3))) # (reg_inter_2(3) & ((reg_inter_1(3)) # (\Controle|ula_code\(0)))) ) ) ) # ( \ULA|Add0~13_sumout\ & ( !\Controle|ula_code\(1) & ( (!\Controle|ula_code\(0)) # 
-- (\ULA|Add1~13_sumout\) ) ) ) # ( !\ULA|Add0~13_sumout\ & ( !\Controle|ula_code\(1) & ( (\Controle|ula_code\(0) & \ULA|Add1~13_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011110011001111111100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_2(3),
	datab => \Controle|ALT_INV_ula_code\(0),
	datac => ALT_INV_reg_inter_1(3),
	datad => \ULA|ALT_INV_Add1~13_sumout\,
	datae => \ULA|ALT_INV_Add0~13_sumout\,
	dataf => \Controle|ALT_INV_ula_code\(1),
	combout => \ULA|Mux5~0_combout\);

-- Location: LABCELL_X36_Y6_N24
\ULA|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux0~0_combout\ = ( \ULA|Mux3~2_combout\ & ( (!reg_inter_1(3)) # ((\ULA|Mux5~0_combout\ & \ULA|Mux10~2_combout\)) ) ) # ( !\ULA|Mux3~2_combout\ & ( (\ULA|Mux5~0_combout\ & \ULA|Mux10~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111001100110011111100110011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_inter_1(3),
	datac => \ULA|ALT_INV_Mux5~0_combout\,
	datad => \ULA|ALT_INV_Mux10~2_combout\,
	dataf => \ULA|ALT_INV_Mux3~2_combout\,
	combout => \ULA|Mux0~0_combout\);

-- Location: LABCELL_X36_Y6_N27
\ULA|result[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|result\(3) = ( \ULA|result\(3) & ( (\Equal0~0_combout\) # (\ULA|Mux0~0_combout\) ) ) # ( !\ULA|result\(3) & ( (\ULA|Mux0~0_combout\ & !\Equal0~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000001011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Mux0~0_combout\,
	datac => \ALT_INV_Equal0~0_combout\,
	dataf => \ULA|ALT_INV_result\(3),
	combout => \ULA|result\(3));

-- Location: LABCELL_X35_Y5_N24
\reg_r~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r~7_combout\ = ( \ULA|result\(3) & ( \reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & ((\switches[3]~input_o\))) # (\reg_r[3]~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3))) ) ) ) # ( !\ULA|result\(3) & ( 
-- \reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & ((\switches[3]~input_o\))) # (\reg_r[3]~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3))) ) ) ) # ( \ULA|result\(3) & ( !\reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\) # 
-- (reg_inter_2(3)) ) ) ) # ( !\ULA|result\(3) & ( !\reg_r[3]~0_combout\ & ( (reg_inter_2(3) & \reg_r[3]~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101111111110101010100001111001100110000111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_2(3),
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(3),
	datac => \ALT_INV_switches[3]~input_o\,
	datad => \ALT_INV_reg_r[3]~1_combout\,
	datae => \ULA|ALT_INV_result\(3),
	dataf => \ALT_INV_reg_r[3]~0_combout\,
	combout => \reg_r~7_combout\);

-- Location: FF_X35_Y5_N26
\reg_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_r~7_combout\,
	clrn => \reset~input_o\,
	ena => \reg_r[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_r(3));

-- Location: MLABCELL_X34_Y6_N12
\reg_literal[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal[3]~feeder_combout\ = reg_inter_2(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_inter_2(3),
	combout => \reg_literal[3]~feeder_combout\);

-- Location: FF_X34_Y6_N14
\reg_literal[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_literal[3]~feeder_combout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3),
	clrn => \reset~input_o\,
	sload => \reg_literal~0_combout\,
	ena => \reg_literal[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_literal(3));

-- Location: LABCELL_X35_Y6_N6
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( \Controle|Selector9~1_combout\ & ( \Controle|Selector10~1_combout\ & ( reg_a(3) ) ) ) # ( !\Controle|Selector9~1_combout\ & ( \Controle|Selector10~1_combout\ & ( reg_r(3) ) ) ) # ( \Controle|Selector9~1_combout\ & ( 
-- !\Controle|Selector10~1_combout\ & ( reg_b(3) ) ) ) # ( !\Controle|Selector9~1_combout\ & ( !\Controle|Selector10~1_combout\ & ( reg_literal(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111001100110011001100001111000011110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_a(3),
	datab => ALT_INV_reg_b(3),
	datac => ALT_INV_reg_r(3),
	datad => ALT_INV_reg_literal(3),
	datae => \Controle|ALT_INV_Selector9~1_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \Mux4~0_combout\);

-- Location: FF_X35_Y6_N8
\reg_inter_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux4~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_1(3));

-- Location: MLABCELL_X37_Y6_N12
\ULA|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~9_sumout\ = SUM(( reg_inter_2(4) ) + ( reg_inter_1(4) ) + ( \ULA|Add0~14\ ))
-- \ULA|Add0~10\ = CARRY(( reg_inter_2(4) ) + ( reg_inter_1(4) ) + ( \ULA|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_inter_1(4),
	datad => ALT_INV_reg_inter_2(4),
	cin => \ULA|Add0~14\,
	sumout => \ULA|Add0~9_sumout\,
	cout => \ULA|Add0~10\);

-- Location: LABCELL_X36_Y6_N42
\ULA|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add1~9_sumout\ = SUM(( !reg_inter_1(4) $ (reg_inter_2(4)) ) + ( \ULA|Add1~15\ ) + ( \ULA|Add1~14\ ))
-- \ULA|Add1~10\ = CARRY(( !reg_inter_1(4) $ (reg_inter_2(4)) ) + ( \ULA|Add1~15\ ) + ( \ULA|Add1~14\ ))
-- \ULA|Add1~11\ = SHARE((reg_inter_1(4) & !reg_inter_2(4)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(4),
	datad => ALT_INV_reg_inter_2(4),
	cin => \ULA|Add1~14\,
	sharein => \ULA|Add1~15\,
	sumout => \ULA|Add1~9_sumout\,
	cout => \ULA|Add1~10\,
	shareout => \ULA|Add1~11\);

-- Location: MLABCELL_X37_Y6_N30
\ULA|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux4~0_combout\ = ( \ULA|Add1~9_sumout\ & ( \Controle|ula_code\(1) & ( (!reg_inter_2(4) & (reg_inter_1(4) & \Controle|ula_code\(0))) # (reg_inter_2(4) & ((\Controle|ula_code\(0)) # (reg_inter_1(4)))) ) ) ) # ( !\ULA|Add1~9_sumout\ & ( 
-- \Controle|ula_code\(1) & ( (!reg_inter_2(4) & (reg_inter_1(4) & \Controle|ula_code\(0))) # (reg_inter_2(4) & ((\Controle|ula_code\(0)) # (reg_inter_1(4)))) ) ) ) # ( \ULA|Add1~9_sumout\ & ( !\Controle|ula_code\(1) & ( (\ULA|Add0~9_sumout\) # 
-- (\Controle|ula_code\(0)) ) ) ) # ( !\ULA|Add1~9_sumout\ & ( !\Controle|ula_code\(1) & ( (!\Controle|ula_code\(0) & \ULA|Add0~9_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000011111111111100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_2(4),
	datab => ALT_INV_reg_inter_1(4),
	datac => \Controle|ALT_INV_ula_code\(0),
	datad => \ULA|ALT_INV_Add0~9_sumout\,
	datae => \ULA|ALT_INV_Add1~9_sumout\,
	dataf => \Controle|ALT_INV_ula_code\(1),
	combout => \ULA|Mux4~0_combout\);

-- Location: MLABCELL_X37_Y6_N57
\ULA|Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux14~0_combout\ = ( \ULA|Mux3~2_combout\ & ( (!reg_inter_1(4)) # ((\ULA|Mux4~0_combout\ & \ULA|Mux10~2_combout\)) ) ) # ( !\ULA|Mux3~2_combout\ & ( (\ULA|Mux4~0_combout\ & \ULA|Mux10~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001111110000111100111111000011110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ULA|ALT_INV_Mux4~0_combout\,
	datac => ALT_INV_reg_inter_1(4),
	datad => \ULA|ALT_INV_Mux10~2_combout\,
	dataf => \ULA|ALT_INV_Mux3~2_combout\,
	combout => \ULA|Mux14~0_combout\);

-- Location: MLABCELL_X37_Y6_N54
\ULA|result[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|result\(4) = ( \ULA|Mux14~0_combout\ & ( (!\Equal0~0_combout\) # (\ULA|result\(4)) ) ) # ( !\ULA|Mux14~0_combout\ & ( (\Equal0~0_combout\ & \ULA|result\(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Equal0~0_combout\,
	datad => \ULA|ALT_INV_result\(4),
	dataf => \ULA|ALT_INV_Mux14~0_combout\,
	combout => \ULA|result\(4));

-- Location: MLABCELL_X34_Y5_N48
\reg_r~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r~8_combout\ = ( \reg_r[3]~0_combout\ & ( \ULA|result\(4) & ( (!\reg_r[3]~1_combout\ & ((\switches[4]~input_o\))) # (\reg_r[3]~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4))) ) ) ) # ( !\reg_r[3]~0_combout\ & ( 
-- \ULA|result\(4) & ( (!\reg_r[3]~1_combout\) # (reg_inter_2(4)) ) ) ) # ( \reg_r[3]~0_combout\ & ( !\ULA|result\(4) & ( (!\reg_r[3]~1_combout\ & ((\switches[4]~input_o\))) # (\reg_r[3]~1_combout\ & 
-- (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4))) ) ) ) # ( !\reg_r[3]~0_combout\ & ( !\ULA|result\(4) & ( (reg_inter_2(4) & \reg_r[3]~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000001011111010111110011111100110000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	datab => ALT_INV_reg_inter_2(4),
	datac => \ALT_INV_reg_r[3]~1_combout\,
	datad => \ALT_INV_switches[4]~input_o\,
	datae => \ALT_INV_reg_r[3]~0_combout\,
	dataf => \ULA|ALT_INV_result\(4),
	combout => \reg_r~8_combout\);

-- Location: FF_X34_Y5_N50
\reg_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_r~8_combout\,
	clrn => \reset~input_o\,
	ena => \reg_r[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_r(4));

-- Location: LABCELL_X32_Y6_N18
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \Controle|Selector10~1_combout\ & ( \Controle|Selector9~1_combout\ & ( reg_a(4) ) ) ) # ( !\Controle|Selector10~1_combout\ & ( \Controle|Selector9~1_combout\ & ( reg_b(4) ) ) ) # ( \Controle|Selector10~1_combout\ & ( 
-- !\Controle|Selector9~1_combout\ & ( reg_r(4) ) ) ) # ( !\Controle|Selector10~1_combout\ & ( !\Controle|Selector9~1_combout\ & ( reg_literal(4) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_r(4),
	datab => ALT_INV_reg_literal(4),
	datac => ALT_INV_reg_b(4),
	datad => ALT_INV_reg_a(4),
	datae => \Controle|ALT_INV_Selector10~1_combout\,
	dataf => \Controle|ALT_INV_Selector9~1_combout\,
	combout => \Mux3~0_combout\);

-- Location: FF_X32_Y6_N20
\reg_inter_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux3~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_1(4));

-- Location: LABCELL_X36_Y6_N45
\ULA|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add1~1_sumout\ = SUM(( !reg_inter_2(5) $ (reg_inter_1(5)) ) + ( \ULA|Add1~11\ ) + ( \ULA|Add1~10\ ))
-- \ULA|Add1~2\ = CARRY(( !reg_inter_2(5) $ (reg_inter_1(5)) ) + ( \ULA|Add1~11\ ) + ( \ULA|Add1~10\ ))
-- \ULA|Add1~3\ = SHARE((!reg_inter_2(5) & reg_inter_1(5)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(5),
	datad => ALT_INV_reg_inter_1(5),
	cin => \ULA|Add1~10\,
	sharein => \ULA|Add1~11\,
	sumout => \ULA|Add1~1_sumout\,
	cout => \ULA|Add1~2\,
	shareout => \ULA|Add1~3\);

-- Location: LABCELL_X36_Y6_N48
\ULA|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add1~5_sumout\ = SUM(( !reg_inter_1(6) $ (reg_inter_2(6)) ) + ( \ULA|Add1~3\ ) + ( \ULA|Add1~2\ ))
-- \ULA|Add1~6\ = CARRY(( !reg_inter_1(6) $ (reg_inter_2(6)) ) + ( \ULA|Add1~3\ ) + ( \ULA|Add1~2\ ))
-- \ULA|Add1~7\ = SHARE((reg_inter_1(6) & !reg_inter_2(6)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100000011000000000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_inter_1(6),
	datac => ALT_INV_reg_inter_2(6),
	cin => \ULA|Add1~2\,
	sharein => \ULA|Add1~3\,
	sumout => \ULA|Add1~5_sumout\,
	cout => \ULA|Add1~6\,
	shareout => \ULA|Add1~7\);

-- Location: MLABCELL_X37_Y6_N15
\ULA|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~1_sumout\ = SUM(( reg_inter_2(5) ) + ( reg_inter_1(5) ) + ( \ULA|Add0~10\ ))
-- \ULA|Add0~2\ = CARRY(( reg_inter_2(5) ) + ( reg_inter_1(5) ) + ( \ULA|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(5),
	datad => ALT_INV_reg_inter_2(5),
	cin => \ULA|Add0~10\,
	sumout => \ULA|Add0~1_sumout\,
	cout => \ULA|Add0~2\);

-- Location: MLABCELL_X37_Y6_N18
\ULA|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~5_sumout\ = SUM(( reg_inter_1(6) ) + ( reg_inter_2(6) ) + ( \ULA|Add0~2\ ))
-- \ULA|Add0~6\ = CARRY(( reg_inter_1(6) ) + ( reg_inter_2(6) ) + ( \ULA|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(6),
	datad => ALT_INV_reg_inter_1(6),
	cin => \ULA|Add0~2\,
	sumout => \ULA|Add0~5_sumout\,
	cout => \ULA|Add0~6\);

-- Location: LABCELL_X36_Y4_N6
\ULA|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux2~0_combout\ = ( \ULA|Add1~5_sumout\ & ( \ULA|Add0~5_sumout\ & ( (!\Controle|ula_code\(1)) # ((!reg_inter_1(6) & (reg_inter_2(6) & \Controle|ula_code\(0))) # (reg_inter_1(6) & ((\Controle|ula_code\(0)) # (reg_inter_2(6))))) ) ) ) # ( 
-- !\ULA|Add1~5_sumout\ & ( \ULA|Add0~5_sumout\ & ( (!\Controle|ula_code\(1) & (((!\Controle|ula_code\(0))))) # (\Controle|ula_code\(1) & ((!reg_inter_1(6) & (reg_inter_2(6) & \Controle|ula_code\(0))) # (reg_inter_1(6) & ((\Controle|ula_code\(0)) # 
-- (reg_inter_2(6)))))) ) ) ) # ( \ULA|Add1~5_sumout\ & ( !\ULA|Add0~5_sumout\ & ( (!reg_inter_1(6) & (\Controle|ula_code\(0) & ((!\Controle|ula_code\(1)) # (reg_inter_2(6))))) # (reg_inter_1(6) & (((\Controle|ula_code\(1) & reg_inter_2(6))) # 
-- (\Controle|ula_code\(0)))) ) ) ) # ( !\ULA|Add1~5_sumout\ & ( !\ULA|Add0~5_sumout\ & ( (\Controle|ula_code\(1) & ((!reg_inter_1(6) & (reg_inter_2(6) & \Controle|ula_code\(0))) # (reg_inter_1(6) & ((\Controle|ula_code\(0)) # (reg_inter_2(6)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100010011000000011101111111001101000100111100110111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(6),
	datab => \Controle|ALT_INV_ula_code\(1),
	datac => ALT_INV_reg_inter_2(6),
	datad => \Controle|ALT_INV_ula_code\(0),
	datae => \ULA|ALT_INV_Add1~5_sumout\,
	dataf => \ULA|ALT_INV_Add0~5_sumout\,
	combout => \ULA|Mux2~0_combout\);

-- Location: LABCELL_X36_Y4_N42
\ULA|Mux16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux16~0_combout\ = ( \ULA|Mux3~2_combout\ & ( (!reg_inter_1(6)) # ((\ULA|Mux10~2_combout\ & \ULA|Mux2~0_combout\)) ) ) # ( !\ULA|Mux3~2_combout\ & ( (\ULA|Mux10~2_combout\ & \ULA|Mux2~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111110101010101011111010101010101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(6),
	datac => \ULA|ALT_INV_Mux10~2_combout\,
	datad => \ULA|ALT_INV_Mux2~0_combout\,
	dataf => \ULA|ALT_INV_Mux3~2_combout\,
	combout => \ULA|Mux16~0_combout\);

-- Location: LABCELL_X36_Y4_N45
\ULA|result[6]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|result\(6) = ( \Equal0~0_combout\ & ( \ULA|result\(6) ) ) # ( !\Equal0~0_combout\ & ( \ULA|Mux16~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ULA|ALT_INV_Mux16~0_combout\,
	datad => \ULA|ALT_INV_result\(6),
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \ULA|result\(6));

-- Location: LABCELL_X35_Y5_N0
\reg_r~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r~10_combout\ = ( \ULA|result\(6) & ( \reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & ((\switches[6]~input_o\))) # (\reg_r[3]~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6))) ) ) ) # ( !\ULA|result\(6) & ( 
-- \reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & ((\switches[6]~input_o\))) # (\reg_r[3]~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6))) ) ) ) # ( \ULA|result\(6) & ( !\reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\) # 
-- (reg_inter_2(6)) ) ) ) # ( !\ULA|result\(6) & ( !\reg_r[3]~0_combout\ & ( (reg_inter_2(6) & \reg_r[3]~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101111111110101010100001111001100110000111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_2(6),
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	datac => \ALT_INV_switches[6]~input_o\,
	datad => \ALT_INV_reg_r[3]~1_combout\,
	datae => \ULA|ALT_INV_result\(6),
	dataf => \ALT_INV_reg_r[3]~0_combout\,
	combout => \reg_r~10_combout\);

-- Location: FF_X35_Y5_N2
\reg_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_r~10_combout\,
	clrn => \reset~input_o\,
	ena => \reg_r[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_r(6));

-- Location: LABCELL_X35_Y6_N42
\Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = ( \Controle|Selector11~0_combout\ & ( \Controle|Selector12~0_combout\ & ( reg_literal(6) ) ) ) # ( !\Controle|Selector11~0_combout\ & ( \Controle|Selector12~0_combout\ & ( reg_b(6) ) ) ) # ( \Controle|Selector11~0_combout\ & ( 
-- !\Controle|Selector12~0_combout\ & ( reg_r(6) ) ) ) # ( !\Controle|Selector11~0_combout\ & ( !\Controle|Selector12~0_combout\ & ( reg_a(6) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100110011001100110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_literal(6),
	datab => ALT_INV_reg_b(6),
	datac => ALT_INV_reg_r(6),
	datad => ALT_INV_reg_a(6),
	datae => \Controle|ALT_INV_Selector11~0_combout\,
	dataf => \Controle|ALT_INV_Selector12~0_combout\,
	combout => \Mux9~0_combout\);

-- Location: FF_X35_Y6_N44
\reg_inter_2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux9~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_2(6));

-- Location: LABCELL_X39_Y5_N54
\Controle|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Mux9~0_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6) & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & 
-- !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5))) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6) & 
-- (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001100000000000000110000001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	combout => \Controle|Mux9~0_combout\);

-- Location: MLABCELL_X37_Y5_N42
\Controle|Mux16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Mux16~0_combout\ = ( !\Controle|opcode_memory\(2) & ( (\Controle|opcode_memory\(3) & (!\Controle|opcode_memory\(0) $ (!\Controle|opcode_memory\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101010000000001010101000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_opcode_memory\(3),
	datac => \Controle|ALT_INV_opcode_memory\(0),
	datad => \Controle|ALT_INV_opcode_memory\(1),
	dataf => \Controle|ALT_INV_opcode_memory\(2),
	combout => \Controle|Mux16~0_combout\);

-- Location: LABCELL_X40_Y5_N0
\Controle|Selector6~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector6~3_combout\ = ( \Controle|process_2~0_combout\ & ( (!\Controle|Mux16~0_combout\) # (!\Controle|estado.DECODIFICA_2~q\) ) ) # ( !\Controle|process_2~0_combout\ & ( (!\Controle|Mux9~0_combout\ & (((!\Controle|Mux16~0_combout\) # 
-- (!\Controle|estado.DECODIFICA_2~q\)))) # (\Controle|Mux9~0_combout\ & (!\Controle|estado.DECODIFICA~q\ & ((!\Controle|Mux16~0_combout\) # (!\Controle|estado.DECODIFICA_2~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111011100000111011101110000011111111111100001111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Mux9~0_combout\,
	datab => \Controle|ALT_INV_estado.DECODIFICA~q\,
	datac => \Controle|ALT_INV_Mux16~0_combout\,
	datad => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	dataf => \Controle|ALT_INV_process_2~0_combout\,
	combout => \Controle|Selector6~3_combout\);

-- Location: LABCELL_X40_Y5_N51
\Controle|proximo_estado.PRE_ACESSO_MEMORIA_597\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.PRE_ACESSO_MEMORIA_597~combout\ = ( \Controle|Selector6~3_combout\ & ( (!\Controle|Selector41~0_combout\ & \Controle|proximo_estado.PRE_ACESSO_MEMORIA_597~combout\) ) ) # ( !\Controle|Selector6~3_combout\ & ( 
-- (\Controle|proximo_estado.PRE_ACESSO_MEMORIA_597~combout\) # (\Controle|Selector41~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111100000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_Selector41~0_combout\,
	datad => \Controle|ALT_INV_proximo_estado.PRE_ACESSO_MEMORIA_597~combout\,
	dataf => \Controle|ALT_INV_Selector6~3_combout\,
	combout => \Controle|proximo_estado.PRE_ACESSO_MEMORIA_597~combout\);

-- Location: FF_X40_Y5_N53
\Controle|estado.PRE_ACESSO_MEMORIA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|proximo_estado.PRE_ACESSO_MEMORIA_597~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.PRE_ACESSO_MEMORIA~q\);

-- Location: LABCELL_X41_Y5_N21
\Controle|WideOr23~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|WideOr23~1_combout\ = ( !\Controle|estado.PRE_ACESSO_MEMORIA~q\ & ( (!\Controle|estado.ESPERA_MEMORIA~q\ & !\Controle|estado.ACESSO_MEMORIA~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_estado.ESPERA_MEMORIA~q\,
	datad => \Controle|ALT_INV_estado.ACESSO_MEMORIA~q\,
	dataf => \Controle|ALT_INV_estado.PRE_ACESSO_MEMORIA~q\,
	combout => \Controle|WideOr23~1_combout\);

-- Location: MLABCELL_X42_Y5_N36
\Controle|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector8~0_combout\ = ( \Controle|Mux9~0_combout\ & ( \Controle|estado.DECODIFICA~q\ & ( (!\Controle|process_2~0_combout\ & ((!\Controle|estado.DECODIFICA_2~q\) # (\Controle|Mux16~0_combout\))) ) ) ) # ( \Controle|Mux9~0_combout\ & ( 
-- !\Controle|estado.DECODIFICA~q\ & ( (!\Controle|estado.DECODIFICA_2~q\ & (!\Controle|WideOr23~1_combout\)) # (\Controle|estado.DECODIFICA_2~q\ & ((\Controle|Mux16~0_combout\))) ) ) ) # ( !\Controle|Mux9~0_combout\ & ( !\Controle|estado.DECODIFICA~q\ & ( 
-- (!\Controle|estado.DECODIFICA_2~q\ & (!\Controle|WideOr23~1_combout\)) # (\Controle|estado.DECODIFICA_2~q\ & ((\Controle|Mux16~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000110110001101100011011000110100000000000000001010111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	datab => \Controle|ALT_INV_WideOr23~1_combout\,
	datac => \Controle|ALT_INV_Mux16~0_combout\,
	datad => \Controle|ALT_INV_process_2~0_combout\,
	datae => \Controle|ALT_INV_Mux9~0_combout\,
	dataf => \Controle|ALT_INV_estado.DECODIFICA~q\,
	combout => \Controle|Selector8~0_combout\);

-- Location: LABCELL_X41_Y5_N48
\Controle|WideOr1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|WideOr1~0_combout\ = ( !\Controle|estado.PRE_ACESSO_MEMORIA~q\ & ( (!\Controle|estado.ESPERA_MEMORIA~q\ & (!\Controle|estado.ESPERA_MEMORIA_2~q\ & !\Controle|estado.ACESSO_MEMORIA~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000110000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_estado.ESPERA_MEMORIA~q\,
	datac => \Controle|ALT_INV_estado.ESPERA_MEMORIA_2~q\,
	datad => \Controle|ALT_INV_estado.ACESSO_MEMORIA~q\,
	dataf => \Controle|ALT_INV_estado.PRE_ACESSO_MEMORIA~q\,
	combout => \Controle|WideOr1~0_combout\);

-- Location: MLABCELL_X42_Y5_N9
\Controle|Selector6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector6~1_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & ( (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6) & !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	combout => \Controle|Selector6~1_combout\);

-- Location: MLABCELL_X42_Y5_N54
\Controle|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector6~0_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6) & ( (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & 
-- !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101000001010000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	datae => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	combout => \Controle|Selector6~0_combout\);

-- Location: LABCELL_X36_Y4_N15
\ULA|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux3~1_combout\ = ( !\Controle|ula_code\(3) & ( (!\Controle|ula_code\(2)) # ((!\Controle|ula_code\(1) & \Controle|ula_code\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011111010101010101111101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_ula_code\(2),
	datac => \Controle|ALT_INV_ula_code\(1),
	datad => \Controle|ALT_INV_ula_code\(0),
	dataf => \Controle|ALT_INV_ula_code\(3),
	combout => \ULA|Mux3~1_combout\);

-- Location: MLABCELL_X34_Y6_N30
\ULA|Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add2~21_sumout\ = SUM(( !reg_inter_1(0) $ (!reg_inter_2(0)) ) + ( !VCC ) + ( !VCC ))
-- \ULA|Add2~22\ = CARRY(( !reg_inter_1(0) $ (!reg_inter_2(0)) ) + ( !VCC ) + ( !VCC ))
-- \ULA|Add2~23\ = SHARE((!reg_inter_2(0)) # (reg_inter_1(0)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(0),
	datad => ALT_INV_reg_inter_2(0),
	cin => GND,
	sharein => GND,
	sumout => \ULA|Add2~21_sumout\,
	cout => \ULA|Add2~22\,
	shareout => \ULA|Add2~23\);

-- Location: MLABCELL_X34_Y6_N33
\ULA|Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add2~25_sumout\ = SUM(( !reg_inter_1(1) $ (reg_inter_2(1)) ) + ( \ULA|Add2~23\ ) + ( \ULA|Add2~22\ ))
-- \ULA|Add2~26\ = CARRY(( !reg_inter_1(1) $ (reg_inter_2(1)) ) + ( \ULA|Add2~23\ ) + ( \ULA|Add2~22\ ))
-- \ULA|Add2~27\ = SHARE((reg_inter_1(1) & !reg_inter_2(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(1),
	datad => ALT_INV_reg_inter_2(1),
	cin => \ULA|Add2~22\,
	sharein => \ULA|Add2~23\,
	sumout => \ULA|Add2~25_sumout\,
	cout => \ULA|Add2~26\,
	shareout => \ULA|Add2~27\);

-- Location: MLABCELL_X34_Y6_N36
\ULA|Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add2~17_sumout\ = SUM(( !reg_inter_1(2) $ (reg_inter_2(2)) ) + ( \ULA|Add2~27\ ) + ( \ULA|Add2~26\ ))
-- \ULA|Add2~18\ = CARRY(( !reg_inter_1(2) $ (reg_inter_2(2)) ) + ( \ULA|Add2~27\ ) + ( \ULA|Add2~26\ ))
-- \ULA|Add2~19\ = SHARE((reg_inter_1(2) & !reg_inter_2(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(2),
	datad => ALT_INV_reg_inter_2(2),
	cin => \ULA|Add2~26\,
	sharein => \ULA|Add2~27\,
	sumout => \ULA|Add2~17_sumout\,
	cout => \ULA|Add2~18\,
	shareout => \ULA|Add2~19\);

-- Location: LABCELL_X35_Y4_N57
\ULA|Mux22~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux22~0_combout\ = ( \ULA|Mux6~0_combout\ & ( (!\Controle|ula_code\(2)) # ((!\Controle|ula_code\(0) & ((!reg_inter_1(2)))) # (\Controle|ula_code\(0) & (\ULA|Add2~17_sumout\))) ) ) # ( !\ULA|Mux6~0_combout\ & ( (\Controle|ula_code\(2) & 
-- ((!\Controle|ula_code\(0) & ((!reg_inter_1(2)))) # (\Controle|ula_code\(0) & (\ULA|Add2~17_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010110001000000001011000111111111101100011111111110110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_ula_code\(0),
	datab => \ULA|ALT_INV_Add2~17_sumout\,
	datac => ALT_INV_reg_inter_1(2),
	datad => \Controle|ALT_INV_ula_code\(2),
	dataf => \ULA|ALT_INV_Mux6~0_combout\,
	combout => \ULA|Mux22~0_combout\);

-- Location: LABCELL_X36_Y4_N12
\ULA|Mux3~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux3~4_combout\ = ((\Controle|ula_code\(2) & \Controle|ula_code\(1))) # (\Controle|ula_code\(3))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011111000011110101111100001111010111110000111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_ula_code\(2),
	datac => \Controle|ALT_INV_ula_code\(3),
	datad => \Controle|ALT_INV_ula_code\(1),
	combout => \ULA|Mux3~4_combout\);

-- Location: LABCELL_X35_Y4_N30
\ULA|resultado[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado\(2) = ( \ULA|resultado\(2) & ( (\ULA|Mux3~4_combout\) # (\ULA|Mux22~0_combout\) ) ) # ( !\ULA|resultado\(2) & ( (\ULA|Mux22~0_combout\ & !\ULA|Mux3~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ULA|ALT_INV_Mux22~0_combout\,
	datad => \ULA|ALT_INV_Mux3~4_combout\,
	dataf => \ULA|ALT_INV_resultado\(2),
	combout => \ULA|resultado\(2));

-- Location: LABCELL_X35_Y4_N12
\ULA|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux6~1_combout\ = ( \ULA|Mux6~0_combout\ & ( \ULA|resultado\(2) & ( (!\ULA|Mux3~2_combout\) # ((!\ULA|Mux3~1_combout\ & (!reg_inter_1(2))) # (\ULA|Mux3~1_combout\ & ((\ULA|Add2~17_sumout\)))) ) ) ) # ( !\ULA|Mux6~0_combout\ & ( \ULA|resultado\(2) & ( 
-- (!\ULA|Mux3~1_combout\ & ((!reg_inter_1(2)) # ((!\ULA|Mux3~2_combout\)))) # (\ULA|Mux3~1_combout\ & (((\ULA|Add2~17_sumout\ & \ULA|Mux3~2_combout\)))) ) ) ) # ( \ULA|Mux6~0_combout\ & ( !\ULA|resultado\(2) & ( (!\ULA|Mux3~1_combout\ & (!reg_inter_1(2) & 
-- ((\ULA|Mux3~2_combout\)))) # (\ULA|Mux3~1_combout\ & (((!\ULA|Mux3~2_combout\) # (\ULA|Add2~17_sumout\)))) ) ) ) # ( !\ULA|Mux6~0_combout\ & ( !\ULA|resultado\(2) & ( (\ULA|Mux3~2_combout\ & ((!\ULA|Mux3~1_combout\ & (!reg_inter_1(2))) # 
-- (\ULA|Mux3~1_combout\ & ((\ULA|Add2~17_sumout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001101010101011000110110101010100011011111111110001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Mux3~1_combout\,
	datab => ALT_INV_reg_inter_1(2),
	datac => \ULA|ALT_INV_Add2~17_sumout\,
	datad => \ULA|ALT_INV_Mux3~2_combout\,
	datae => \ULA|ALT_INV_Mux6~0_combout\,
	dataf => \ULA|ALT_INV_resultado\(2),
	combout => \ULA|Mux6~1_combout\);

-- Location: MLABCELL_X34_Y6_N39
\ULA|Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add2~13_sumout\ = SUM(( !reg_inter_1(3) $ (reg_inter_2(3)) ) + ( \ULA|Add2~19\ ) + ( \ULA|Add2~18\ ))
-- \ULA|Add2~14\ = CARRY(( !reg_inter_1(3) $ (reg_inter_2(3)) ) + ( \ULA|Add2~19\ ) + ( \ULA|Add2~18\ ))
-- \ULA|Add2~15\ = SHARE((reg_inter_1(3) & !reg_inter_2(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(3),
	datad => ALT_INV_reg_inter_2(3),
	cin => \ULA|Add2~18\,
	sharein => \ULA|Add2~19\,
	sumout => \ULA|Add2~13_sumout\,
	cout => \ULA|Add2~14\,
	shareout => \ULA|Add2~15\);

-- Location: MLABCELL_X34_Y6_N42
\ULA|Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add2~9_sumout\ = SUM(( !reg_inter_1(4) $ (reg_inter_2(4)) ) + ( \ULA|Add2~15\ ) + ( \ULA|Add2~14\ ))
-- \ULA|Add2~10\ = CARRY(( !reg_inter_1(4) $ (reg_inter_2(4)) ) + ( \ULA|Add2~15\ ) + ( \ULA|Add2~14\ ))
-- \ULA|Add2~11\ = SHARE((reg_inter_1(4) & !reg_inter_2(4)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(4),
	datad => ALT_INV_reg_inter_2(4),
	cin => \ULA|Add2~14\,
	sharein => \ULA|Add2~15\,
	sumout => \ULA|Add2~9_sumout\,
	cout => \ULA|Add2~10\,
	shareout => \ULA|Add2~11\);

-- Location: MLABCELL_X37_Y6_N48
\ULA|Mux24~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux24~0_combout\ = ( \ULA|Mux4~0_combout\ & ( (!\Controle|ula_code\(2)) # ((!\Controle|ula_code\(0) & (!reg_inter_1(4))) # (\Controle|ula_code\(0) & ((\ULA|Add2~9_sumout\)))) ) ) # ( !\ULA|Mux4~0_combout\ & ( (\Controle|ula_code\(2) & 
-- ((!\Controle|ula_code\(0) & (!reg_inter_1(4))) # (\Controle|ula_code\(0) & ((\ULA|Add2~9_sumout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001101000000001000110111111111100011011111111110001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_ula_code\(0),
	datab => ALT_INV_reg_inter_1(4),
	datac => \ULA|ALT_INV_Add2~9_sumout\,
	datad => \Controle|ALT_INV_ula_code\(2),
	dataf => \ULA|ALT_INV_Mux4~0_combout\,
	combout => \ULA|Mux24~0_combout\);

-- Location: MLABCELL_X37_Y6_N51
\ULA|resultado[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado\(4) = ( \ULA|resultado\(4) & ( (\ULA|Mux3~4_combout\) # (\ULA|Mux24~0_combout\) ) ) # ( !\ULA|resultado\(4) & ( (\ULA|Mux24~0_combout\ & !\ULA|Mux3~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ULA|ALT_INV_Mux24~0_combout\,
	datad => \ULA|ALT_INV_Mux3~4_combout\,
	dataf => \ULA|ALT_INV_resultado\(4),
	combout => \ULA|resultado\(4));

-- Location: MLABCELL_X37_Y6_N42
\ULA|Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux4~1_combout\ = ( \ULA|Mux3~2_combout\ & ( \ULA|Mux4~0_combout\ & ( (!\ULA|Mux3~1_combout\ & ((!reg_inter_1(4)))) # (\ULA|Mux3~1_combout\ & (\ULA|Add2~9_sumout\)) ) ) ) # ( !\ULA|Mux3~2_combout\ & ( \ULA|Mux4~0_combout\ & ( (\ULA|resultado\(4)) # 
-- (\ULA|Mux3~1_combout\) ) ) ) # ( \ULA|Mux3~2_combout\ & ( !\ULA|Mux4~0_combout\ & ( (!\ULA|Mux3~1_combout\ & ((!reg_inter_1(4)))) # (\ULA|Mux3~1_combout\ & (\ULA|Add2~9_sumout\)) ) ) ) # ( !\ULA|Mux3~2_combout\ & ( !\ULA|Mux4~0_combout\ & ( 
-- (!\ULA|Mux3~1_combout\ & \ULA|resultado\(4)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100110111010001000100111111001111111101110100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Add2~9_sumout\,
	datab => \ULA|ALT_INV_Mux3~1_combout\,
	datac => \ULA|ALT_INV_resultado\(4),
	datad => ALT_INV_reg_inter_1(4),
	datae => \ULA|ALT_INV_Mux3~2_combout\,
	dataf => \ULA|ALT_INV_Mux4~0_combout\,
	combout => \ULA|Mux4~1_combout\);

-- Location: MLABCELL_X34_Y6_N45
\ULA|Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add2~1_sumout\ = SUM(( !reg_inter_1(5) $ (reg_inter_2(5)) ) + ( \ULA|Add2~11\ ) + ( \ULA|Add2~10\ ))
-- \ULA|Add2~2\ = CARRY(( !reg_inter_1(5) $ (reg_inter_2(5)) ) + ( \ULA|Add2~11\ ) + ( \ULA|Add2~10\ ))
-- \ULA|Add2~3\ = SHARE((reg_inter_1(5) & !reg_inter_2(5)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(5),
	datad => ALT_INV_reg_inter_2(5),
	cin => \ULA|Add2~10\,
	sharein => \ULA|Add2~11\,
	sumout => \ULA|Add2~1_sumout\,
	cout => \ULA|Add2~2\,
	shareout => \ULA|Add2~3\);

-- Location: MLABCELL_X34_Y6_N48
\ULA|Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add2~5_sumout\ = SUM(( !reg_inter_2(6) $ (reg_inter_1(6)) ) + ( \ULA|Add2~3\ ) + ( \ULA|Add2~2\ ))
-- \ULA|Add2~6\ = CARRY(( !reg_inter_2(6) $ (reg_inter_1(6)) ) + ( \ULA|Add2~3\ ) + ( \ULA|Add2~2\ ))
-- \ULA|Add2~7\ = SHARE((!reg_inter_2(6) & reg_inter_1(6)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(6),
	datad => ALT_INV_reg_inter_1(6),
	cin => \ULA|Add2~2\,
	sharein => \ULA|Add2~3\,
	sumout => \ULA|Add2~5_sumout\,
	cout => \ULA|Add2~6\,
	shareout => \ULA|Add2~7\);

-- Location: LABCELL_X36_Y4_N48
\ULA|Mux26~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux26~0_combout\ = ( \ULA|Mux2~0_combout\ & ( (!\Controle|ula_code\(2)) # ((!\Controle|ula_code\(0) & (!reg_inter_1(6))) # (\Controle|ula_code\(0) & ((\ULA|Add2~5_sumout\)))) ) ) # ( !\ULA|Mux2~0_combout\ & ( (\Controle|ula_code\(2) & 
-- ((!\Controle|ula_code\(0) & (!reg_inter_1(6))) # (\Controle|ula_code\(0) & ((\ULA|Add2~5_sumout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001011000000001000101111111111100010111111111110001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(6),
	datab => \Controle|ALT_INV_ula_code\(0),
	datac => \ULA|ALT_INV_Add2~5_sumout\,
	datad => \Controle|ALT_INV_ula_code\(2),
	dataf => \ULA|ALT_INV_Mux2~0_combout\,
	combout => \ULA|Mux26~0_combout\);

-- Location: LABCELL_X36_Y4_N51
\ULA|resultado[6]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado\(6) = ( \ULA|Mux3~4_combout\ & ( \ULA|resultado\(6) ) ) # ( !\ULA|Mux3~4_combout\ & ( \ULA|Mux26~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ULA|ALT_INV_Mux26~0_combout\,
	datad => \ULA|ALT_INV_resultado\(6),
	dataf => \ULA|ALT_INV_Mux3~4_combout\,
	combout => \ULA|resultado\(6));

-- Location: LABCELL_X36_Y4_N24
\ULA|Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux2~1_combout\ = ( \ULA|Mux3~1_combout\ & ( \ULA|Mux2~0_combout\ & ( (!\ULA|Mux3~2_combout\) # (\ULA|Add2~5_sumout\) ) ) ) # ( !\ULA|Mux3~1_combout\ & ( \ULA|Mux2~0_combout\ & ( (!\ULA|Mux3~2_combout\ & (\ULA|resultado\(6))) # (\ULA|Mux3~2_combout\ 
-- & ((!reg_inter_1(6)))) ) ) ) # ( \ULA|Mux3~1_combout\ & ( !\ULA|Mux2~0_combout\ & ( (\ULA|Mux3~2_combout\ & \ULA|Add2~5_sumout\) ) ) ) # ( !\ULA|Mux3~1_combout\ & ( !\ULA|Mux2~0_combout\ & ( (!\ULA|Mux3~2_combout\ & (\ULA|resultado\(6))) # 
-- (\ULA|Mux3~2_combout\ & ((!reg_inter_1(6)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001001110010000000000101010101110010011100101010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Mux3~2_combout\,
	datab => \ULA|ALT_INV_resultado\(6),
	datac => ALT_INV_reg_inter_1(6),
	datad => \ULA|ALT_INV_Add2~5_sumout\,
	datae => \ULA|ALT_INV_Mux3~1_combout\,
	dataf => \ULA|ALT_INV_Mux2~0_combout\,
	combout => \ULA|Mux2~1_combout\);

-- Location: MLABCELL_X37_Y4_N6
\ULA|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux3~0_combout\ = ( \ULA|Add0~1_sumout\ & ( \Controle|ula_code\(1) & ( (!reg_inter_1(5) & (reg_inter_2(5) & \Controle|ula_code\(0))) # (reg_inter_1(5) & ((\Controle|ula_code\(0)) # (reg_inter_2(5)))) ) ) ) # ( !\ULA|Add0~1_sumout\ & ( 
-- \Controle|ula_code\(1) & ( (!reg_inter_1(5) & (reg_inter_2(5) & \Controle|ula_code\(0))) # (reg_inter_1(5) & ((\Controle|ula_code\(0)) # (reg_inter_2(5)))) ) ) ) # ( \ULA|Add0~1_sumout\ & ( !\Controle|ula_code\(1) & ( (!\Controle|ula_code\(0)) # 
-- (\ULA|Add1~1_sumout\) ) ) ) # ( !\ULA|Add0~1_sumout\ & ( !\Controle|ula_code\(1) & ( (\Controle|ula_code\(0) & \ULA|Add1~1_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111100001111111100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(5),
	datab => ALT_INV_reg_inter_2(5),
	datac => \Controle|ALT_INV_ula_code\(0),
	datad => \ULA|ALT_INV_Add1~1_sumout\,
	datae => \ULA|ALT_INV_Add0~1_sumout\,
	dataf => \Controle|ALT_INV_ula_code\(1),
	combout => \ULA|Mux3~0_combout\);

-- Location: MLABCELL_X37_Y4_N3
\ULA|Mux25~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux25~0_combout\ = ( \ULA|Add2~1_sumout\ & ( \Controle|ula_code\(2) & ( (!reg_inter_1(5)) # (\Controle|ula_code\(0)) ) ) ) # ( !\ULA|Add2~1_sumout\ & ( \Controle|ula_code\(2) & ( (!\Controle|ula_code\(0) & !reg_inter_1(5)) ) ) ) # ( 
-- \ULA|Add2~1_sumout\ & ( !\Controle|ula_code\(2) & ( \ULA|Mux3~0_combout\ ) ) ) # ( !\ULA|Add2~1_sumout\ & ( !\Controle|ula_code\(2) & ( \ULA|Mux3~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111110101010000000001111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_ula_code\(0),
	datac => \ULA|ALT_INV_Mux3~0_combout\,
	datad => ALT_INV_reg_inter_1(5),
	datae => \ULA|ALT_INV_Add2~1_sumout\,
	dataf => \Controle|ALT_INV_ula_code\(2),
	combout => \ULA|Mux25~0_combout\);

-- Location: MLABCELL_X37_Y4_N36
\ULA|resultado[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado\(5) = (!\ULA|Mux3~4_combout\ & (\ULA|Mux25~0_combout\)) # (\ULA|Mux3~4_combout\ & ((\ULA|resultado\(5))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000111111001100000011111100110000001111110011000000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ULA|ALT_INV_Mux25~0_combout\,
	datac => \ULA|ALT_INV_Mux3~4_combout\,
	datad => \ULA|ALT_INV_resultado\(5),
	combout => \ULA|resultado\(5));

-- Location: MLABCELL_X37_Y4_N54
\ULA|Mux3~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux3~3_combout\ = ( \ULA|resultado\(5) & ( \ULA|Mux3~0_combout\ & ( (!\ULA|Mux3~2_combout\) # ((!\ULA|Mux3~1_combout\ & (!reg_inter_1(5))) # (\ULA|Mux3~1_combout\ & ((\ULA|Add2~1_sumout\)))) ) ) ) # ( !\ULA|resultado\(5) & ( \ULA|Mux3~0_combout\ & ( 
-- (!\ULA|Mux3~2_combout\ & (((\ULA|Mux3~1_combout\)))) # (\ULA|Mux3~2_combout\ & ((!\ULA|Mux3~1_combout\ & (!reg_inter_1(5))) # (\ULA|Mux3~1_combout\ & ((\ULA|Add2~1_sumout\))))) ) ) ) # ( \ULA|resultado\(5) & ( !\ULA|Mux3~0_combout\ & ( 
-- (!\ULA|Mux3~2_combout\ & (((!\ULA|Mux3~1_combout\)))) # (\ULA|Mux3~2_combout\ & ((!\ULA|Mux3~1_combout\ & (!reg_inter_1(5))) # (\ULA|Mux3~1_combout\ & ((\ULA|Add2~1_sumout\))))) ) ) ) # ( !\ULA|resultado\(5) & ( !\ULA|Mux3~0_combout\ & ( 
-- (\ULA|Mux3~2_combout\ & ((!\ULA|Mux3~1_combout\ & (!reg_inter_1(5))) # (\ULA|Mux3~1_combout\ & ((\ULA|Add2~1_sumout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001000101111000001110010101001010010011111110101011101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Mux3~2_combout\,
	datab => ALT_INV_reg_inter_1(5),
	datac => \ULA|ALT_INV_Mux3~1_combout\,
	datad => \ULA|ALT_INV_Add2~1_sumout\,
	datae => \ULA|ALT_INV_resultado\(5),
	dataf => \ULA|ALT_INV_Mux3~0_combout\,
	combout => \ULA|Mux3~3_combout\);

-- Location: LABCELL_X36_Y4_N54
\ULA|Mux19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux19~0_combout\ = ( \ULA|Mux8~0_combout\ & ( (!\Controle|ula_code\(2)) # ((!\Controle|ula_code\(0) & ((!reg_inter_1(0)))) # (\Controle|ula_code\(0) & (\ULA|Add2~21_sumout\))) ) ) # ( !\ULA|Mux8~0_combout\ & ( (\Controle|ula_code\(2) & 
-- ((!\Controle|ula_code\(0) & ((!reg_inter_1(0)))) # (\Controle|ula_code\(0) & (\ULA|Add2~21_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011010001000000001101000111111111110100011111111111010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Add2~21_sumout\,
	datab => \Controle|ALT_INV_ula_code\(0),
	datac => ALT_INV_reg_inter_1(0),
	datad => \Controle|ALT_INV_ula_code\(2),
	dataf => \ULA|ALT_INV_Mux8~0_combout\,
	combout => \ULA|Mux19~0_combout\);

-- Location: LABCELL_X36_Y4_N57
\ULA|resultado[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado\(0) = ( \ULA|Mux19~0_combout\ & ( (!\ULA|Mux3~4_combout\) # (\ULA|resultado\(0)) ) ) # ( !\ULA|Mux19~0_combout\ & ( (\ULA|Mux3~4_combout\ & \ULA|resultado\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ULA|ALT_INV_Mux3~4_combout\,
	datad => \ULA|ALT_INV_resultado\(0),
	dataf => \ULA|ALT_INV_Mux19~0_combout\,
	combout => \ULA|resultado\(0));

-- Location: LABCELL_X35_Y4_N6
\ULA|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Equal0~1_combout\ = ( \ULA|Add2~21_sumout\ & ( \ULA|Mux3~1_combout\ & ( !\ULA|Mux3~2_combout\ ) ) ) # ( !\ULA|Add2~21_sumout\ & ( \ULA|Mux3~1_combout\ & ( (!\ULA|Add2~25_sumout\) # (!\ULA|Mux3~2_combout\) ) ) ) # ( \ULA|Add2~21_sumout\ & ( 
-- !\ULA|Mux3~1_combout\ & ( (reg_inter_1(1) & (reg_inter_1(0) & \ULA|Mux3~2_combout\)) ) ) ) # ( !\ULA|Add2~21_sumout\ & ( !\ULA|Mux3~1_combout\ & ( (reg_inter_1(1) & (reg_inter_1(0) & \ULA|Mux3~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000111111111111100001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(1),
	datab => ALT_INV_reg_inter_1(0),
	datac => \ULA|ALT_INV_Add2~25_sumout\,
	datad => \ULA|ALT_INV_Mux3~2_combout\,
	datae => \ULA|ALT_INV_Add2~21_sumout\,
	dataf => \ULA|ALT_INV_Mux3~1_combout\,
	combout => \ULA|Equal0~1_combout\);

-- Location: LABCELL_X36_Y4_N18
\ULA|Mux21~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux21~0_combout\ = ( \ULA|Mux7~0_combout\ & ( (!\Controle|ula_code\(2)) # ((!\Controle|ula_code\(0) & ((!reg_inter_1(1)))) # (\Controle|ula_code\(0) & (\ULA|Add2~25_sumout\))) ) ) # ( !\ULA|Mux7~0_combout\ & ( (\Controle|ula_code\(2) & 
-- ((!\Controle|ula_code\(0) & ((!reg_inter_1(1)))) # (\Controle|ula_code\(0) & (\ULA|Add2~25_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000101000000001100010111111111110001011111111111000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Add2~25_sumout\,
	datab => ALT_INV_reg_inter_1(1),
	datac => \Controle|ALT_INV_ula_code\(0),
	datad => \Controle|ALT_INV_ula_code\(2),
	dataf => \ULA|ALT_INV_Mux7~0_combout\,
	combout => \ULA|Mux21~0_combout\);

-- Location: LABCELL_X36_Y4_N21
\ULA|resultado[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado\(1) = ( \ULA|Mux21~0_combout\ & ( (!\ULA|Mux3~4_combout\) # (\ULA|resultado\(1)) ) ) # ( !\ULA|Mux21~0_combout\ & ( (\ULA|Mux3~4_combout\ & \ULA|resultado\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ULA|ALT_INV_Mux3~4_combout\,
	datad => \ULA|ALT_INV_resultado\(1),
	dataf => \ULA|ALT_INV_Mux21~0_combout\,
	combout => \ULA|resultado\(1));

-- Location: LABCELL_X36_Y4_N0
\ULA|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Equal0~2_combout\ = ( !\ULA|Equal0~1_combout\ & ( ((!\ULA|Mux3~2_combout\ & (!\ULA|resultado\(1) & (!\ULA|resultado\(0) & !\ULA|Mux1~0_combout\)))) ) ) # ( \ULA|Equal0~1_combout\ & ( ((!\ULA|Mux1~0_combout\ & (((!\ULA|Mux7~0_combout\ & 
-- !\ULA|Mux8~0_combout\)) # (\ULA|Mux3~2_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1100000000000000101100111011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Mux7~0_combout\,
	datab => \ULA|ALT_INV_Mux3~2_combout\,
	datac => \ULA|ALT_INV_Mux8~0_combout\,
	datad => \ULA|ALT_INV_resultado\(0),
	datae => \ULA|ALT_INV_Equal0~1_combout\,
	dataf => \ULA|ALT_INV_Mux1~0_combout\,
	datag => \ULA|ALT_INV_resultado\(1),
	combout => \ULA|Equal0~2_combout\);

-- Location: LABCELL_X36_Y6_N6
\ULA|Mux23~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux23~0_combout\ = ( reg_inter_1(3) & ( (!\Controle|ula_code\(2) & (((\ULA|Mux5~0_combout\)))) # (\Controle|ula_code\(2) & (\ULA|Add2~13_sumout\ & ((\Controle|ula_code\(0))))) ) ) # ( !reg_inter_1(3) & ( (!\Controle|ula_code\(2) & 
-- (((\ULA|Mux5~0_combout\)))) # (\Controle|ula_code\(2) & (((!\Controle|ula_code\(0))) # (\ULA|Add2~13_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100011101001111110001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Add2~13_sumout\,
	datab => \Controle|ALT_INV_ula_code\(2),
	datac => \ULA|ALT_INV_Mux5~0_combout\,
	datad => \Controle|ALT_INV_ula_code\(0),
	dataf => ALT_INV_reg_inter_1(3),
	combout => \ULA|Mux23~0_combout\);

-- Location: LABCELL_X36_Y6_N9
\ULA|resultado[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado\(3) = ( \ULA|resultado\(3) & ( (\ULA|Mux3~4_combout\) # (\ULA|Mux23~0_combout\) ) ) # ( !\ULA|resultado\(3) & ( (\ULA|Mux23~0_combout\ & !\ULA|Mux3~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ULA|ALT_INV_Mux23~0_combout\,
	datad => \ULA|ALT_INV_Mux3~4_combout\,
	dataf => \ULA|ALT_INV_resultado\(3),
	combout => \ULA|resultado\(3));

-- Location: LABCELL_X35_Y4_N48
\ULA|Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux5~1_combout\ = ( \ULA|resultado\(3) & ( \ULA|Mux5~0_combout\ & ( (!\ULA|Mux3~2_combout\) # ((!\ULA|Mux3~1_combout\ & (!reg_inter_1(3))) # (\ULA|Mux3~1_combout\ & ((\ULA|Add2~13_sumout\)))) ) ) ) # ( !\ULA|resultado\(3) & ( \ULA|Mux5~0_combout\ & ( 
-- (!\ULA|Mux3~1_combout\ & (!reg_inter_1(3) & ((\ULA|Mux3~2_combout\)))) # (\ULA|Mux3~1_combout\ & (((!\ULA|Mux3~2_combout\) # (\ULA|Add2~13_sumout\)))) ) ) ) # ( \ULA|resultado\(3) & ( !\ULA|Mux5~0_combout\ & ( (!\ULA|Mux3~1_combout\ & ((!reg_inter_1(3)) # 
-- ((!\ULA|Mux3~2_combout\)))) # (\ULA|Mux3~1_combout\ & (((\ULA|Add2~13_sumout\ & \ULA|Mux3~2_combout\)))) ) ) ) # ( !\ULA|resultado\(3) & ( !\ULA|Mux5~0_combout\ & ( (\ULA|Mux3~2_combout\ & ((!\ULA|Mux3~1_combout\ & (!reg_inter_1(3))) # 
-- (\ULA|Mux3~1_combout\ & ((\ULA|Add2~13_sumout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001011110011001000101100110011100010111111111110001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(3),
	datab => \ULA|ALT_INV_Mux3~1_combout\,
	datac => \ULA|ALT_INV_Add2~13_sumout\,
	datad => \ULA|ALT_INV_Mux3~2_combout\,
	datae => \ULA|ALT_INV_resultado\(3),
	dataf => \ULA|ALT_INV_Mux5~0_combout\,
	combout => \ULA|Mux5~1_combout\);

-- Location: LABCELL_X36_Y4_N36
\ULA|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Equal0~0_combout\ = ( \ULA|Equal0~2_combout\ & ( !\ULA|Mux5~1_combout\ & ( (!\ULA|Mux6~1_combout\ & (!\ULA|Mux4~1_combout\ & (!\ULA|Mux2~1_combout\ & !\ULA|Mux3~3_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Mux6~1_combout\,
	datab => \ULA|ALT_INV_Mux4~1_combout\,
	datac => \ULA|ALT_INV_Mux2~1_combout\,
	datad => \ULA|ALT_INV_Mux3~3_combout\,
	datae => \ULA|ALT_INV_Equal0~2_combout\,
	dataf => \ULA|ALT_INV_Mux5~1_combout\,
	combout => \ULA|Equal0~0_combout\);

-- Location: MLABCELL_X37_Y4_N48
\overflow_flag~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \overflow_flag~0_combout\ = ( \Controle|estado.EXECUTA~q\ & ( \reset~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_reset~input_o\,
	dataf => \Controle|ALT_INV_estado.EXECUTA~q\,
	combout => \overflow_flag~0_combout\);

-- Location: FF_X36_Y4_N38
zero_flag : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \ULA|Equal0~0_combout\,
	ena => \overflow_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \zero_flag~q\);

-- Location: MLABCELL_X42_Y5_N42
\Controle|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector0~0_combout\ = ( \zero_flag~q\ & ( \sign_flag~q\ & ( (\Controle|Selector6~0_combout\ & \Controle|estado.SALTO_ADR~q\) ) ) ) # ( !\zero_flag~q\ & ( \sign_flag~q\ & ( (\Controle|estado.SALTO_ADR~q\ & (((\Controle|Selector6~1_combout\ & 
-- \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4))) # (\Controle|Selector6~0_combout\))) ) ) ) # ( \zero_flag~q\ & ( !\sign_flag~q\ & ( (\Controle|Selector6~0_combout\ & \Controle|estado.SALTO_ADR~q\) ) ) ) # ( !\zero_flag~q\ & ( 
-- !\sign_flag~q\ & ( (\Controle|Selector6~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & \Controle|estado.SALTO_ADR~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000011001100000000001101110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector6~1_combout\,
	datab => \Controle|ALT_INV_Selector6~0_combout\,
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	datad => \Controle|ALT_INV_estado.SALTO_ADR~q\,
	datae => \ALT_INV_zero_flag~q\,
	dataf => \ALT_INV_sign_flag~q\,
	combout => \Controle|Selector0~0_combout\);

-- Location: LABCELL_X41_Y5_N0
\Controle|proximo_estado.NAO_PULOU_520\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.NAO_PULOU_520~combout\ = ( \Controle|Selector0~0_combout\ & ( (\Controle|proximo_estado.NAO_PULOU_520~combout\) # (\Controle|Selector41~0_combout\) ) ) # ( !\Controle|Selector0~0_combout\ & ( (!\Controle|Selector41~0_combout\ & 
-- \Controle|proximo_estado.NAO_PULOU_520~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_Selector41~0_combout\,
	datad => \Controle|ALT_INV_proximo_estado.NAO_PULOU_520~combout\,
	dataf => \Controle|ALT_INV_Selector0~0_combout\,
	combout => \Controle|proximo_estado.NAO_PULOU_520~combout\);

-- Location: FF_X41_Y5_N2
\Controle|estado.NAO_PULOU\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|proximo_estado.NAO_PULOU_520~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.NAO_PULOU~q\);

-- Location: LABCELL_X41_Y5_N36
\Controle|proximo_estado.ESPERA_PULO_531\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.ESPERA_PULO_531~combout\ = ( \Controle|estado.PULANDO~q\ & ( (\Controle|proximo_estado.ESPERA_PULO_531~combout\) # (\Controle|Selector41~0_combout\) ) ) # ( !\Controle|estado.PULANDO~q\ & ( (!\Controle|Selector41~0_combout\ & 
-- \Controle|proximo_estado.ESPERA_PULO_531~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_Selector41~0_combout\,
	datad => \Controle|ALT_INV_proximo_estado.ESPERA_PULO_531~combout\,
	dataf => \Controle|ALT_INV_estado.PULANDO~q\,
	combout => \Controle|proximo_estado.ESPERA_PULO_531~combout\);

-- Location: FF_X41_Y5_N38
\Controle|estado.ESPERA_PULO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|proximo_estado.ESPERA_PULO_531~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.ESPERA_PULO~q\);

-- Location: LABCELL_X41_Y5_N3
\Controle|Selector6~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector6~4_combout\ = ( !\Controle|estado.ESPERA_PULO~q\ & ( (!\Controle|estado.NAO_PULOU~q\ & (!\Controle|estado.ESPERA_PC~q\ & (!\Controle|estado.PULANDO~q\ & !\Controle|estado.PEGA_LITERAL~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.NAO_PULOU~q\,
	datab => \Controle|ALT_INV_estado.ESPERA_PC~q\,
	datac => \Controle|ALT_INV_estado.PULANDO~q\,
	datad => \Controle|ALT_INV_estado.PEGA_LITERAL~q\,
	dataf => \Controle|ALT_INV_estado.ESPERA_PULO~q\,
	combout => \Controle|Selector6~4_combout\);

-- Location: LABCELL_X41_Y5_N51
\Controle|Selector6~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector6~5_combout\ = ( \Controle|Selector6~3_combout\ & ( (!\Controle|WideOr1~0_combout\) # ((!\Controle|Selector6~4_combout\) # (\Controle|Selector6~2_combout\)) ) ) # ( !\Controle|Selector6~3_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111101011111111111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_WideOr1~0_combout\,
	datac => \Controle|ALT_INV_Selector6~2_combout\,
	datad => \Controle|ALT_INV_Selector6~4_combout\,
	dataf => \Controle|ALT_INV_Selector6~3_combout\,
	combout => \Controle|Selector6~5_combout\);

-- Location: FF_X42_Y5_N2
\mem_address[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \mem_address[6]~feeder_combout\,
	asdata => reg_inter_2(6),
	clrn => \reset~input_o\,
	sload => \Controle|Selector8~0_combout\,
	ena => \Controle|Selector6~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_address(6));

-- Location: LABCELL_X39_Y5_N21
\PC|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC|Add0~29_sumout\ = SUM(( \PC|pc\(7) ) + ( GND ) + ( \PC|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_pc\(7),
	cin => \PC|Add0~26\,
	sumout => \PC|Add0~29_sumout\);

-- Location: FF_X39_Y5_N22
\PC|pc[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \PC|Add0~29_sumout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7),
	clrn => \reset~input_o\,
	sload => \Controle|estado.PULANDO~q\,
	ena => \Controle|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|pc\(7));

-- Location: MLABCELL_X42_Y5_N30
\mem_address[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem_address[7]~feeder_combout\ = ( \PC|pc\(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \PC|ALT_INV_pc\(7),
	combout => \mem_address[7]~feeder_combout\);

-- Location: MLABCELL_X34_Y6_N3
\reg_literal[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_literal[7]~feeder_combout\ = reg_inter_2(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_2(7),
	combout => \reg_literal[7]~feeder_combout\);

-- Location: FF_X34_Y6_N5
\reg_literal[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_literal[7]~feeder_combout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7),
	clrn => \reset~input_o\,
	sload => \reg_literal~0_combout\,
	ena => \reg_literal[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_literal(7));

-- Location: IOIBUF_X34_Y0_N35
\switches[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(7),
	o => \switches[7]~input_o\);

-- Location: LABCELL_X36_Y7_N42
\reg_a~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a~10_combout\ = ( \reg_a~0_combout\ & ( \Controle|Selector10~1_combout\ & ( reg_inter_2(7) ) ) ) # ( !\reg_a~0_combout\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_a~1_combout\ & ((\switches[7]~input_o\))) # (\reg_a~1_combout\ & 
-- (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7))) ) ) ) # ( \reg_a~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( reg_inter_2(7) ) ) ) # ( !\reg_a~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( \switches[7]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111100010001101110110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_a~1_combout\,
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	datac => ALT_INV_reg_inter_2(7),
	datad => \ALT_INV_switches[7]~input_o\,
	datae => \ALT_INV_reg_a~0_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_a~10_combout\);

-- Location: FF_X36_Y7_N44
\reg_a[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_a~10_combout\,
	clrn => \reset~input_o\,
	ena => \reg_a[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_a(7));

-- Location: LABCELL_X36_Y7_N48
\reg_b~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b~10_combout\ = ( reg_inter_2(7) & ( \Controle|Selector10~1_combout\ & ( (\switches[7]~input_o\) # (\reg_b~0_combout\) ) ) ) # ( !reg_inter_2(7) & ( \Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & \switches[7]~input_o\) ) ) ) # ( 
-- reg_inter_2(7) & ( !\Controle|Selector10~1_combout\ & ( ((!\reg_a~1_combout\ & ((\switches[7]~input_o\))) # (\reg_a~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7)))) # (\reg_b~0_combout\) ) ) ) # ( !reg_inter_2(7) & ( 
-- !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & ((!\reg_a~1_combout\ & ((\switches[7]~input_o\))) # (\reg_a~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000010110000000111111011111100000000111100000000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_a~1_combout\,
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	datac => \ALT_INV_reg_b~0_combout\,
	datad => \ALT_INV_switches[7]~input_o\,
	datae => ALT_INV_reg_inter_2(7),
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_b~10_combout\);

-- Location: FF_X36_Y7_N50
\reg_b[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_b~10_combout\,
	clrn => \reset~input_o\,
	ena => \reg_b[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_b(7));

-- Location: MLABCELL_X37_Y6_N21
\ULA|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~29_sumout\ = SUM(( reg_inter_2(7) ) + ( reg_inter_1(7) ) + ( \ULA|Add0~6\ ))
-- \ULA|Add0~30\ = CARRY(( reg_inter_2(7) ) + ( reg_inter_1(7) ) + ( \ULA|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(7),
	datad => ALT_INV_reg_inter_2(7),
	cin => \ULA|Add0~6\,
	sumout => \ULA|Add0~29_sumout\,
	cout => \ULA|Add0~30\);

-- Location: LABCELL_X36_Y6_N51
\ULA|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add1~29_sumout\ = SUM(( !reg_inter_1(7) $ (reg_inter_2(7)) ) + ( \ULA|Add1~7\ ) + ( \ULA|Add1~6\ ))
-- \ULA|Add1~30\ = CARRY(( !reg_inter_1(7) $ (reg_inter_2(7)) ) + ( \ULA|Add1~7\ ) + ( \ULA|Add1~6\ ))
-- \ULA|Add1~31\ = SHARE((reg_inter_1(7) & !reg_inter_2(7)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_reg_inter_1(7),
	datad => ALT_INV_reg_inter_2(7),
	cin => \ULA|Add1~6\,
	sharein => \ULA|Add1~7\,
	sumout => \ULA|Add1~29_sumout\,
	cout => \ULA|Add1~30\,
	shareout => \ULA|Add1~31\);

-- Location: LABCELL_X36_Y6_N0
\ULA|Mux17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux17~0_combout\ = ( \ULA|Add0~29_sumout\ & ( \ULA|Add1~29_sumout\ & ( (!\Controle|ula_code\(1)) # ((!reg_inter_2(7) & (reg_inter_1(7) & \Controle|ula_code\(0))) # (reg_inter_2(7) & ((\Controle|ula_code\(0)) # (reg_inter_1(7))))) ) ) ) # ( 
-- !\ULA|Add0~29_sumout\ & ( \ULA|Add1~29_sumout\ & ( (!reg_inter_2(7) & (\Controle|ula_code\(0) & ((!\Controle|ula_code\(1)) # (reg_inter_1(7))))) # (reg_inter_2(7) & (((reg_inter_1(7) & \Controle|ula_code\(1))) # (\Controle|ula_code\(0)))) ) ) ) # ( 
-- \ULA|Add0~29_sumout\ & ( !\ULA|Add1~29_sumout\ & ( (!\Controle|ula_code\(1) & (((!\Controle|ula_code\(0))))) # (\Controle|ula_code\(1) & ((!reg_inter_2(7) & (reg_inter_1(7) & \Controle|ula_code\(0))) # (reg_inter_2(7) & ((\Controle|ula_code\(0)) # 
-- (reg_inter_1(7)))))) ) ) ) # ( !\ULA|Add0~29_sumout\ & ( !\ULA|Add1~29_sumout\ & ( (\Controle|ula_code\(1) & ((!reg_inter_2(7) & (reg_inter_1(7) & \Controle|ula_code\(0))) # (reg_inter_2(7) & ((\Controle|ula_code\(0)) # (reg_inter_1(7)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000111111100010000011100000001111101111111000111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_2(7),
	datab => ALT_INV_reg_inter_1(7),
	datac => \Controle|ALT_INV_ula_code\(1),
	datad => \Controle|ALT_INV_ula_code\(0),
	datae => \ULA|ALT_INV_Add0~29_sumout\,
	dataf => \ULA|ALT_INV_Add1~29_sumout\,
	combout => \ULA|Mux17~0_combout\);

-- Location: LABCELL_X36_Y6_N12
\ULA|Mux17~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux17~1_combout\ = ( \ULA|Mux3~2_combout\ & ( (!reg_inter_1(7)) # ((\ULA|Mux17~0_combout\ & \ULA|Mux10~2_combout\)) ) ) # ( !\ULA|Mux3~2_combout\ & ( (\ULA|Mux17~0_combout\ & \ULA|Mux10~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111001100110011111100110011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_inter_1(7),
	datac => \ULA|ALT_INV_Mux17~0_combout\,
	datad => \ULA|ALT_INV_Mux10~2_combout\,
	dataf => \ULA|ALT_INV_Mux3~2_combout\,
	combout => \ULA|Mux17~1_combout\);

-- Location: LABCELL_X36_Y6_N15
\ULA|result[7]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|result\(7) = ( \ULA|Mux17~1_combout\ & ( (!\Equal0~0_combout\) # (\ULA|result\(7)) ) ) # ( !\ULA|Mux17~1_combout\ & ( (\ULA|result\(7) & \Equal0~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ULA|ALT_INV_result\(7),
	datad => \ALT_INV_Equal0~0_combout\,
	dataf => \ULA|ALT_INV_Mux17~1_combout\,
	combout => \ULA|result\(7));

-- Location: LABCELL_X35_Y5_N54
\reg_r~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r~11_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & ( \reg_r[3]~0_combout\ & ( (\reg_r[3]~1_combout\) # (\switches[7]~input_o\) ) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & ( 
-- \reg_r[3]~0_combout\ & ( (\switches[7]~input_o\ & !\reg_r[3]~1_combout\) ) ) ) # ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & ( !\reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & ((\ULA|result\(7)))) # (\reg_r[3]~1_combout\ & 
-- (reg_inter_2(7))) ) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & ( !\reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & ((\ULA|result\(7)))) # (\reg_r[3]~1_combout\ & (reg_inter_2(7))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100110011000011110011001101010101000000000101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switches[7]~input_o\,
	datab => ALT_INV_reg_inter_2(7),
	datac => \ULA|ALT_INV_result\(7),
	datad => \ALT_INV_reg_r[3]~1_combout\,
	datae => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	dataf => \ALT_INV_reg_r[3]~0_combout\,
	combout => \reg_r~11_combout\);

-- Location: FF_X35_Y5_N56
\reg_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_r~11_combout\,
	clrn => \reset~input_o\,
	ena => \reg_r[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_r(7));

-- Location: LABCELL_X32_Y6_N9
\Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = ( \Controle|Selector12~0_combout\ & ( \Controle|Selector11~0_combout\ & ( reg_literal(7) ) ) ) # ( !\Controle|Selector12~0_combout\ & ( \Controle|Selector11~0_combout\ & ( reg_r(7) ) ) ) # ( \Controle|Selector12~0_combout\ & ( 
-- !\Controle|Selector11~0_combout\ & ( reg_b(7) ) ) ) # ( !\Controle|Selector12~0_combout\ & ( !\Controle|Selector11~0_combout\ & ( reg_a(7) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000011110000111100000000111111110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_literal(7),
	datab => ALT_INV_reg_a(7),
	datac => ALT_INV_reg_b(7),
	datad => ALT_INV_reg_r(7),
	datae => \Controle|ALT_INV_Selector12~0_combout\,
	dataf => \Controle|ALT_INV_Selector11~0_combout\,
	combout => \Mux8~0_combout\);

-- Location: FF_X32_Y6_N11
\reg_inter_2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux8~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_2(7));

-- Location: FF_X42_Y5_N32
\mem_address[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \mem_address[7]~feeder_combout\,
	asdata => reg_inter_2(7),
	clrn => \reset~input_o\,
	sload => \Controle|Selector8~0_combout\,
	ena => \Controle|Selector6~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_address(7));

-- Location: M10K_X38_Y5_N0
\Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "memoria_unidade:Memoria|ram256x8:ram_instance|altsyncram:altsyncram_component|altsyncram_n504:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 40,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 8,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock1",
	port_b_data_width => 40,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 255,
	port_b_logical_ram_depth => 256,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \Controle|Selector13~0_combout\,
	portbre => VCC,
	clk0 => \clock~inputCLKENA0_outclk\,
	clk1 => \clock~inputCLKENA0_outclk\,
	ena0 => \Controle|Selector13~0_combout\,
	portadatain => \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \Memoria|ram_instance|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: MLABCELL_X37_Y5_N57
\Controle|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector3~0_combout\ = ( \Controle|estado.DECODIFICA_2~q\ & ( \Controle|opcode_memory\(2) ) ) # ( !\Controle|estado.DECODIFICA_2~q\ & ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_opcode_memory\(2),
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	dataf => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	combout => \Controle|Selector3~0_combout\);

-- Location: LABCELL_X36_Y5_N45
\Controle|ula_code[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|ula_code\(2) = ( \Controle|Selector3~0_combout\ & ( (!\Controle|WideOr23~0_combout\) # (\Controle|ula_code\(2)) ) ) # ( !\Controle|Selector3~0_combout\ & ( (\Controle|ula_code\(2) & \Controle|WideOr23~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_ula_code\(2),
	datad => \Controle|ALT_INV_WideOr23~0_combout\,
	dataf => \Controle|ALT_INV_Selector3~0_combout\,
	combout => \Controle|ula_code\(2));

-- Location: LABCELL_X36_Y5_N42
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !\Controle|ula_code\(3) & ( (\Controle|ula_code\(2) & (!\Controle|ula_code\(1) & \Controle|ula_code\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110000000000000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_ula_code\(2),
	datac => \Controle|ALT_INV_ula_code\(1),
	datad => \Controle|ALT_INV_ula_code\(0),
	dataf => \Controle|ALT_INV_ula_code\(3),
	combout => \Equal0~0_combout\);

-- Location: MLABCELL_X37_Y4_N51
\ULA|Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux15~0_combout\ = ( \ULA|Mux3~0_combout\ & ( ((!reg_inter_1(5) & \ULA|Mux3~2_combout\)) # (\ULA|Mux10~2_combout\) ) ) # ( !\ULA|Mux3~0_combout\ & ( (!reg_inter_1(5) & \ULA|Mux3~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001010111111110000101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(5),
	datac => \ULA|ALT_INV_Mux3~2_combout\,
	datad => \ULA|ALT_INV_Mux10~2_combout\,
	dataf => \ULA|ALT_INV_Mux3~0_combout\,
	combout => \ULA|Mux15~0_combout\);

-- Location: MLABCELL_X37_Y4_N18
\ULA|result[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|result\(5) = ( \ULA|Mux15~0_combout\ & ( (!\Equal0~0_combout\) # (\ULA|result\(5)) ) ) # ( !\ULA|Mux15~0_combout\ & ( (\Equal0~0_combout\ & \ULA|result\(5)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010110101111101011111010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~0_combout\,
	datac => \ULA|ALT_INV_result\(5),
	dataf => \ULA|ALT_INV_Mux15~0_combout\,
	combout => \ULA|result\(5));

-- Location: LABCELL_X35_Y5_N42
\reg_r~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_r~9_combout\ = ( \ULA|result\(5) & ( \reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & ((\switches[5]~input_o\))) # (\reg_r[3]~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5))) ) ) ) # ( !\ULA|result\(5) & ( 
-- \reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\ & ((\switches[5]~input_o\))) # (\reg_r[3]~1_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5))) ) ) ) # ( \ULA|result\(5) & ( !\reg_r[3]~0_combout\ & ( (!\reg_r[3]~1_combout\) # 
-- (reg_inter_2(5)) ) ) ) # ( !\ULA|result\(5) & ( !\reg_r[3]~0_combout\ & ( (reg_inter_2(5) & \reg_r[3]~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011111111110011001100001111010101010000111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	datab => ALT_INV_reg_inter_2(5),
	datac => \ALT_INV_switches[5]~input_o\,
	datad => \ALT_INV_reg_r[3]~1_combout\,
	datae => \ULA|ALT_INV_result\(5),
	dataf => \ALT_INV_reg_r[3]~0_combout\,
	combout => \reg_r~9_combout\);

-- Location: FF_X35_Y5_N44
\reg_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_r~9_combout\,
	clrn => \reset~input_o\,
	ena => \reg_r[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_r(5));

-- Location: LABCELL_X32_Y6_N27
\Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = ( \Controle|Selector12~0_combout\ & ( \Controle|Selector11~0_combout\ & ( reg_literal(5) ) ) ) # ( !\Controle|Selector12~0_combout\ & ( \Controle|Selector11~0_combout\ & ( reg_r(5) ) ) ) # ( \Controle|Selector12~0_combout\ & ( 
-- !\Controle|Selector11~0_combout\ & ( reg_b(5) ) ) ) # ( !\Controle|Selector12~0_combout\ & ( !\Controle|Selector11~0_combout\ & ( reg_a(5) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000000001111111101010101010101010000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_r(5),
	datab => ALT_INV_reg_a(5),
	datac => ALT_INV_reg_literal(5),
	datad => ALT_INV_reg_b(5),
	datae => \Controle|ALT_INV_Selector12~0_combout\,
	dataf => \Controle|ALT_INV_Selector11~0_combout\,
	combout => \Mux10~0_combout\);

-- Location: FF_X32_Y6_N29
\reg_inter_2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux10~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_2(5));

-- Location: FF_X42_Y5_N23
\mem_address[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \mem_address[5]~feeder_combout\,
	asdata => reg_inter_2(5),
	clrn => \reset~input_o\,
	sload => \Controle|Selector8~0_combout\,
	ena => \Controle|Selector6~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_address(5));

-- Location: FF_X39_Y5_N13
\PC|pc[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \PC|Add0~17_sumout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4),
	clrn => \reset~input_o\,
	sload => \Controle|estado.PULANDO~q\,
	ena => \Controle|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|pc\(4));

-- Location: MLABCELL_X42_Y5_N18
\mem_address[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem_address[4]~feeder_combout\ = \PC|pc\(4)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \PC|ALT_INV_pc\(4),
	combout => \mem_address[4]~feeder_combout\);

-- Location: FF_X42_Y5_N20
\mem_address[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \mem_address[4]~feeder_combout\,
	asdata => reg_inter_2(4),
	clrn => \reset~input_o\,
	sload => \Controle|Selector8~0_combout\,
	ena => \Controle|Selector6~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_address(4));

-- Location: LABCELL_X40_Y5_N18
\Controle|Selector18~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector18~1_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & 
-- !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011000000000000001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	combout => \Controle|Selector18~1_combout\);

-- Location: MLABCELL_X37_Y5_N45
\Controle|Selector18~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector18~0_combout\ = ( !\Controle|opcode_memory\(2) & ( (\Controle|opcode_memory\(1) & (\Controle|opcode_memory\(3) & \Controle|opcode_memory\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011000000000000001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_opcode_memory\(1),
	datac => \Controle|ALT_INV_opcode_memory\(3),
	datad => \Controle|ALT_INV_opcode_memory\(0),
	dataf => \Controle|ALT_INV_opcode_memory\(2),
	combout => \Controle|Selector18~0_combout\);

-- Location: LABCELL_X40_Y5_N27
\Controle|Selector18~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector18~2_combout\ = ( \Controle|Selector18~0_combout\ & ( (!\Controle|estado.ACESSO_IO~q\ & ((!\Controle|estado.DECODIFICA_2~q\ & (\Controle|Selector18~1_combout\ & \Controle|Selector42~0_combout\)) # (\Controle|estado.DECODIFICA_2~q\ & 
-- ((!\Controle|Selector42~0_combout\))))) ) ) # ( !\Controle|Selector18~0_combout\ & ( (\Controle|Selector18~1_combout\ & (!\Controle|estado.DECODIFICA_2~q\ & (!\Controle|estado.ACESSO_IO~q\ & \Controle|Selector42~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000110000010000000011000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector18~1_combout\,
	datab => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	datac => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datad => \Controle|ALT_INV_Selector42~0_combout\,
	dataf => \Controle|ALT_INV_Selector18~0_combout\,
	combout => \Controle|Selector18~2_combout\);

-- Location: LABCELL_X40_Y5_N42
\Controle|proximo_estado.MOVER_553\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.MOVER_553~combout\ = ( \Controle|Selector18~2_combout\ & ( (\Controle|proximo_estado.MOVER_553~combout\) # (\Controle|Selector41~0_combout\) ) ) # ( !\Controle|Selector18~2_combout\ & ( (!\Controle|Selector41~0_combout\ & 
-- \Controle|proximo_estado.MOVER_553~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_Selector41~0_combout\,
	datad => \Controle|ALT_INV_proximo_estado.MOVER_553~combout\,
	dataf => \Controle|ALT_INV_Selector18~2_combout\,
	combout => \Controle|proximo_estado.MOVER_553~combout\);

-- Location: FF_X40_Y5_N44
\Controle|estado.MOVER\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|proximo_estado.MOVER_553~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.MOVER~q\);

-- Location: LABCELL_X40_Y5_N54
\Controle|WideOr26~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|WideOr26~0_combout\ = ( !\Controle|estado.DECODIFICA_2~q\ & ( !\Controle|estado.ESPERA_MEMORIA_2~q\ & ( (!\Controle|estado.ACESSO_MEMORIA~q\ & (!\Controle|estado.MOVER~q\ & (!\Controle|estado.PRE_ACESSO_MEMORIA~q\ & 
-- !\Controle|estado.ESPERA_MEMORIA~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.ACESSO_MEMORIA~q\,
	datab => \Controle|ALT_INV_estado.MOVER~q\,
	datac => \Controle|ALT_INV_estado.PRE_ACESSO_MEMORIA~q\,
	datad => \Controle|ALT_INV_estado.ESPERA_MEMORIA~q\,
	datae => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	dataf => \Controle|ALT_INV_estado.ESPERA_MEMORIA_2~q\,
	combout => \Controle|WideOr26~0_combout\);

-- Location: MLABCELL_X37_Y5_N24
\reg_a~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a~1_combout\ = ( !\Controle|Selector9~0_combout\ & ( (\Controle|read_enable~0_combout\ & ((!\Controle|reg_select_memory\(3)) # ((!\Controle|estado.ACESSO_IO~q\ & \Controle|WideOr26~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001110000000001100111000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datab => \Controle|ALT_INV_reg_select_memory\(3),
	datac => \Controle|ALT_INV_WideOr26~0_combout\,
	datad => \Controle|ALT_INV_read_enable~0_combout\,
	dataf => \Controle|ALT_INV_Selector9~0_combout\,
	combout => \reg_a~1_combout\);

-- Location: LABCELL_X36_Y7_N12
\reg_a~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_a~6_combout\ = ( \reg_a~0_combout\ & ( \Controle|Selector10~1_combout\ & ( reg_inter_2(3) ) ) ) # ( !\reg_a~0_combout\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_a~1_combout\ & (\switches[3]~input_o\)) # (\reg_a~1_combout\ & 
-- ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3)))) ) ) ) # ( \reg_a~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( reg_inter_2(3) ) ) ) # ( !\reg_a~0_combout\ & ( !\Controle|Selector10~1_combout\ & ( \switches[3]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000000001111111100100111001001110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg_a~1_combout\,
	datab => \ALT_INV_switches[3]~input_o\,
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(3),
	datad => ALT_INV_reg_inter_2(3),
	datae => \ALT_INV_reg_a~0_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_a~6_combout\);

-- Location: FF_X36_Y7_N14
\reg_a[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_a~6_combout\,
	clrn => \reset~input_o\,
	ena => \reg_a[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_a(3));

-- Location: LABCELL_X35_Y6_N36
\Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = ( \Controle|Selector11~0_combout\ & ( \Controle|Selector12~0_combout\ & ( reg_literal(3) ) ) ) # ( !\Controle|Selector11~0_combout\ & ( \Controle|Selector12~0_combout\ & ( reg_b(3) ) ) ) # ( \Controle|Selector11~0_combout\ & ( 
-- !\Controle|Selector12~0_combout\ & ( reg_r(3) ) ) ) # ( !\Controle|Selector11~0_combout\ & ( !\Controle|Selector12~0_combout\ & ( reg_a(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000011110000111100000000111111110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_a(3),
	datab => ALT_INV_reg_literal(3),
	datac => ALT_INV_reg_r(3),
	datad => ALT_INV_reg_b(3),
	datae => \Controle|ALT_INV_Selector11~0_combout\,
	dataf => \Controle|ALT_INV_Selector12~0_combout\,
	combout => \Mux12~0_combout\);

-- Location: FF_X35_Y6_N38
\reg_inter_2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux12~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_2(3));

-- Location: FF_X42_Y5_N53
\mem_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \mem_address[3]~feeder_combout\,
	asdata => reg_inter_2(3),
	clrn => \reset~input_o\,
	sload => \Controle|Selector8~0_combout\,
	ena => \Controle|Selector6~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_address(3));

-- Location: LABCELL_X39_Y5_N45
\Controle|process_2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|process_2~0_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) & ( ((\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3))) # 
-- (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0)) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) & ( (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & 
-- \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100110011001111110011001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(2),
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(3),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	combout => \Controle|process_2~0_combout\);

-- Location: LABCELL_X39_Y5_N48
\Controle|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector7~0_combout\ = ( \Controle|estado.NAO_PULOU~q\ & ( \Controle|estado.DECODIFICA~q\ ) ) # ( !\Controle|estado.NAO_PULOU~q\ & ( \Controle|estado.DECODIFICA~q\ & ( (!\Controle|estado.BUSCA~q\) # (((\Controle|process_2~0_combout\) # 
-- (\Controle|estado.PULANDO~q\)) # (\Controle|estado.SALTO_ADR~q\)) ) ) ) # ( \Controle|estado.NAO_PULOU~q\ & ( !\Controle|estado.DECODIFICA~q\ ) ) # ( !\Controle|estado.NAO_PULOU~q\ & ( !\Controle|estado.DECODIFICA~q\ & ( (!\Controle|estado.BUSCA~q\) # 
-- ((\Controle|estado.PULANDO~q\) # (\Controle|estado.SALTO_ADR~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111110111111111111111111111110111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.BUSCA~q\,
	datab => \Controle|ALT_INV_estado.SALTO_ADR~q\,
	datac => \Controle|ALT_INV_estado.PULANDO~q\,
	datad => \Controle|ALT_INV_process_2~0_combout\,
	datae => \Controle|ALT_INV_estado.NAO_PULOU~q\,
	dataf => \Controle|ALT_INV_estado.DECODIFICA~q\,
	combout => \Controle|Selector7~0_combout\);

-- Location: FF_X39_Y5_N8
\PC|pc[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \PC|Add0~9_sumout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2),
	clrn => \reset~input_o\,
	sload => \Controle|estado.PULANDO~q\,
	ena => \Controle|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|pc\(2));

-- Location: MLABCELL_X42_Y5_N48
\mem_address[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem_address[2]~feeder_combout\ = \PC|pc\(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \PC|ALT_INV_pc\(2),
	combout => \mem_address[2]~feeder_combout\);

-- Location: FF_X42_Y5_N50
\mem_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \mem_address[2]~feeder_combout\,
	asdata => reg_inter_2(2),
	clrn => \reset~input_o\,
	sload => \Controle|Selector8~0_combout\,
	ena => \Controle|Selector6~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_address(2));

-- Location: FF_X39_Y5_N5
\PC|pc[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \PC|Add0~5_sumout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1),
	clrn => \reset~input_o\,
	sload => \Controle|estado.PULANDO~q\,
	ena => \Controle|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|pc\(1));

-- Location: MLABCELL_X42_Y5_N33
\mem_address[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem_address[1]~feeder_combout\ = ( \PC|pc\(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \PC|ALT_INV_pc\(1),
	combout => \mem_address[1]~feeder_combout\);

-- Location: FF_X42_Y5_N35
\mem_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \mem_address[1]~feeder_combout\,
	asdata => reg_inter_2(1),
	clrn => \reset~input_o\,
	sload => \Controle|Selector8~0_combout\,
	ena => \Controle|Selector6~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_address(1));

-- Location: MLABCELL_X37_Y5_N48
\Controle|Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector10~0_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) & ( (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0) & 
-- (\Controle|estado.DECODIFICA~q\ & !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3)))) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(1) & ( (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(2) & 
-- (\Controle|estado.DECODIFICA~q\ & !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000001010000000000000100000000000000010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(2),
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	datac => \Controle|ALT_INV_estado.DECODIFICA~q\,
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(3),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	combout => \Controle|Selector10~0_combout\);

-- Location: LABCELL_X36_Y5_N21
\Controle|Selector10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector10~1_combout\ = ( \Controle|reg_select_memory\(2) & ( (!\Controle|Selector10~0_combout\ & (!\Controle|estado.ACESSO_IO~q\ & \Controle|WideOr26~0_combout\)) ) ) # ( !\Controle|reg_select_memory\(2) & ( !\Controle|Selector10~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000100010000000000010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector10~0_combout\,
	datab => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datad => \Controle|ALT_INV_WideOr26~0_combout\,
	dataf => \Controle|ALT_INV_reg_select_memory\(2),
	combout => \Controle|Selector10~1_combout\);

-- Location: LABCELL_X39_Y6_N0
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( reg_b(7) & ( \Controle|Selector9~1_combout\ & ( (!\Controle|Selector10~1_combout\) # (reg_a(7)) ) ) ) # ( !reg_b(7) & ( \Controle|Selector9~1_combout\ & ( (\Controle|Selector10~1_combout\ & reg_a(7)) ) ) ) # ( reg_b(7) & ( 
-- !\Controle|Selector9~1_combout\ & ( (!\Controle|Selector10~1_combout\ & (reg_literal(7))) # (\Controle|Selector10~1_combout\ & ((reg_r(7)))) ) ) ) # ( !reg_b(7) & ( !\Controle|Selector9~1_combout\ & ( (!\Controle|Selector10~1_combout\ & (reg_literal(7))) 
-- # (\Controle|Selector10~1_combout\ & ((reg_r(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001001110111001000100111011100000101000001011010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector10~1_combout\,
	datab => ALT_INV_reg_literal(7),
	datac => ALT_INV_reg_a(7),
	datad => ALT_INV_reg_r(7),
	datae => ALT_INV_reg_b(7),
	dataf => \Controle|ALT_INV_Selector9~1_combout\,
	combout => \Mux0~0_combout\);

-- Location: FF_X39_Y6_N2
\reg_inter_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux0~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_1(7));

-- Location: MLABCELL_X34_Y6_N51
\ULA|Add2~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add2~29_sumout\ = SUM(( !reg_inter_2(7) $ (reg_inter_1(7)) ) + ( \ULA|Add2~7\ ) + ( \ULA|Add2~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110000110011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_inter_2(7),
	datad => ALT_INV_reg_inter_1(7),
	cin => \ULA|Add2~6\,
	sharein => \ULA|Add2~7\,
	sumout => \ULA|Add2~29_sumout\);

-- Location: LABCELL_X35_Y4_N24
\ULA|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux1~0_combout\ = ( \ULA|Mux3~1_combout\ & ( \ULA|Mux3~2_combout\ & ( \ULA|Add2~29_sumout\ ) ) ) # ( !\ULA|Mux3~1_combout\ & ( \ULA|Mux3~2_combout\ & ( !reg_inter_1(7) ) ) ) # ( \ULA|Mux3~1_combout\ & ( !\ULA|Mux3~2_combout\ & ( \ULA|Mux17~0_combout\ 
-- ) ) ) # ( !\ULA|Mux3~1_combout\ & ( !\ULA|Mux3~2_combout\ & ( \ULA|Mux1~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111001100110011001110101010101010100000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_inter_1(7),
	datab => \ULA|ALT_INV_Mux17~0_combout\,
	datac => \ULA|ALT_INV_Mux1~0_combout\,
	datad => \ULA|ALT_INV_Add2~29_sumout\,
	datae => \ULA|ALT_INV_Mux3~1_combout\,
	dataf => \ULA|ALT_INV_Mux3~2_combout\,
	combout => \ULA|Mux1~0_combout\);

-- Location: LABCELL_X35_Y4_N18
\sign_flag~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sign_flag~feeder_combout\ = ( \ULA|Mux1~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ULA|ALT_INV_Mux1~0_combout\,
	combout => \sign_flag~feeder_combout\);

-- Location: FF_X35_Y4_N20
sign_flag : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \sign_flag~feeder_combout\,
	ena => \overflow_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sign_flag~q\);

-- Location: MLABCELL_X42_Y5_N12
\Controle|Selector6~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector6~2_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( \Controle|Selector6~1_combout\ & ( (\Controle|estado.SALTO_ADR~q\ & (((!\sign_flag~q\ & \Controle|Selector6~0_combout\)) # (\zero_flag~q\))) ) ) ) # ( 
-- !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( \Controle|Selector6~1_combout\ & ( \Controle|estado.SALTO_ADR~q\ ) ) ) # ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( !\Controle|Selector6~1_combout\ & ( 
-- (!\sign_flag~q\ & (\Controle|Selector6~0_combout\ & (\Controle|estado.SALTO_ADR~q\ & !\zero_flag~q\))) ) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( !\Controle|Selector6~1_combout\ & ( (!\sign_flag~q\ & 
-- (\Controle|Selector6~0_combout\ & (\Controle|estado.SALTO_ADR~q\ & !\zero_flag~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000100000000000001111000011110000001000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_sign_flag~q\,
	datab => \Controle|ALT_INV_Selector6~0_combout\,
	datac => \Controle|ALT_INV_estado.SALTO_ADR~q\,
	datad => \ALT_INV_zero_flag~q\,
	datae => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	dataf => \Controle|ALT_INV_Selector6~1_combout\,
	combout => \Controle|Selector6~2_combout\);

-- Location: LABCELL_X41_Y5_N39
\Controle|proximo_estado.PULANDO_542\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.PULANDO_542~combout\ = ( \Controle|Selector6~2_combout\ & ( (\Controle|proximo_estado.PULANDO_542~combout\) # (\Controle|Selector41~0_combout\) ) ) # ( !\Controle|Selector6~2_combout\ & ( (!\Controle|Selector41~0_combout\ & 
-- \Controle|proximo_estado.PULANDO_542~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector41~0_combout\,
	datad => \Controle|ALT_INV_proximo_estado.PULANDO_542~combout\,
	dataf => \Controle|ALT_INV_Selector6~2_combout\,
	combout => \Controle|proximo_estado.PULANDO_542~combout\);

-- Location: FF_X41_Y5_N41
\Controle|estado.PULANDO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|proximo_estado.PULANDO_542~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.PULANDO~q\);

-- Location: FF_X39_Y5_N2
\PC|pc[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \PC|Add0~1_sumout\,
	asdata => \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0),
	clrn => \reset~input_o\,
	sload => \Controle|estado.PULANDO~q\,
	ena => \Controle|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|pc\(0));

-- Location: MLABCELL_X42_Y5_N24
\mem_address[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem_address[0]~feeder_combout\ = \PC|pc\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \PC|ALT_INV_pc\(0),
	combout => \mem_address[0]~feeder_combout\);

-- Location: FF_X42_Y5_N26
\mem_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \mem_address[0]~feeder_combout\,
	asdata => reg_inter_2(0),
	clrn => \reset~input_o\,
	sload => \Controle|Selector8~0_combout\,
	ena => \Controle|Selector6~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_address(0));

-- Location: MLABCELL_X37_Y5_N36
\Controle|opcode_memory[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|opcode_memory\(1) = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & ( (\Controle|estado.DECODIFICA~q\) # (\Controle|opcode_memory\(1)) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & ( 
-- (\Controle|opcode_memory\(1) & !\Controle|estado.DECODIFICA~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_opcode_memory\(1),
	datad => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	combout => \Controle|opcode_memory\(1));

-- Location: MLABCELL_X37_Y7_N57
\Controle|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Mux13~0_combout\ = ( \Controle|opcode_memory\(3) & ( (!\Controle|opcode_memory\(2) & (!\Controle|opcode_memory\(1) & !\Controle|opcode_memory\(0))) ) ) # ( !\Controle|opcode_memory\(3) & ( (\Controle|opcode_memory\(2) & 
-- \Controle|opcode_memory\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010110100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_opcode_memory\(2),
	datac => \Controle|ALT_INV_opcode_memory\(1),
	datad => \Controle|ALT_INV_opcode_memory\(0),
	dataf => \Controle|ALT_INV_opcode_memory\(3),
	combout => \Controle|Mux13~0_combout\);

-- Location: MLABCELL_X37_Y7_N0
\Controle|Mux19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Mux19~0_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & ( (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & 
-- \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6)) ) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & ( 
-- (!\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6)) ) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( 
-- !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & ( (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000000000000000000000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	datae => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	combout => \Controle|Mux19~0_combout\);

-- Location: MLABCELL_X37_Y7_N9
\Controle|Selector27~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector27~0_combout\ = ( \Controle|Selector42~0_combout\ & ( \Controle|Mux19~0_combout\ & ( (!\Controle|estado.ACESSO_IO~q\ & !\Controle|estado.DECODIFICA_2~q\) ) ) ) # ( !\Controle|Selector42~0_combout\ & ( \Controle|Mux19~0_combout\ & ( 
-- (\Controle|Mux13~0_combout\ & (!\Controle|estado.ACESSO_IO~q\ & \Controle|estado.DECODIFICA_2~q\)) ) ) ) # ( !\Controle|Selector42~0_combout\ & ( !\Controle|Mux19~0_combout\ & ( (\Controle|Mux13~0_combout\ & (!\Controle|estado.ACESSO_IO~q\ & 
-- \Controle|estado.DECODIFICA_2~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110000000000000000000000000000001100001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_Mux13~0_combout\,
	datac => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datad => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	datae => \Controle|ALT_INV_Selector42~0_combout\,
	dataf => \Controle|ALT_INV_Mux19~0_combout\,
	combout => \Controle|Selector27~0_combout\);

-- Location: MLABCELL_X37_Y7_N51
\Controle|proximo_estado.SALTO_ADR_608\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.SALTO_ADR_608~combout\ = ( \Controle|Selector27~0_combout\ & ( (\Controle|proximo_estado.SALTO_ADR_608~combout\) # (\Controle|Selector41~0_combout\) ) ) # ( !\Controle|Selector27~0_combout\ & ( (!\Controle|Selector41~0_combout\ & 
-- \Controle|proximo_estado.SALTO_ADR_608~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_Selector41~0_combout\,
	datad => \Controle|ALT_INV_proximo_estado.SALTO_ADR_608~combout\,
	dataf => \Controle|ALT_INV_Selector27~0_combout\,
	combout => \Controle|proximo_estado.SALTO_ADR_608~combout\);

-- Location: FF_X37_Y7_N53
\Controle|estado.SALTO_ADR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|proximo_estado.SALTO_ADR_608~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.SALTO_ADR~q\);

-- Location: LABCELL_X41_Y5_N12
\Controle|Selector42~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector42~2_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6) & ( (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5) & \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	combout => \Controle|Selector42~2_combout\);

-- Location: MLABCELL_X37_Y5_N0
\Controle|Selector42~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector42~1_combout\ = ( \Controle|opcode_memory\(3) & ( (\Controle|estado.DECODIFICA_2~q\ & (\Controle|opcode_memory\(2) & \Controle|opcode_memory\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	datab => \Controle|ALT_INV_opcode_memory\(2),
	datac => \Controle|ALT_INV_opcode_memory\(1),
	dataf => \Controle|ALT_INV_opcode_memory\(3),
	combout => \Controle|Selector42~1_combout\);

-- Location: LABCELL_X41_Y5_N30
\Controle|Selector42~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector42~3_combout\ = ( \Controle|Selector42~1_combout\ ) # ( !\Controle|Selector42~1_combout\ & ( (!\Controle|Selector42~2_combout\ & (\reset~input_o\ & (\Controle|estado.ESPERA~q\))) # (\Controle|Selector42~2_combout\ & (((\reset~input_o\ & 
-- \Controle|estado.ESPERA~q\)) # (\Controle|Selector42~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001101010111000000110101011111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector42~2_combout\,
	datab => \ALT_INV_reset~input_o\,
	datac => \Controle|ALT_INV_estado.ESPERA~q\,
	datad => \Controle|ALT_INV_Selector42~0_combout\,
	dataf => \Controle|ALT_INV_Selector42~1_combout\,
	combout => \Controle|Selector42~3_combout\);

-- Location: LABCELL_X41_Y5_N33
\Controle|proximo_estado.ESPERA_714\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.ESPERA_714~combout\ = ( \Controle|Selector42~3_combout\ & ( (\Controle|proximo_estado.ESPERA_714~combout\) # (\Controle|Selector41~0_combout\) ) ) # ( !\Controle|Selector42~3_combout\ & ( (!\Controle|Selector41~0_combout\ & 
-- \Controle|proximo_estado.ESPERA_714~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_Selector41~0_combout\,
	datad => \Controle|ALT_INV_proximo_estado.ESPERA_714~combout\,
	dataf => \Controle|ALT_INV_Selector42~3_combout\,
	combout => \Controle|proximo_estado.ESPERA_714~combout\);

-- Location: FF_X41_Y5_N35
\Controle|estado.ESPERA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|proximo_estado.ESPERA_714~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.ESPERA~q\);

-- Location: LABCELL_X39_Y5_N57
\Controle|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Mux2~0_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(7) & ( (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6) & !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(5)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	datad => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	combout => \Controle|Mux2~0_combout\);

-- Location: LABCELL_X39_Y5_N27
\Controle|proximo_estado.ESPERA_SAIDA_509\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.ESPERA_SAIDA_509~combout\ = ( \Controle|estado.ACESSO_IO~q\ & ( (!\Controle|Mux2~0_combout\ & ((\Controle|proximo_estado.ESPERA_SAIDA_509~combout\))) # (\Controle|Mux2~0_combout\ & 
-- (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011110011110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_Mux2~0_combout\,
	datac => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	datad => \Controle|ALT_INV_proximo_estado.ESPERA_SAIDA_509~combout\,
	dataf => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	combout => \Controle|proximo_estado.ESPERA_SAIDA_509~combout\);

-- Location: FF_X41_Y5_N47
\Controle|estado.ESPERA_SAIDA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \Controle|proximo_estado.ESPERA_SAIDA_509~combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.ESPERA_SAIDA~q\);

-- Location: LABCELL_X41_Y5_N57
\Controle|Selector40~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector40~0_combout\ = (!\Controle|estado.MOVER~q\ & (!\Controle|estado.ESPERA_PULO~q\ & (!\Controle|estado.ESPERA_SAIDA~q\ & !\Controle|estado.NAO_PULOU~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.MOVER~q\,
	datab => \Controle|ALT_INV_estado.ESPERA_PULO~q\,
	datac => \Controle|ALT_INV_estado.ESPERA_SAIDA~q\,
	datad => \Controle|ALT_INV_estado.NAO_PULOU~q\,
	combout => \Controle|Selector40~0_combout\);

-- Location: LABCELL_X40_Y5_N45
\Controle|Selector40~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector40~1_combout\ = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( (!\Controle|estado.ESPERA_MEMORIA_2~q\ & !\Controle|estado.EXECUTA~q\) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(4) & ( 
-- (!\Controle|estado.ESPERA_MEMORIA_2~q\ & (!\Controle|estado.ACESSO_IO~q\ & !\Controle|estado.EXECUTA~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000010101010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.ESPERA_MEMORIA_2~q\,
	datac => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datad => \Controle|ALT_INV_estado.EXECUTA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	combout => \Controle|Selector40~1_combout\);

-- Location: LABCELL_X36_Y5_N36
\Controle|Selector40~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector40~2_combout\ = ( \Controle|Mux19~0_combout\ & ( \Controle|Selector40~1_combout\ & ( (!\Controle|Selector40~0_combout\) # ((!\reset~input_o\ & \Controle|estado.ESPERA~q\)) ) ) ) # ( !\Controle|Mux19~0_combout\ & ( 
-- \Controle|Selector40~1_combout\ & ( ((!\Controle|Selector40~0_combout\) # ((!\reset~input_o\ & \Controle|estado.ESPERA~q\))) # (\Controle|estado.SALTO_ADR~q\) ) ) ) # ( \Controle|Mux19~0_combout\ & ( !\Controle|Selector40~1_combout\ ) ) # ( 
-- !\Controle|Mux19~0_combout\ & ( !\Controle|Selector40~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111010111011111111100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.SALTO_ADR~q\,
	datab => \ALT_INV_reset~input_o\,
	datac => \Controle|ALT_INV_estado.ESPERA~q\,
	datad => \Controle|ALT_INV_Selector40~0_combout\,
	datae => \Controle|ALT_INV_Mux19~0_combout\,
	dataf => \Controle|ALT_INV_Selector40~1_combout\,
	combout => \Controle|Selector40~2_combout\);

-- Location: LABCELL_X35_Y5_N9
\Controle|proximo_estado.BUSCA_703\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.BUSCA_703~combout\ = ( \Controle|proximo_estado.BUSCA_703~combout\ & ( (!\Controle|Selector41~0_combout\) # (\Controle|Selector40~2_combout\) ) ) # ( !\Controle|proximo_estado.BUSCA_703~combout\ & ( 
-- (\Controle|Selector40~2_combout\ & \Controle|Selector41~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_Selector40~2_combout\,
	datad => \Controle|ALT_INV_Selector41~0_combout\,
	dataf => \Controle|ALT_INV_proximo_estado.BUSCA_703~combout\,
	combout => \Controle|proximo_estado.BUSCA_703~combout\);

-- Location: LABCELL_X40_Y5_N9
\Controle|estado.BUSCA~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|estado.BUSCA~0_combout\ = !\Controle|proximo_estado.BUSCA_703~combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \Controle|ALT_INV_proximo_estado.BUSCA_703~combout\,
	combout => \Controle|estado.BUSCA~0_combout\);

-- Location: FF_X40_Y5_N11
\Controle|estado.BUSCA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Controle|estado.BUSCA~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.BUSCA~q\);

-- Location: LABCELL_X40_Y5_N6
\Controle|proximo_estado.ESPERA_PC_692\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.ESPERA_PC_692~combout\ = ( \Controle|estado.BUSCA~q\ & ( (\Controle|proximo_estado.ESPERA_PC_692~combout\ & !\Controle|Selector41~0_combout\) ) ) # ( !\Controle|estado.BUSCA~q\ & ( (\Controle|Selector41~0_combout\) # 
-- (\Controle|proximo_estado.ESPERA_PC_692~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_proximo_estado.ESPERA_PC_692~combout\,
	datad => \Controle|ALT_INV_Selector41~0_combout\,
	dataf => \Controle|ALT_INV_estado.BUSCA~q\,
	combout => \Controle|proximo_estado.ESPERA_PC_692~combout\);

-- Location: FF_X41_Y5_N44
\Controle|estado.ESPERA_PC\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \Controle|proximo_estado.ESPERA_PC_692~combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.ESPERA_PC~q\);

-- Location: LABCELL_X41_Y5_N18
\Controle|proximo_estado.DECODIFICA_681\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.DECODIFICA_681~combout\ = ( \Controle|estado.ESPERA_PC~q\ & ( (\Controle|proximo_estado.DECODIFICA_681~combout\) # (\Controle|Selector41~0_combout\) ) ) # ( !\Controle|estado.ESPERA_PC~q\ & ( (!\Controle|Selector41~0_combout\ & 
-- \Controle|proximo_estado.DECODIFICA_681~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Controle|ALT_INV_Selector41~0_combout\,
	datac => \Controle|ALT_INV_proximo_estado.DECODIFICA_681~combout\,
	dataf => \Controle|ALT_INV_estado.ESPERA_PC~q\,
	combout => \Controle|proximo_estado.DECODIFICA_681~combout\);

-- Location: FF_X37_Y5_N2
\Controle|estado.DECODIFICA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \Controle|proximo_estado.DECODIFICA_681~combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.DECODIFICA~q\);

-- Location: MLABCELL_X37_Y5_N27
\Controle|opcode_memory[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|opcode_memory\(2) = ( \Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6) & ( (\Controle|estado.DECODIFICA~q\) # (\Controle|opcode_memory\(2)) ) ) # ( !\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(6) & ( 
-- (\Controle|opcode_memory\(2) & !\Controle|estado.DECODIFICA~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_opcode_memory\(2),
	datad => \Controle|ALT_INV_estado.DECODIFICA~q\,
	dataf => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	combout => \Controle|opcode_memory\(2));

-- Location: MLABCELL_X37_Y5_N30
\Controle|Selector32~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector32~0_combout\ = ( !\Controle|opcode_memory\(1) & ( (\Controle|opcode_memory\(2) & \Controle|opcode_memory\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_opcode_memory\(2),
	datad => \Controle|ALT_INV_opcode_memory\(3),
	dataf => \Controle|ALT_INV_opcode_memory\(1),
	combout => \Controle|Selector32~0_combout\);

-- Location: LABCELL_X40_Y5_N12
\Controle|Selector32~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector32~1_combout\ = ( \Controle|Selector42~0_combout\ & ( (!\Controle|estado.ACESSO_IO~q\ & (\Controle|Mux2~0_combout\ & !\Controle|estado.DECODIFICA_2~q\)) ) ) # ( !\Controle|Selector42~0_combout\ & ( (\Controle|Selector32~0_combout\ & 
-- (!\Controle|estado.ACESSO_IO~q\ & \Controle|estado.DECODIFICA_2~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000100000000000100010000001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_Selector32~0_combout\,
	datab => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datac => \Controle|ALT_INV_Mux2~0_combout\,
	datad => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	dataf => \Controle|ALT_INV_Selector42~0_combout\,
	combout => \Controle|Selector32~1_combout\);

-- Location: LABCELL_X40_Y5_N15
\Controle|proximo_estado.ACESSO_IO_648\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.ACESSO_IO_648~combout\ = ( \Controle|Selector32~1_combout\ & ( (\Controle|Selector41~0_combout\) # (\Controle|proximo_estado.ACESSO_IO_648~combout\) ) ) # ( !\Controle|Selector32~1_combout\ & ( 
-- (\Controle|proximo_estado.ACESSO_IO_648~combout\ & !\Controle|Selector41~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_proximo_estado.ACESSO_IO_648~combout\,
	datad => \Controle|ALT_INV_Selector41~0_combout\,
	dataf => \Controle|ALT_INV_Selector32~1_combout\,
	combout => \Controle|proximo_estado.ACESSO_IO_648~combout\);

-- Location: FF_X39_Y5_N41
\Controle|estado.ACESSO_IO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \Controle|proximo_estado.ACESSO_IO_648~combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.ACESSO_IO~q\);

-- Location: LABCELL_X40_Y5_N21
\Controle|Selector41~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector41~0_combout\ = ( \Controle|Mux2~0_combout\ ) # ( !\Controle|Mux2~0_combout\ & ( !\Controle|estado.ACESSO_IO~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	dataf => \Controle|ALT_INV_Mux2~0_combout\,
	combout => \Controle|Selector41~0_combout\);

-- Location: LABCELL_X40_Y5_N24
\Controle|proximo_estado.ACESSO_MEMORIA_586\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|proximo_estado.ACESSO_MEMORIA_586~combout\ = ( \Controle|estado.PRE_ACESSO_MEMORIA~q\ & ( (\Controle|Selector41~0_combout\) # (\Controle|proximo_estado.ACESSO_MEMORIA_586~combout\) ) ) # ( !\Controle|estado.PRE_ACESSO_MEMORIA~q\ & ( 
-- (\Controle|proximo_estado.ACESSO_MEMORIA_586~combout\ & !\Controle|Selector41~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Controle|ALT_INV_proximo_estado.ACESSO_MEMORIA_586~combout\,
	datad => \Controle|ALT_INV_Selector41~0_combout\,
	dataf => \Controle|ALT_INV_estado.PRE_ACESSO_MEMORIA~q\,
	combout => \Controle|proximo_estado.ACESSO_MEMORIA_586~combout\);

-- Location: FF_X41_Y5_N8
\Controle|estado.ACESSO_MEMORIA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \Controle|proximo_estado.ACESSO_MEMORIA_586~combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controle|estado.ACESSO_MEMORIA~q\);

-- Location: MLABCELL_X37_Y7_N18
\Controle|Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|Selector13~0_combout\ = ( !\Controle|opcode_memory\(0) & ( \Controle|opcode_memory\(1) & ( (\Controle|estado.ACESSO_MEMORIA~q\ & (!\Controle|opcode_memory\(2) & \Controle|opcode_memory\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.ACESSO_MEMORIA~q\,
	datac => \Controle|ALT_INV_opcode_memory\(2),
	datad => \Controle|ALT_INV_opcode_memory\(3),
	datae => \Controle|ALT_INV_opcode_memory\(0),
	dataf => \Controle|ALT_INV_opcode_memory\(1),
	combout => \Controle|Selector13~0_combout\);

-- Location: MLABCELL_X34_Y5_N36
\reg_b~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \reg_b~1_combout\ = ( \reg_a~1_combout\ & ( \Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & (\switches[0]~input_o\)) # (\reg_b~0_combout\ & ((reg_inter_2(0)))) ) ) ) # ( !\reg_a~1_combout\ & ( \Controle|Selector10~1_combout\ & ( 
-- (!\reg_b~0_combout\ & (\switches[0]~input_o\)) # (\reg_b~0_combout\ & ((reg_inter_2(0)))) ) ) ) # ( \reg_a~1_combout\ & ( !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & (\Memoria|ram_instance|altsyncram_component|auto_generated|q_b\(0))) # 
-- (\reg_b~0_combout\ & ((reg_inter_2(0)))) ) ) ) # ( !\reg_a~1_combout\ & ( !\Controle|Selector10~1_combout\ & ( (!\reg_b~0_combout\ & (\switches[0]~input_o\)) # (\reg_b~0_combout\ & ((reg_inter_2(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001011111001100000011111101010000010111110101000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_switches[0]~input_o\,
	datab => \Memoria|ram_instance|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	datac => \ALT_INV_reg_b~0_combout\,
	datad => ALT_INV_reg_inter_2(0),
	datae => \ALT_INV_reg_a~1_combout\,
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \reg_b~1_combout\);

-- Location: FF_X34_Y5_N38
\reg_b[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \reg_b~1_combout\,
	clrn => \reset~input_o\,
	ena => \reg_b[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_b(0));

-- Location: MLABCELL_X37_Y6_N36
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ( reg_r(0) & ( \Controle|Selector10~1_combout\ & ( (!\Controle|Selector9~1_combout\) # (reg_a(0)) ) ) ) # ( !reg_r(0) & ( \Controle|Selector10~1_combout\ & ( (reg_a(0) & \Controle|Selector9~1_combout\) ) ) ) # ( reg_r(0) & ( 
-- !\Controle|Selector10~1_combout\ & ( (!\Controle|Selector9~1_combout\ & ((reg_literal(0)))) # (\Controle|Selector9~1_combout\ & (reg_b(0))) ) ) ) # ( !reg_r(0) & ( !\Controle|Selector10~1_combout\ & ( (!\Controle|Selector9~1_combout\ & ((reg_literal(0)))) 
-- # (\Controle|Selector9~1_combout\ & (reg_b(0))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001101010101001100110101010100000000000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_b(0),
	datab => ALT_INV_reg_literal(0),
	datac => ALT_INV_reg_a(0),
	datad => \Controle|ALT_INV_Selector9~1_combout\,
	datae => ALT_INV_reg_r(0),
	dataf => \Controle|ALT_INV_Selector10~1_combout\,
	combout => \Mux7~0_combout\);

-- Location: FF_X37_Y6_N38
\reg_inter_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Mux7~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_inter_1(0));

-- Location: FF_X36_Y6_N2
\Saida|output_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => reg_inter_1(0),
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Controle|estado.ESPERA_SAIDA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Saida|output_reg\(0));

-- Location: FF_X36_Y6_N49
\Saida|output_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => reg_inter_1(1),
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Controle|estado.ESPERA_SAIDA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Saida|output_reg\(1));

-- Location: FF_X36_Y6_N29
\Saida|output_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => reg_inter_1(2),
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Controle|estado.ESPERA_SAIDA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Saida|output_reg\(2));

-- Location: FF_X36_Y6_N58
\Saida|output_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => reg_inter_1(3),
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Controle|estado.ESPERA_SAIDA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Saida|output_reg\(3));

-- Location: FF_X36_Y6_N22
\Saida|output_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => reg_inter_1(4),
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Controle|estado.ESPERA_SAIDA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Saida|output_reg\(4));

-- Location: FF_X36_Y6_N47
\Saida|output_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => reg_inter_1(5),
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Controle|estado.ESPERA_SAIDA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Saida|output_reg\(5));

-- Location: FF_X36_Y6_N31
\Saida|output_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => reg_inter_1(6),
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Controle|estado.ESPERA_SAIDA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Saida|output_reg\(6));

-- Location: FF_X36_Y6_N5
\Saida|output_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => reg_inter_1(7),
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Controle|estado.ESPERA_SAIDA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Saida|output_reg\(7));

-- Location: LABCELL_X47_Y4_N15
\HEX0_Driver|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX0_Driver|Mux6~0_combout\ = ( reg_a(2) & ( reg_a(3) & ( (!reg_a(1) & reg_a(0)) ) ) ) # ( !reg_a(2) & ( reg_a(3) & ( (reg_a(1) & reg_a(0)) ) ) ) # ( reg_a(2) & ( !reg_a(3) & ( (!reg_a(1) & !reg_a(0)) ) ) ) # ( !reg_a(2) & ( !reg_a(3) & ( (!reg_a(1) & 
-- reg_a(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100110000001100000000000011000000110000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_a(1),
	datac => ALT_INV_reg_a(0),
	datae => ALT_INV_reg_a(2),
	dataf => ALT_INV_reg_a(3),
	combout => \HEX0_Driver|Mux6~0_combout\);

-- Location: LABCELL_X47_Y4_N6
\HEX0_Driver|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX0_Driver|Mux5~0_combout\ = ( reg_a(1) & ( (!reg_a(0) & (reg_a(2))) # (reg_a(0) & ((reg_a(3)))) ) ) # ( !reg_a(1) & ( (reg_a(2) & (!reg_a(0) $ (!reg_a(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100001100000011000011111100000011000011000000110000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_a(0),
	datac => ALT_INV_reg_a(2),
	datad => ALT_INV_reg_a(3),
	datae => ALT_INV_reg_a(1),
	combout => \HEX0_Driver|Mux5~0_combout\);

-- Location: LABCELL_X47_Y4_N3
\HEX0_Driver|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX0_Driver|Mux4~0_combout\ = ( reg_a(2) & ( reg_a(3) & ( (!reg_a(0)) # (reg_a(1)) ) ) ) # ( !reg_a(2) & ( !reg_a(3) & ( (reg_a(1) & !reg_a(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000000000000000000000000000000001111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_a(1),
	datac => ALT_INV_reg_a(0),
	datae => ALT_INV_reg_a(2),
	dataf => ALT_INV_reg_a(3),
	combout => \HEX0_Driver|Mux4~0_combout\);

-- Location: LABCELL_X47_Y4_N54
\HEX0_Driver|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX0_Driver|Mux3~0_combout\ = ( reg_a(1) & ( (!reg_a(0) & (!reg_a(2) & reg_a(3))) # (reg_a(0) & (reg_a(2))) ) ) # ( !reg_a(1) & ( (!reg_a(3) & (!reg_a(0) $ (!reg_a(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000000000000000111100001100111100000000000000001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_a(0),
	datac => ALT_INV_reg_a(2),
	datad => ALT_INV_reg_a(3),
	datae => ALT_INV_reg_a(1),
	combout => \HEX0_Driver|Mux3~0_combout\);

-- Location: LABCELL_X47_Y4_N51
\HEX0_Driver|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX0_Driver|Mux2~0_combout\ = ( !reg_a(2) & ( reg_a(3) & ( (!reg_a(1) & reg_a(0)) ) ) ) # ( reg_a(2) & ( !reg_a(3) & ( (!reg_a(1)) # (reg_a(0)) ) ) ) # ( !reg_a(2) & ( !reg_a(3) & ( reg_a(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111110011111100111100001100000011000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_a(1),
	datac => ALT_INV_reg_a(0),
	datae => ALT_INV_reg_a(2),
	dataf => ALT_INV_reg_a(3),
	combout => \HEX0_Driver|Mux2~0_combout\);

-- Location: LABCELL_X47_Y4_N42
\HEX0_Driver|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX0_Driver|Mux1~0_combout\ = ( reg_a(1) & ( (!reg_a(3) & ((!reg_a(2)) # (reg_a(0)))) ) ) # ( !reg_a(1) & ( (reg_a(0) & (!reg_a(2) $ (reg_a(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000000011111100110000000000110000000000111111001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_a(0),
	datac => ALT_INV_reg_a(2),
	datad => ALT_INV_reg_a(3),
	datae => ALT_INV_reg_a(1),
	combout => \HEX0_Driver|Mux1~0_combout\);

-- Location: LABCELL_X47_Y4_N24
\HEX0_Driver|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX0_Driver|Mux0~0_combout\ = ( reg_a(1) & ( (!reg_a(0)) # ((!reg_a(2)) # (reg_a(3))) ) ) # ( !reg_a(1) & ( (!reg_a(2) & ((reg_a(3)))) # (reg_a(2) & ((!reg_a(3)) # (reg_a(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110011111111001111111100001111111100111111110011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_a(0),
	datac => ALT_INV_reg_a(2),
	datad => ALT_INV_reg_a(3),
	datae => ALT_INV_reg_a(1),
	combout => \HEX0_Driver|Mux0~0_combout\);

-- Location: LABCELL_X35_Y6_N30
\HEX1_Driver|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX1_Driver|Mux6~0_combout\ = ( reg_b(2) & ( reg_b(0) & ( (reg_b(3) & !reg_b(1)) ) ) ) # ( !reg_b(2) & ( reg_b(0) & ( !reg_b(3) $ (reg_b(1)) ) ) ) # ( reg_b(2) & ( !reg_b(0) & ( (!reg_b(3) & !reg_b(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101000001010000010100101101001010101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_b(3),
	datac => ALT_INV_reg_b(1),
	datae => ALT_INV_reg_b(2),
	dataf => ALT_INV_reg_b(0),
	combout => \HEX1_Driver|Mux6~0_combout\);

-- Location: MLABCELL_X34_Y5_N27
\HEX1_Driver|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX1_Driver|Mux5~0_combout\ = ( reg_b(3) & ( (!reg_b(0) & (reg_b(2))) # (reg_b(0) & ((reg_b(1)))) ) ) # ( !reg_b(3) & ( (reg_b(2) & (!reg_b(1) $ (!reg_b(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101010000000001010101000001010101000011110101010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_b(2),
	datac => ALT_INV_reg_b(1),
	datad => ALT_INV_reg_b(0),
	dataf => ALT_INV_reg_b(3),
	combout => \HEX1_Driver|Mux5~0_combout\);

-- Location: LABCELL_X35_Y6_N0
\HEX1_Driver|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX1_Driver|Mux4~0_combout\ = (!reg_b(3) & (reg_b(1) & (!reg_b(0) & !reg_b(2)))) # (reg_b(3) & (reg_b(2) & ((!reg_b(0)) # (reg_b(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000001010001001000000101000100100000010100010010000001010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_b(3),
	datab => ALT_INV_reg_b(1),
	datac => ALT_INV_reg_b(0),
	datad => ALT_INV_reg_b(2),
	combout => \HEX1_Driver|Mux4~0_combout\);

-- Location: MLABCELL_X34_Y5_N57
\HEX1_Driver|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX1_Driver|Mux3~0_combout\ = ( reg_b(2) & ( (!reg_b(0) & (!reg_b(3) & !reg_b(1))) # (reg_b(0) & ((reg_b(1)))) ) ) # ( !reg_b(2) & ( (!reg_b(0) & (reg_b(3) & reg_b(1))) # (reg_b(0) & (!reg_b(3) & !reg_b(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100001001000010010000100100001010000101100001011000010110000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_b(0),
	datab => ALT_INV_reg_b(3),
	datac => ALT_INV_reg_b(1),
	dataf => ALT_INV_reg_b(2),
	combout => \HEX1_Driver|Mux3~0_combout\);

-- Location: MLABCELL_X34_Y5_N54
\HEX1_Driver|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX1_Driver|Mux2~0_combout\ = ( reg_b(1) & ( (reg_b(0) & !reg_b(3)) ) ) # ( !reg_b(1) & ( (!reg_b(2) & (reg_b(0))) # (reg_b(2) & ((!reg_b(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110001011100010111000101110001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_b(0),
	datab => ALT_INV_reg_b(3),
	datac => ALT_INV_reg_b(2),
	dataf => ALT_INV_reg_b(1),
	combout => \HEX1_Driver|Mux2~0_combout\);

-- Location: MLABCELL_X34_Y5_N0
\HEX1_Driver|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX1_Driver|Mux1~0_combout\ = ( reg_b(3) & ( (reg_b(0) & (!reg_b(1) & reg_b(2))) ) ) # ( !reg_b(3) & ( (!reg_b(0) & (reg_b(1) & !reg_b(2))) # (reg_b(0) & ((!reg_b(2)) # (reg_b(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000101110001011100010111000100000100000001000000010000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_b(0),
	datab => ALT_INV_reg_b(1),
	datac => ALT_INV_reg_b(2),
	dataf => ALT_INV_reg_b(3),
	combout => \HEX1_Driver|Mux1~0_combout\);

-- Location: MLABCELL_X34_Y5_N42
\HEX1_Driver|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX1_Driver|Mux0~0_combout\ = ( reg_b(3) & ( ((!reg_b(2)) # (reg_b(0))) # (reg_b(1)) ) ) # ( !reg_b(3) & ( (!reg_b(1) & (reg_b(2))) # (reg_b(1) & ((!reg_b(2)) # (!reg_b(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111100001111110011110011110011111111111111001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_b(1),
	datac => ALT_INV_reg_b(2),
	datad => ALT_INV_reg_b(0),
	dataf => ALT_INV_reg_b(3),
	combout => \HEX1_Driver|Mux0~0_combout\);

-- Location: LABCELL_X39_Y6_N39
\HEX2_Driver|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX2_Driver|Mux6~0_combout\ = ( reg_r(0) & ( reg_r(2) & ( (!reg_r(1) & reg_r(3)) ) ) ) # ( !reg_r(0) & ( reg_r(2) & ( (!reg_r(1) & !reg_r(3)) ) ) ) # ( reg_r(0) & ( !reg_r(2) & ( !reg_r(1) $ (reg_r(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010110101010000000000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_r(1),
	datad => ALT_INV_reg_r(3),
	datae => ALT_INV_reg_r(0),
	dataf => ALT_INV_reg_r(2),
	combout => \HEX2_Driver|Mux6~0_combout\);

-- Location: LABCELL_X39_Y6_N42
\HEX2_Driver|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX2_Driver|Mux5~0_combout\ = ( reg_r(0) & ( reg_r(3) & ( reg_r(1) ) ) ) # ( !reg_r(0) & ( reg_r(3) & ( reg_r(2) ) ) ) # ( reg_r(0) & ( !reg_r(3) & ( (!reg_r(1) & reg_r(2)) ) ) ) # ( !reg_r(0) & ( !reg_r(3) & ( (reg_r(1) & reg_r(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000010100000101000001111000011110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_r(1),
	datac => ALT_INV_reg_r(2),
	datae => ALT_INV_reg_r(0),
	dataf => ALT_INV_reg_r(3),
	combout => \HEX2_Driver|Mux5~0_combout\);

-- Location: LABCELL_X39_Y6_N12
\HEX2_Driver|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX2_Driver|Mux4~0_combout\ = ( reg_r(0) & ( reg_r(3) & ( (reg_r(1) & reg_r(2)) ) ) ) # ( !reg_r(0) & ( reg_r(3) & ( reg_r(2) ) ) ) # ( !reg_r(0) & ( !reg_r(3) & ( (reg_r(1) & !reg_r(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000000000000000000000001111000011110000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_r(1),
	datac => ALT_INV_reg_r(2),
	datae => ALT_INV_reg_r(0),
	dataf => ALT_INV_reg_r(3),
	combout => \HEX2_Driver|Mux4~0_combout\);

-- Location: LABCELL_X39_Y6_N18
\HEX2_Driver|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX2_Driver|Mux3~0_combout\ = ( reg_r(0) & ( reg_r(3) & ( (reg_r(1) & reg_r(2)) ) ) ) # ( !reg_r(0) & ( reg_r(3) & ( (reg_r(1) & !reg_r(2)) ) ) ) # ( reg_r(0) & ( !reg_r(3) & ( !reg_r(1) $ (reg_r(2)) ) ) ) # ( !reg_r(0) & ( !reg_r(3) & ( (!reg_r(1) & 
-- reg_r(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010101001011010010101010000010100000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_r(1),
	datac => ALT_INV_reg_r(2),
	datae => ALT_INV_reg_r(0),
	dataf => ALT_INV_reg_r(3),
	combout => \HEX2_Driver|Mux3~0_combout\);

-- Location: LABCELL_X39_Y6_N51
\HEX2_Driver|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX2_Driver|Mux2~0_combout\ = ( reg_r(0) & ( reg_r(2) & ( !reg_r(3) ) ) ) # ( !reg_r(0) & ( reg_r(2) & ( (!reg_r(1) & !reg_r(3)) ) ) ) # ( reg_r(0) & ( !reg_r(2) & ( (!reg_r(1)) # (!reg_r(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111010101010101010000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_r(1),
	datad => ALT_INV_reg_r(3),
	datae => ALT_INV_reg_r(0),
	dataf => ALT_INV_reg_r(2),
	combout => \HEX2_Driver|Mux2~0_combout\);

-- Location: LABCELL_X39_Y6_N54
\HEX2_Driver|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX2_Driver|Mux1~0_combout\ = ( reg_r(0) & ( reg_r(3) & ( (!reg_r(1) & reg_r(2)) ) ) ) # ( reg_r(0) & ( !reg_r(3) & ( (!reg_r(2)) # (reg_r(1)) ) ) ) # ( !reg_r(0) & ( !reg_r(3) & ( (reg_r(1) & !reg_r(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000111101011111010100000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_r(1),
	datac => ALT_INV_reg_r(2),
	datae => ALT_INV_reg_r(0),
	dataf => ALT_INV_reg_r(3),
	combout => \HEX2_Driver|Mux1~0_combout\);

-- Location: LABCELL_X39_Y6_N24
\HEX2_Driver|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX2_Driver|Mux0~0_combout\ = ( reg_r(0) & ( reg_r(3) ) ) # ( !reg_r(0) & ( reg_r(3) & ( (!reg_r(2)) # (reg_r(1)) ) ) ) # ( reg_r(0) & ( !reg_r(3) & ( !reg_r(1) $ (!reg_r(2)) ) ) ) # ( !reg_r(0) & ( !reg_r(3) & ( (reg_r(2)) # (reg_r(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111010110100101101011110101111101011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_reg_r(1),
	datac => ALT_INV_reg_r(2),
	datae => ALT_INV_reg_r(0),
	dataf => ALT_INV_reg_r(3),
	combout => \HEX2_Driver|Mux0~0_combout\);

-- Location: LABCELL_X43_Y4_N3
\HEX3_Driver|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX3_Driver|Mux6~0_combout\ = ( mem_address(3) & ( mem_address(1) & ( (!mem_address(2) & mem_address(0)) ) ) ) # ( mem_address(3) & ( !mem_address(1) & ( (mem_address(2) & mem_address(0)) ) ) ) # ( !mem_address(3) & ( !mem_address(1) & ( !mem_address(2) 
-- $ (!mem_address(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010000000000101010100000000000000000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mem_address(2),
	datad => ALT_INV_mem_address(0),
	datae => ALT_INV_mem_address(3),
	dataf => ALT_INV_mem_address(1),
	combout => \HEX3_Driver|Mux6~0_combout\);

-- Location: LABCELL_X43_Y4_N42
\HEX3_Driver|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX3_Driver|Mux5~0_combout\ = ( mem_address(3) & ( mem_address(1) & ( (mem_address(0)) # (mem_address(2)) ) ) ) # ( !mem_address(3) & ( mem_address(1) & ( (mem_address(2) & !mem_address(0)) ) ) ) # ( mem_address(3) & ( !mem_address(1) & ( (mem_address(2) 
-- & !mem_address(0)) ) ) ) # ( !mem_address(3) & ( !mem_address(1) & ( (mem_address(2) & mem_address(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101010100000101000001010000010100000101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mem_address(2),
	datac => ALT_INV_mem_address(0),
	datae => ALT_INV_mem_address(3),
	dataf => ALT_INV_mem_address(1),
	combout => \HEX3_Driver|Mux5~0_combout\);

-- Location: LABCELL_X43_Y4_N39
\HEX3_Driver|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX3_Driver|Mux4~0_combout\ = ( mem_address(3) & ( mem_address(1) & ( mem_address(2) ) ) ) # ( !mem_address(3) & ( mem_address(1) & ( (!mem_address(2) & !mem_address(0)) ) ) ) # ( mem_address(3) & ( !mem_address(1) & ( (mem_address(2) & !mem_address(0)) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010000000010101010000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mem_address(2),
	datad => ALT_INV_mem_address(0),
	datae => ALT_INV_mem_address(3),
	dataf => ALT_INV_mem_address(1),
	combout => \HEX3_Driver|Mux4~0_combout\);

-- Location: LABCELL_X43_Y4_N54
\HEX3_Driver|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX3_Driver|Mux3~0_combout\ = ( mem_address(3) & ( mem_address(1) & ( !mem_address(2) $ (mem_address(0)) ) ) ) # ( !mem_address(3) & ( mem_address(1) & ( (mem_address(2) & mem_address(0)) ) ) ) # ( !mem_address(3) & ( !mem_address(1) & ( !mem_address(2) 
-- $ (!mem_address(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010000000000000000000000101000001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mem_address(2),
	datac => ALT_INV_mem_address(0),
	datae => ALT_INV_mem_address(3),
	dataf => ALT_INV_mem_address(1),
	combout => \HEX3_Driver|Mux3~0_combout\);

-- Location: LABCELL_X43_Y4_N15
\HEX3_Driver|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX3_Driver|Mux2~0_combout\ = ( !mem_address(3) & ( mem_address(1) & ( mem_address(0) ) ) ) # ( mem_address(3) & ( !mem_address(1) & ( (!mem_address(2) & mem_address(0)) ) ) ) # ( !mem_address(3) & ( !mem_address(1) & ( (mem_address(0)) # 
-- (mem_address(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111000000001010101000000000111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mem_address(2),
	datad => ALT_INV_mem_address(0),
	datae => ALT_INV_mem_address(3),
	dataf => ALT_INV_mem_address(1),
	combout => \HEX3_Driver|Mux2~0_combout\);

-- Location: LABCELL_X43_Y4_N6
\HEX3_Driver|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX3_Driver|Mux1~0_combout\ = ( !mem_address(3) & ( mem_address(1) & ( (!mem_address(2)) # (mem_address(0)) ) ) ) # ( mem_address(3) & ( !mem_address(1) & ( (mem_address(2) & mem_address(0)) ) ) ) # ( !mem_address(3) & ( !mem_address(1) & ( 
-- (!mem_address(2) & mem_address(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000001010000010110101111101011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mem_address(2),
	datac => ALT_INV_mem_address(0),
	datae => ALT_INV_mem_address(3),
	dataf => ALT_INV_mem_address(1),
	combout => \HEX3_Driver|Mux1~0_combout\);

-- Location: LABCELL_X43_Y4_N48
\HEX3_Driver|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX3_Driver|Mux0~0_combout\ = ( mem_address(3) & ( mem_address(1) ) ) # ( !mem_address(3) & ( mem_address(1) & ( (!mem_address(2)) # (!mem_address(0)) ) ) ) # ( mem_address(3) & ( !mem_address(1) & ( (!mem_address(2)) # (mem_address(0)) ) ) ) # ( 
-- !mem_address(3) & ( !mem_address(1) & ( mem_address(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101101011111010111111111010111110101111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mem_address(2),
	datac => ALT_INV_mem_address(0),
	datae => ALT_INV_mem_address(3),
	dataf => ALT_INV_mem_address(1),
	combout => \HEX3_Driver|Mux0~0_combout\);

-- Location: LABCELL_X40_Y3_N24
\HEX4_Driver|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX4_Driver|Mux6~0_combout\ = ( reg_literal(3) & ( reg_literal(1) & ( (reg_literal(0) & !reg_literal(2)) ) ) ) # ( reg_literal(3) & ( !reg_literal(1) & ( (reg_literal(0) & reg_literal(2)) ) ) ) # ( !reg_literal(3) & ( !reg_literal(1) & ( !reg_literal(0) 
-- $ (!reg_literal(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111001100000000000011001100000000000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_literal(0),
	datad => ALT_INV_reg_literal(2),
	datae => ALT_INV_reg_literal(3),
	dataf => ALT_INV_reg_literal(1),
	combout => \HEX4_Driver|Mux6~0_combout\);

-- Location: LABCELL_X40_Y3_N9
\HEX4_Driver|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX4_Driver|Mux5~0_combout\ = ( reg_literal(3) & ( reg_literal(1) & ( (reg_literal(2)) # (reg_literal(0)) ) ) ) # ( !reg_literal(3) & ( reg_literal(1) & ( (!reg_literal(0) & reg_literal(2)) ) ) ) # ( reg_literal(3) & ( !reg_literal(1) & ( 
-- (!reg_literal(0) & reg_literal(2)) ) ) ) # ( !reg_literal(3) & ( !reg_literal(1) & ( (reg_literal(0) & reg_literal(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000011000000110000001100000011000011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_literal(0),
	datac => ALT_INV_reg_literal(2),
	datae => ALT_INV_reg_literal(3),
	dataf => ALT_INV_reg_literal(1),
	combout => \HEX4_Driver|Mux5~0_combout\);

-- Location: LABCELL_X40_Y3_N3
\HEX4_Driver|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX4_Driver|Mux4~0_combout\ = ( reg_literal(3) & ( reg_literal(1) & ( reg_literal(2) ) ) ) # ( !reg_literal(3) & ( reg_literal(1) & ( (!reg_literal(0) & !reg_literal(2)) ) ) ) # ( reg_literal(3) & ( !reg_literal(1) & ( (!reg_literal(0) & reg_literal(2)) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110011000000110000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_literal(0),
	datac => ALT_INV_reg_literal(2),
	datae => ALT_INV_reg_literal(3),
	dataf => ALT_INV_reg_literal(1),
	combout => \HEX4_Driver|Mux4~0_combout\);

-- Location: LABCELL_X40_Y3_N57
\HEX4_Driver|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX4_Driver|Mux3~0_combout\ = ( reg_literal(3) & ( reg_literal(1) & ( !reg_literal(0) $ (reg_literal(2)) ) ) ) # ( !reg_literal(3) & ( reg_literal(1) & ( (reg_literal(0) & reg_literal(2)) ) ) ) # ( !reg_literal(3) & ( !reg_literal(1) & ( !reg_literal(0) 
-- $ (!reg_literal(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100000000000000000000000011000000111100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_literal(0),
	datac => ALT_INV_reg_literal(2),
	datae => ALT_INV_reg_literal(3),
	dataf => ALT_INV_reg_literal(1),
	combout => \HEX4_Driver|Mux3~0_combout\);

-- Location: LABCELL_X40_Y3_N36
\HEX4_Driver|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX4_Driver|Mux2~0_combout\ = ( !reg_literal(3) & ( reg_literal(1) & ( reg_literal(0) ) ) ) # ( reg_literal(3) & ( !reg_literal(1) & ( (reg_literal(0) & !reg_literal(2)) ) ) ) # ( !reg_literal(3) & ( !reg_literal(1) & ( (reg_literal(2)) # 
-- (reg_literal(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100110000000000110011001100110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_literal(0),
	datad => ALT_INV_reg_literal(2),
	datae => ALT_INV_reg_literal(3),
	dataf => ALT_INV_reg_literal(1),
	combout => \HEX4_Driver|Mux2~0_combout\);

-- Location: LABCELL_X40_Y3_N45
\HEX4_Driver|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX4_Driver|Mux1~0_combout\ = ( !reg_literal(3) & ( reg_literal(1) & ( (!reg_literal(2)) # (reg_literal(0)) ) ) ) # ( reg_literal(3) & ( !reg_literal(1) & ( (reg_literal(0) & reg_literal(2)) ) ) ) # ( !reg_literal(3) & ( !reg_literal(1) & ( 
-- (reg_literal(0) & !reg_literal(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000000110000001111110011111100110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_literal(0),
	datac => ALT_INV_reg_literal(2),
	datae => ALT_INV_reg_literal(3),
	dataf => ALT_INV_reg_literal(1),
	combout => \HEX4_Driver|Mux1~0_combout\);

-- Location: LABCELL_X40_Y3_N12
\HEX4_Driver|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX4_Driver|Mux0~0_combout\ = ( reg_literal(3) & ( reg_literal(1) ) ) # ( !reg_literal(3) & ( reg_literal(1) & ( (!reg_literal(0)) # (!reg_literal(2)) ) ) ) # ( reg_literal(3) & ( !reg_literal(1) & ( (!reg_literal(2)) # (reg_literal(0)) ) ) ) # ( 
-- !reg_literal(3) & ( !reg_literal(1) & ( reg_literal(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111111111110011001111111111110011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_reg_literal(0),
	datad => ALT_INV_reg_literal(2),
	datae => ALT_INV_reg_literal(3),
	dataf => ALT_INV_reg_literal(1),
	combout => \HEX4_Driver|Mux0~0_combout\);

-- Location: LABCELL_X41_Y5_N27
\HEX5_Driver|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX5_Driver|Mux6~0_combout\ = ( \PC|pc\(1) & ( (!\PC|pc\(2) & (\PC|pc\(0) & \PC|pc\(3))) ) ) # ( !\PC|pc\(1) & ( (!\PC|pc\(2) & (\PC|pc\(0) & !\PC|pc\(3))) # (\PC|pc\(2) & (!\PC|pc\(0) $ (\PC|pc\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000000011001111000000001100000000000011000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \PC|ALT_INV_pc\(2),
	datac => \PC|ALT_INV_pc\(0),
	datad => \PC|ALT_INV_pc\(3),
	dataf => \PC|ALT_INV_pc\(1),
	combout => \HEX5_Driver|Mux6~0_combout\);

-- Location: LABCELL_X39_Y5_N39
\HEX5_Driver|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX5_Driver|Mux5~0_combout\ = ( \PC|pc\(0) & ( (!\PC|pc\(1) & (\PC|pc\(2) & !\PC|pc\(3))) # (\PC|pc\(1) & ((\PC|pc\(3)))) ) ) # ( !\PC|pc\(0) & ( (\PC|pc\(2) & ((\PC|pc\(3)) # (\PC|pc\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010011000100110001001100100101001001010010010100100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_pc\(1),
	datab => \PC|ALT_INV_pc\(2),
	datac => \PC|ALT_INV_pc\(3),
	dataf => \PC|ALT_INV_pc\(0),
	combout => \HEX5_Driver|Mux5~0_combout\);

-- Location: LABCELL_X39_Y5_N33
\HEX5_Driver|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX5_Driver|Mux4~0_combout\ = ( \PC|pc\(2) & ( (\PC|pc\(3) & ((!\PC|pc\(0)) # (\PC|pc\(1)))) ) ) # ( !\PC|pc\(2) & ( (\PC|pc\(1) & (!\PC|pc\(3) & !\PC|pc\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000010100000000000000001111000001010000111100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_pc\(1),
	datac => \PC|ALT_INV_pc\(3),
	datad => \PC|ALT_INV_pc\(0),
	dataf => \PC|ALT_INV_pc\(2),
	combout => \HEX5_Driver|Mux4~0_combout\);

-- Location: LABCELL_X39_Y5_N24
\HEX5_Driver|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX5_Driver|Mux3~0_combout\ = ( \PC|pc\(2) & ( (!\PC|pc\(0) & (!\PC|pc\(1) & !\PC|pc\(3))) # (\PC|pc\(0) & (\PC|pc\(1))) ) ) # ( !\PC|pc\(2) & ( (!\PC|pc\(0) & (\PC|pc\(1) & \PC|pc\(3))) # (\PC|pc\(0) & (!\PC|pc\(1) & !\PC|pc\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000001010010100000000101010100101000001011010010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_pc\(0),
	datac => \PC|ALT_INV_pc\(1),
	datad => \PC|ALT_INV_pc\(3),
	dataf => \PC|ALT_INV_pc\(2),
	combout => \HEX5_Driver|Mux3~0_combout\);

-- Location: LABCELL_X39_Y5_N36
\HEX5_Driver|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX5_Driver|Mux2~0_combout\ = ( \PC|pc\(0) & ( (!\PC|pc\(3)) # ((!\PC|pc\(1) & !\PC|pc\(2))) ) ) # ( !\PC|pc\(0) & ( (!\PC|pc\(1) & (\PC|pc\(2) & !\PC|pc\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000001000000010000011111000111110001111100011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_pc\(1),
	datab => \PC|ALT_INV_pc\(2),
	datac => \PC|ALT_INV_pc\(3),
	dataf => \PC|ALT_INV_pc\(0),
	combout => \HEX5_Driver|Mux2~0_combout\);

-- Location: MLABCELL_X42_Y5_N6
\HEX5_Driver|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX5_Driver|Mux1~0_combout\ = ( \PC|pc\(3) & ( (\PC|pc\(2) & (!\PC|pc\(1) & \PC|pc\(0))) ) ) # ( !\PC|pc\(3) & ( (!\PC|pc\(2) & ((\PC|pc\(0)) # (\PC|pc\(1)))) # (\PC|pc\(2) & (\PC|pc\(1) & \PC|pc\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101100101011001010110010101100000100000001000000010000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_pc\(2),
	datab => \PC|ALT_INV_pc\(1),
	datac => \PC|ALT_INV_pc\(0),
	dataf => \PC|ALT_INV_pc\(3),
	combout => \HEX5_Driver|Mux1~0_combout\);

-- Location: LABCELL_X39_Y5_N42
\HEX5_Driver|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \HEX5_Driver|Mux0~0_combout\ = ( \PC|pc\(2) & ( (!\PC|pc\(1) & ((!\PC|pc\(3)) # (\PC|pc\(0)))) # (\PC|pc\(1) & ((!\PC|pc\(0)) # (\PC|pc\(3)))) ) ) # ( !\PC|pc\(2) & ( (\PC|pc\(3)) # (\PC|pc\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111010101011111111111111010010111111111101001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_pc\(1),
	datac => \PC|ALT_INV_pc\(0),
	datad => \PC|ALT_INV_pc\(3),
	dataf => \PC|ALT_INV_pc\(2),
	combout => \HEX5_Driver|Mux0~0_combout\);

-- Location: LABCELL_X35_Y4_N45
\ULA|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux10~0_combout\ = ( !\Controle|ula_code\(1) & ( !\Controle|ula_code\(3) & ( !\Controle|ula_code\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \Controle|ALT_INV_ula_code\(2),
	datae => \Controle|ALT_INV_ula_code\(1),
	dataf => \Controle|ALT_INV_ula_code\(3),
	combout => \ULA|Mux10~0_combout\);

-- Location: MLABCELL_X37_Y4_N12
\ULA|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux9~0_combout\ = ( \ULA|Add1~29_sumout\ & ( \Controle|ula_code\(0) & ( (\ULA|Mux10~0_combout\ & (reg_inter_2(7) & !reg_inter_1(7))) ) ) ) # ( !\ULA|Add1~29_sumout\ & ( \Controle|ula_code\(0) & ( (\ULA|Mux10~0_combout\ & (!reg_inter_2(7) & 
-- reg_inter_1(7))) ) ) ) # ( \ULA|Add1~29_sumout\ & ( !\Controle|ula_code\(0) & ( (\ULA|Mux10~0_combout\ & ((!\ULA|Add0~29_sumout\ & (reg_inter_2(7) & reg_inter_1(7))) # (\ULA|Add0~29_sumout\ & (!reg_inter_2(7) & !reg_inter_1(7))))) ) ) ) # ( 
-- !\ULA|Add1~29_sumout\ & ( !\Controle|ula_code\(0) & ( (\ULA|Mux10~0_combout\ & ((!\ULA|Add0~29_sumout\ & (reg_inter_2(7) & reg_inter_1(7))) # (\ULA|Add0~29_sumout\ & (!reg_inter_2(7) & !reg_inter_1(7))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000100000100000000010000000000010100000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Mux10~0_combout\,
	datab => \ULA|ALT_INV_Add0~29_sumout\,
	datac => ALT_INV_reg_inter_2(7),
	datad => ALT_INV_reg_inter_1(7),
	datae => \ULA|ALT_INV_Add1~29_sumout\,
	dataf => \Controle|ALT_INV_ula_code\(0),
	combout => \ULA|Mux9~0_combout\);

-- Location: FF_X37_Y4_N13
overflow_flag : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \ULA|Mux9~0_combout\,
	ena => \overflow_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \overflow_flag~q\);

-- Location: LABCELL_X36_Y6_N54
\ULA|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add1~33_sumout\ = SUM(( VCC ) + ( \ULA|Add1~31\ ) + ( \ULA|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	cin => \ULA|Add1~30\,
	sharein => \ULA|Add1~31\,
	sumout => \ULA|Add1~33_sumout\);

-- Location: MLABCELL_X37_Y6_N24
\ULA|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~33_sumout\ = SUM(( GND ) + ( GND ) + ( \ULA|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \ULA|Add0~30\,
	sumout => \ULA|Add0~33_sumout\);

-- Location: MLABCELL_X37_Y4_N39
\ULA|Mux10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Mux10~1_combout\ = ( \ULA|Mux10~0_combout\ & ( (!\Controle|ula_code\(0) & ((\ULA|Add0~33_sumout\))) # (\Controle|ula_code\(0) & (\ULA|Add1~33_sumout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101111101010000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Add1~33_sumout\,
	datac => \Controle|ALT_INV_ula_code\(0),
	datad => \ULA|ALT_INV_Add0~33_sumout\,
	dataf => \ULA|ALT_INV_Mux10~0_combout\,
	combout => \ULA|Mux10~1_combout\);

-- Location: FF_X37_Y4_N40
carry_flag : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \ULA|Mux10~1_combout\,
	ena => \overflow_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \carry_flag~q\);

-- Location: LABCELL_X41_Y5_N15
\Controle|WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|WideOr3~0_combout\ = ( !\Controle|estado.ESPERA_MEMORIA_2~q\ & ( (!\Controle|estado.ACESSO_IO~q\ & (!\Controle|estado.SALTO_ADR~q\ & (!\Controle|estado.ESPERA_PC~q\ & !\Controle|estado.NAO_PULOU~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datab => \Controle|ALT_INV_estado.SALTO_ADR~q\,
	datac => \Controle|ALT_INV_estado.ESPERA_PC~q\,
	datad => \Controle|ALT_INV_estado.NAO_PULOU~q\,
	dataf => \Controle|ALT_INV_estado.ESPERA_MEMORIA_2~q\,
	combout => \Controle|WideOr3~0_combout\);

-- Location: LABCELL_X41_Y5_N6
\Controle|WideOr4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|WideOr4~combout\ = ( \Controle|estado.ACESSO_MEMORIA~q\ & ( \Controle|estado.PULANDO~q\ ) ) # ( !\Controle|estado.ACESSO_MEMORIA~q\ & ( \Controle|estado.PULANDO~q\ ) ) # ( \Controle|estado.ACESSO_MEMORIA~q\ & ( !\Controle|estado.PULANDO~q\ ) ) # 
-- ( !\Controle|estado.ACESSO_MEMORIA~q\ & ( !\Controle|estado.PULANDO~q\ & ( ((!\Controle|WideOr3~0_combout\) # ((\Controle|estado.PEGA_LITERAL~q\) # (\Controle|estado.DECODIFICA_2~q\))) # (\Controle|estado.ESPERA~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.ESPERA~q\,
	datab => \Controle|ALT_INV_WideOr3~0_combout\,
	datac => \Controle|ALT_INV_estado.DECODIFICA_2~q\,
	datad => \Controle|ALT_INV_estado.PEGA_LITERAL~q\,
	datae => \Controle|ALT_INV_estado.ACESSO_MEMORIA~q\,
	dataf => \Controle|ALT_INV_estado.PULANDO~q\,
	combout => \Controle|WideOr4~combout\);

-- Location: LABCELL_X40_Y5_N36
\Controle|WideOr3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|WideOr3~combout\ = ( \Controle|estado.EXECUTA~q\ & ( \Controle|estado.ESPERA_MEMORIA~q\ ) ) # ( !\Controle|estado.EXECUTA~q\ & ( \Controle|estado.ESPERA_MEMORIA~q\ ) ) # ( \Controle|estado.EXECUTA~q\ & ( !\Controle|estado.ESPERA_MEMORIA~q\ ) ) # 
-- ( !\Controle|estado.EXECUTA~q\ & ( !\Controle|estado.ESPERA_MEMORIA~q\ & ( (((!\Controle|WideOr3~0_combout\) # (!\Controle|estado.BUSCA~q\)) # (\Controle|estado.ESPERA_PULO~q\)) # (\Controle|estado.ESPERA_LITERAL~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111110111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.ESPERA_LITERAL~q\,
	datab => \Controle|ALT_INV_estado.ESPERA_PULO~q\,
	datac => \Controle|ALT_INV_WideOr3~0_combout\,
	datad => \Controle|ALT_INV_estado.BUSCA~q\,
	datae => \Controle|ALT_INV_estado.EXECUTA~q\,
	dataf => \Controle|ALT_INV_estado.ESPERA_MEMORIA~q\,
	combout => \Controle|WideOr3~combout\);

-- Location: LABCELL_X39_Y4_N39
\Controle|WideOr2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|WideOr2~combout\ = ( \Controle|WideOr1~0_combout\ & ( \Controle|estado.EXECUTA~q\ ) ) # ( !\Controle|WideOr1~0_combout\ & ( \Controle|estado.EXECUTA~q\ ) ) # ( \Controle|WideOr1~0_combout\ & ( !\Controle|estado.EXECUTA~q\ & ( 
-- (!\Controle|WideOr23~0_combout\) # ((\Controle|estado.ACESSO_IO~q\) # (\Controle|estado.ESPERA_SAIDA~q\)) ) ) ) # ( !\Controle|WideOr1~0_combout\ & ( !\Controle|estado.EXECUTA~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111101110111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_WideOr23~0_combout\,
	datab => \Controle|ALT_INV_estado.ESPERA_SAIDA~q\,
	datad => \Controle|ALT_INV_estado.ACESSO_IO~q\,
	datae => \Controle|ALT_INV_WideOr1~0_combout\,
	dataf => \Controle|ALT_INV_estado.EXECUTA~q\,
	combout => \Controle|WideOr2~combout\);

-- Location: MLABCELL_X37_Y7_N27
\Controle|WideOr1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|WideOr1~combout\ = ( \Controle|estado.PEGA_LITERAL~q\ ) # ( !\Controle|estado.PEGA_LITERAL~q\ & ( ((!\Controle|WideOr1~0_combout\) # (\Controle|estado.ESPERA_LITERAL~q\)) # (\Controle|estado.SALTO_ADR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111011111110111111101111111011111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.SALTO_ADR~q\,
	datab => \Controle|ALT_INV_estado.ESPERA_LITERAL~q\,
	datac => \Controle|ALT_INV_WideOr1~0_combout\,
	dataf => \Controle|ALT_INV_estado.PEGA_LITERAL~q\,
	combout => \Controle|WideOr1~combout\);

-- Location: LABCELL_X41_Y5_N45
\Controle|WideOr0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Controle|WideOr0~combout\ = ( \Controle|estado.ESPERA_SAIDA~q\ ) # ( !\Controle|estado.ESPERA_SAIDA~q\ & ( (((\Controle|estado.NAO_PULOU~q\) # (\Controle|estado.PULANDO~q\)) # (\Controle|estado.ESPERA_PULO~q\)) # (\Controle|estado.MOVER~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111111111111111111111111111101111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Controle|ALT_INV_estado.MOVER~q\,
	datab => \Controle|ALT_INV_estado.ESPERA_PULO~q\,
	datac => \Controle|ALT_INV_estado.PULANDO~q\,
	datad => \Controle|ALT_INV_estado.NAO_PULOU~q\,
	datae => \Controle|ALT_INV_estado.ESPERA_SAIDA~q\,
	combout => \Controle|WideOr0~combout\);

-- Location: LABCELL_X16_Y40_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


