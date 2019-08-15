--------------------------------------------------------------
 --  Copyright (c) 2011-2021 Anlogic, Inc.
 --  All Right Reserved.
--------------------------------------------------------------
 -- Log	:	This file is generated by Anlogic IP Generator.
 -- File	:	E:/DEMO/EG4S20BG256_DEMO/uart/al_ip/pll_test.vhd
 -- Date	:	2019 07 23
 -- TD version	:	4.6.12906
--------------------------------------------------------------

-------------------------------------------------------------------------------
--	Input frequency:             25.000Mhz
--	Clock multiplication factor: 1
--	Clock division factor:       1
--	Clock information:
--		Clock name	| Frequency 	| Phase shift
--		C0        	| 25.000000 MHZ	| 0  DEG     
--		C1        	| 50.000000 MHZ	| 0  DEG     
--		C2        	| 100.000000MHZ	| 0  DEG     
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;
LIBRARY eagle_macro;
USE eagle_macro.EAGLE_COMPONENTS.ALL;

ENTITY pll_test IS
	PORT ( refclk	: IN	STD_LOGIC;
		reset	: IN	STD_LOGIC;
		extlock	: OUT	STD_LOGIC;
		clk0_out	: OUT	STD_LOGIC;
		clk1_out	: OUT	STD_LOGIC;
		clk2_out	: OUT	STD_LOGIC);
END pll_test;

ARCHITECTURE rtl OF pll_test IS
	SIGNAL clk0_buf	: STD_LOGIC;
	SIGNAL fbk_wire	: STD_LOGIC;
	SIGNAL clkc_wire	: STD_LOGIC_VECTOR (4 DOWNTO 0);
BEGIN
	bufg_feedback : EG_LOGIC_BUFG
		PORT MAP ( i => clk0_buf, o => fbk_wire );

	pll_inst : EG_PHY_PLL	GENERIC MAP ( DPHASE_SOURCE => "DISABLE",
		DYNCFG => "DISABLE",
		FIN => "25.000",
		FEEDBK_MODE => "NORMAL",
		FEEDBK_PATH => "CLKC0_EXT",
		STDBY_ENABLE => "DISABLE",
		PLLRST_ENA => "ENABLE",
		SYNC_ENABLE => "DISABLE",
		DERIVE_PLL_CLOCKS => "DISABLE",
		GEN_BASIC_CLOCK => "DISABLE",
		GMC_GAIN => 6,
		ICP_CURRENT => 3,
		KVCO => 6,
		LPF_CAPACITOR => 3,
		LPF_RESISTOR => 2,
		REFCLK_DIV => 1,
		FBCLK_DIV => 1,
		CLKC0_ENABLE => "ENABLE",
		CLKC0_DIV => 40,
		CLKC0_CPHASE => 39,
		CLKC0_FPHASE => 0,
		CLKC1_ENABLE => "ENABLE",
		CLKC1_DIV => 20,
		CLKC1_CPHASE => 19,
		CLKC1_FPHASE => 0,
		CLKC2_ENABLE => "ENABLE",
		CLKC2_DIV => 10,
		CLKC2_CPHASE => 9,
		CLKC2_FPHASE => 0)
		PORT MAP ( refclk => refclk,
			reset => reset,
			stdby => '0',
			extlock => extlock,
			psclk => '0',
			psdown => '0',
			psstep => '0',
			psclksel => "000",
			dclk => '0',
			dcs => '0',
			dwe => '0',
			di => "00000000",
			daddr => "000000",
			fbclk => fbk_wire,
			clkc => clkc_wire);

		clk2_out <= clkc_wire(2);
		clk1_out <= clkc_wire(1);
		clk0_buf <= clkc_wire(0);
		clk0_out <= fbk_wire;

END rtl;