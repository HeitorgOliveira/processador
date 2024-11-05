LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY ram256x8 IS
	PORT
	(
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wraddress		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END ram256x8;


ARCHITECTURE SYN OF ram256x8 IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
	q    <= sub_wire0(7 DOWNTO 0);
	altsyncram_component : altsyncram
	GENERIC MAP (
		address_aclr_b => "NONE",
		address_reg_b => "CLOCK0",
		clock_enable_input_a => "BYPASS",
		clock_enable_input_b => "BYPASS",
		clock_enable_output_b => "BYPASS",
		init_file => "ram256x8.mif",
		intended_device_family => "Cyclone V",
		lpm_type => "altsyncram",
		numwords_a => 256,
		numwords_b => 256,
		operation_mode => "DUAL_PORT",
		outdata_aclr_b => "NONE",
		outdata_reg_b => "CLOCK0",
		power_up_uninitialized => "FALSE",
		read_during_write_mode_mixed_ports => "DONT_CARE",
		widthad_a => 8,
		widthad_b => 8,
		width_a => 8,
		width_b => 8,
		width_byteena_a => 1
	)
	PORT MAP (
		address_a => wraddress,
		address_b => rdaddress,
		clock0 => clock,
		data_a => data,
		wren_a => wren,
		q_b => sub_wire0
	);
END SYN;
