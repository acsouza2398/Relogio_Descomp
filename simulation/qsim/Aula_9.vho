-- Copyright (C) 2020  Intel Corporation. All rights reserved.
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
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "10/19/2022 20:43:10"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Aula_9 IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(9 DOWNTO 0);
	FPGA_RESET_N : IN std_logic;
	LEDR : OUT std_logic_vector(9 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	HEX5 : OUT std_logic_vector(6 DOWNTO 0);
	DATA_IN : OUT std_logic_vector(7 DOWNTO 0);
	DATA_OUT : OUT std_logic_vector(7 DOWNTO 0);
	Instruction_IN : OUT std_logic_vector(12 DOWNTO 0);
	ROM_Address : OUT std_logic_vector(8 DOWNTO 0);
	flag_ff : OUT std_logic
	);
END Aula_9;

ARCHITECTURE structure OF Aula_9 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_FPGA_RESET_N : std_logic;
SIGNAL ww_LEDR : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_DATA_IN : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_DATA_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Instruction_IN : std_logic_vector(12 DOWNTO 0);
SIGNAL ww_ROM_Address : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_flag_ff : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \FPGA_RESET_N~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \DATA_IN[0]~output_o\ : std_logic;
SIGNAL \DATA_IN[1]~output_o\ : std_logic;
SIGNAL \DATA_IN[2]~output_o\ : std_logic;
SIGNAL \DATA_IN[3]~output_o\ : std_logic;
SIGNAL \DATA_IN[4]~output_o\ : std_logic;
SIGNAL \DATA_IN[5]~output_o\ : std_logic;
SIGNAL \DATA_IN[6]~output_o\ : std_logic;
SIGNAL \DATA_IN[7]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[8]~output_o\ : std_logic;
SIGNAL \LEDR[9]~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX5[0]~output_o\ : std_logic;
SIGNAL \HEX5[1]~output_o\ : std_logic;
SIGNAL \HEX5[2]~output_o\ : std_logic;
SIGNAL \HEX5[3]~output_o\ : std_logic;
SIGNAL \HEX5[4]~output_o\ : std_logic;
SIGNAL \HEX5[5]~output_o\ : std_logic;
SIGNAL \HEX5[6]~output_o\ : std_logic;
SIGNAL \DATA_OUT[0]~output_o\ : std_logic;
SIGNAL \DATA_OUT[1]~output_o\ : std_logic;
SIGNAL \DATA_OUT[2]~output_o\ : std_logic;
SIGNAL \DATA_OUT[3]~output_o\ : std_logic;
SIGNAL \DATA_OUT[4]~output_o\ : std_logic;
SIGNAL \DATA_OUT[5]~output_o\ : std_logic;
SIGNAL \DATA_OUT[6]~output_o\ : std_logic;
SIGNAL \DATA_OUT[7]~output_o\ : std_logic;
SIGNAL \Instruction_IN[0]~output_o\ : std_logic;
SIGNAL \Instruction_IN[1]~output_o\ : std_logic;
SIGNAL \Instruction_IN[2]~output_o\ : std_logic;
SIGNAL \Instruction_IN[3]~output_o\ : std_logic;
SIGNAL \Instruction_IN[4]~output_o\ : std_logic;
SIGNAL \Instruction_IN[5]~output_o\ : std_logic;
SIGNAL \Instruction_IN[6]~output_o\ : std_logic;
SIGNAL \Instruction_IN[7]~output_o\ : std_logic;
SIGNAL \Instruction_IN[8]~output_o\ : std_logic;
SIGNAL \Instruction_IN[9]~output_o\ : std_logic;
SIGNAL \Instruction_IN[10]~output_o\ : std_logic;
SIGNAL \Instruction_IN[11]~output_o\ : std_logic;
SIGNAL \Instruction_IN[12]~output_o\ : std_logic;
SIGNAL \ROM_Address[0]~output_o\ : std_logic;
SIGNAL \ROM_Address[1]~output_o\ : std_logic;
SIGNAL \ROM_Address[2]~output_o\ : std_logic;
SIGNAL \ROM_Address[3]~output_o\ : std_logic;
SIGNAL \ROM_Address[4]~output_o\ : std_logic;
SIGNAL \ROM_Address[5]~output_o\ : std_logic;
SIGNAL \ROM_Address[6]~output_o\ : std_logic;
SIGNAL \ROM_Address[7]~output_o\ : std_logic;
SIGNAL \ROM_Address[8]~output_o\ : std_logic;
SIGNAL \flag_ff~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~18\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~21_sumout\ : std_logic;
SIGNAL \processador|MUXJMP|saida_MUX[5]~6_combout\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~22\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~25_sumout\ : std_logic;
SIGNAL \processador|MUXJMP|saida_MUX[6]~7_combout\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~26\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~29_sumout\ : std_logic;
SIGNAL \processador|MUXJMP|saida_MUX[7]~8_combout\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~30\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~33_sumout\ : std_logic;
SIGNAL \processador|MUXJMP|saida_MUX[8]~9_combout\ : std_logic;
SIGNAL \ROM1|memROM~2_combout\ : std_logic;
SIGNAL \ROM1|memROM~3_combout\ : std_logic;
SIGNAL \ROM1|memROM~4_combout\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~2\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~5_sumout\ : std_logic;
SIGNAL \processador|MUXJMP|saida_MUX[1]~2_combout\ : std_logic;
SIGNAL \ROM1|memROM~8_combout\ : std_logic;
SIGNAL \ROM1|memROM~9_combout\ : std_logic;
SIGNAL \ROM1|memROM~10_combout\ : std_logic;
SIGNAL \ROM1|memROM~6_combout\ : std_logic;
SIGNAL \ROM1|memROM~7_combout\ : std_logic;
SIGNAL \processador|decoderInstru|saida[1]~1_combout\ : std_logic;
SIGNAL \ROM1|memROM~0_combout\ : std_logic;
SIGNAL \ROM1|memROM~11_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~90_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~57_q\ : std_logic;
SIGNAL \memoriaRAM|dado_out[0]~13_combout\ : std_logic;
SIGNAL \processador|ULA1|Add0~2\ : std_logic;
SIGNAL \processador|ULA1|Add0~5_sumout\ : std_logic;
SIGNAL \processador|ULA1|Add1~34_cout\ : std_logic;
SIGNAL \processador|ULA1|Add1~22\ : std_logic;
SIGNAL \processador|ULA1|Add1~25_sumout\ : std_logic;
SIGNAL \processador|decoderInstru|Equal1~0_combout\ : std_logic;
SIGNAL \processador|ULA1|saida[1]~1_combout\ : std_logic;
SIGNAL \processador|decoderInstru|Equal1~1_combout\ : std_logic;
SIGNAL \processador|decoderInstru|saida[5]~0_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~89_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~18_q\ : std_logic;
SIGNAL \memoriaRAM|ram~58_q\ : std_logic;
SIGNAL \memoriaRAM|dado_out[1]~14_combout\ : std_logic;
SIGNAL \processador|ULA1|Add0~6\ : std_logic;
SIGNAL \processador|ULA1|Add0~9_sumout\ : std_logic;
SIGNAL \processador|ULA1|Add1~26\ : std_logic;
SIGNAL \processador|ULA1|Add1~29_sumout\ : std_logic;
SIGNAL \processador|ULA1|saida[2]~2_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~19_q\ : std_logic;
SIGNAL \memoriaRAM|ram~59_q\ : std_logic;
SIGNAL \memoriaRAM|dado_out[2]~15_combout\ : std_logic;
SIGNAL \processador|ULA1|Add0~10\ : std_logic;
SIGNAL \processador|ULA1|Add0~13_sumout\ : std_logic;
SIGNAL \processador|ULA1|Add1~30\ : std_logic;
SIGNAL \processador|ULA1|Add1~1_sumout\ : std_logic;
SIGNAL \processador|ULA1|saida[3]~3_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~20_q\ : std_logic;
SIGNAL \memoriaRAM|ram~60_q\ : std_logic;
SIGNAL \memoriaRAM|ram~81_combout\ : std_logic;
SIGNAL \memoriaRAM|dado_out[3]~8_combout\ : std_logic;
SIGNAL \processador|ULA1|Add0~14\ : std_logic;
SIGNAL \processador|ULA1|Add0~17_sumout\ : std_logic;
SIGNAL \processador|ULA1|Add1~2\ : std_logic;
SIGNAL \processador|ULA1|Add1~5_sumout\ : std_logic;
SIGNAL \processador|ULA1|saida[4]~4_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~21_q\ : std_logic;
SIGNAL \memoriaRAM|ram~61_q\ : std_logic;
SIGNAL \memoriaRAM|ram~82_combout\ : std_logic;
SIGNAL \memoriaRAM|dado_out[4]~9_combout\ : std_logic;
SIGNAL \processador|ULA1|Add0~18\ : std_logic;
SIGNAL \processador|ULA1|Add0~21_sumout\ : std_logic;
SIGNAL \processador|ULA1|saida[5]~5_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~22_q\ : std_logic;
SIGNAL \memoriaRAM|ram~62_q\ : std_logic;
SIGNAL \memoriaRAM|ram~83_combout\ : std_logic;
SIGNAL \memoriaRAM|dado_out[5]~10_combout\ : std_logic;
SIGNAL \processador|ULA1|Add1~6\ : std_logic;
SIGNAL \processador|ULA1|Add1~9_sumout\ : std_logic;
SIGNAL \processador|ULA1|Add0~22\ : std_logic;
SIGNAL \processador|ULA1|Add0~25_sumout\ : std_logic;
SIGNAL \processador|ULA1|saida[6]~6_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~23_q\ : std_logic;
SIGNAL \memoriaRAM|ram~63_q\ : std_logic;
SIGNAL \memoriaRAM|ram~84_combout\ : std_logic;
SIGNAL \memoriaRAM|dado_out[6]~11_combout\ : std_logic;
SIGNAL \processador|ULA1|Add1~10\ : std_logic;
SIGNAL \processador|ULA1|Add1~13_sumout\ : std_logic;
SIGNAL \processador|ULA1|Add0~26\ : std_logic;
SIGNAL \processador|ULA1|Add0~29_sumout\ : std_logic;
SIGNAL \processador|ULA1|saida[7]~7_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~24_q\ : std_logic;
SIGNAL \memoriaRAM|ram~64_q\ : std_logic;
SIGNAL \memoriaRAM|ram~85_combout\ : std_logic;
SIGNAL \memoriaRAM|dado_out[7]~12_combout\ : std_logic;
SIGNAL \processador|ULA1|Add1~14\ : std_logic;
SIGNAL \processador|ULA1|Add1~17_sumout\ : std_logic;
SIGNAL \processador|flipFlop|DOUT~0_combout\ : std_logic;
SIGNAL \processador|ULA1|Add1~21_sumout\ : std_logic;
SIGNAL \processador|ULA1|Equal2~2_combout\ : std_logic;
SIGNAL \processador|flipFlop|DOUT~1_combout\ : std_logic;
SIGNAL \processador|flipFlop|DOUT~q\ : std_logic;
SIGNAL \processador|MUXJMP|saida_MUX[2]~0_combout\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~6\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~9_sumout\ : std_logic;
SIGNAL \processador|MUXJMP|saida_MUX[2]~3_combout\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~10\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~14\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~17_sumout\ : std_logic;
SIGNAL \processador|MUXJMP|saida_MUX[4]~5_combout\ : std_logic;
SIGNAL \ROM1|memROM~1_combout\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~1_sumout\ : std_logic;
SIGNAL \processador|MUXJMP|saida_MUX[0]~1_combout\ : std_logic;
SIGNAL \ROM1|memROM~5_combout\ : std_logic;
SIGNAL \processador|MUXJMP|Equal1~0_combout\ : std_logic;
SIGNAL \processador|incrementaPC|Add0~13_sumout\ : std_logic;
SIGNAL \processador|MUXJMP|saida_MUX[3]~4_combout\ : std_logic;
SIGNAL \processador|decoderInstru|Equal1~2_combout\ : std_logic;
SIGNAL \processador|ULA1|Add0~1_sumout\ : std_logic;
SIGNAL \processador|ULA1|saida[0]~0_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~17_q\ : std_logic;
SIGNAL \memoriaRAM|ram~86_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~87_combout\ : std_logic;
SIGNAL \memoriaRAM|ram~88_combout\ : std_logic;
SIGNAL \processador|ULA1|Equal2~0_combout\ : std_logic;
SIGNAL \processador|ULA1|Equal2~1_combout\ : std_logic;
SIGNAL \processador|PC|DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \processador|REGA|DOUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \processador|ULA1|ALT_INV_Equal2~2_combout\ : std_logic;
SIGNAL \processador|flipFlop|ALT_INV_DOUT~0_combout\ : std_logic;
SIGNAL \processador|decoderInstru|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_dado_out[2]~15_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~59_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~19_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_dado_out[1]~14_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~58_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~18_q\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~11_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_dado_out[0]~13_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~57_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~17_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_dado_out[7]~12_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~85_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~64_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~24_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_dado_out[6]~11_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~84_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~63_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~23_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_dado_out[5]~10_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~83_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~62_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~22_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_dado_out[4]~9_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~82_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~61_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~21_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_dado_out[3]~8_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~81_combout\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~60_q\ : std_logic;
SIGNAL \memoriaRAM|ALT_INV_ram~20_q\ : std_logic;
SIGNAL \processador|MUXJMP|ALT_INV_saida_MUX[2]~0_combout\ : std_logic;
SIGNAL \processador|MUXJMP|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \processador|flipFlop|ALT_INV_DOUT~q\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~10_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~9_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~8_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~7_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~6_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~5_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~4_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~3_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~2_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~1_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~0_combout\ : std_logic;
SIGNAL \processador|ULA1|ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \processador|PC|ALT_INV_DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \processador|incrementaPC|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \processador|incrementaPC|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \processador|incrementaPC|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \processador|incrementaPC|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \processador|incrementaPC|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \processador|incrementaPC|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \processador|incrementaPC|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \processador|incrementaPC|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \processador|incrementaPC|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \processador|REGA|ALT_INV_DOUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \processador|ULA1|ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \processador|ULA1|ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \processador|ULA1|ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \processador|ULA1|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \processador|ULA1|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \processador|ULA1|ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \processador|ULA1|ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \processador|ULA1|ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \processador|decoderInstru|ALT_INV_Equal1~2_combout\ : std_logic;
SIGNAL \processador|decoderInstru|ALT_INV_saida[1]~1_combout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
ww_FPGA_RESET_N <= FPGA_RESET_N;
LEDR <= ww_LEDR;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
DATA_IN <= ww_DATA_IN;
DATA_OUT <= ww_DATA_OUT;
Instruction_IN <= ww_Instruction_IN;
ROM_Address <= ww_ROM_Address;
flag_ff <= ww_flag_ff;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\processador|ULA1|ALT_INV_Equal2~2_combout\ <= NOT \processador|ULA1|Equal2~2_combout\;
\processador|flipFlop|ALT_INV_DOUT~0_combout\ <= NOT \processador|flipFlop|DOUT~0_combout\;
\processador|decoderInstru|ALT_INV_Equal1~0_combout\ <= NOT \processador|decoderInstru|Equal1~0_combout\;
\memoriaRAM|ALT_INV_dado_out[2]~15_combout\ <= NOT \memoriaRAM|dado_out[2]~15_combout\;
\memoriaRAM|ALT_INV_ram~59_q\ <= NOT \memoriaRAM|ram~59_q\;
\memoriaRAM|ALT_INV_ram~19_q\ <= NOT \memoriaRAM|ram~19_q\;
\memoriaRAM|ALT_INV_dado_out[1]~14_combout\ <= NOT \memoriaRAM|dado_out[1]~14_combout\;
\memoriaRAM|ALT_INV_ram~58_q\ <= NOT \memoriaRAM|ram~58_q\;
\memoriaRAM|ALT_INV_ram~18_q\ <= NOT \memoriaRAM|ram~18_q\;
\ROM1|ALT_INV_memROM~11_combout\ <= NOT \ROM1|memROM~11_combout\;
\memoriaRAM|ALT_INV_dado_out[0]~13_combout\ <= NOT \memoriaRAM|dado_out[0]~13_combout\;
\memoriaRAM|ALT_INV_ram~57_q\ <= NOT \memoriaRAM|ram~57_q\;
\memoriaRAM|ALT_INV_ram~17_q\ <= NOT \memoriaRAM|ram~17_q\;
\memoriaRAM|ALT_INV_dado_out[7]~12_combout\ <= NOT \memoriaRAM|dado_out[7]~12_combout\;
\memoriaRAM|ALT_INV_ram~85_combout\ <= NOT \memoriaRAM|ram~85_combout\;
\memoriaRAM|ALT_INV_ram~64_q\ <= NOT \memoriaRAM|ram~64_q\;
\memoriaRAM|ALT_INV_ram~24_q\ <= NOT \memoriaRAM|ram~24_q\;
\memoriaRAM|ALT_INV_dado_out[6]~11_combout\ <= NOT \memoriaRAM|dado_out[6]~11_combout\;
\memoriaRAM|ALT_INV_ram~84_combout\ <= NOT \memoriaRAM|ram~84_combout\;
\memoriaRAM|ALT_INV_ram~63_q\ <= NOT \memoriaRAM|ram~63_q\;
\memoriaRAM|ALT_INV_ram~23_q\ <= NOT \memoriaRAM|ram~23_q\;
\memoriaRAM|ALT_INV_dado_out[5]~10_combout\ <= NOT \memoriaRAM|dado_out[5]~10_combout\;
\memoriaRAM|ALT_INV_ram~83_combout\ <= NOT \memoriaRAM|ram~83_combout\;
\memoriaRAM|ALT_INV_ram~62_q\ <= NOT \memoriaRAM|ram~62_q\;
\memoriaRAM|ALT_INV_ram~22_q\ <= NOT \memoriaRAM|ram~22_q\;
\memoriaRAM|ALT_INV_dado_out[4]~9_combout\ <= NOT \memoriaRAM|dado_out[4]~9_combout\;
\memoriaRAM|ALT_INV_ram~82_combout\ <= NOT \memoriaRAM|ram~82_combout\;
\memoriaRAM|ALT_INV_ram~61_q\ <= NOT \memoriaRAM|ram~61_q\;
\memoriaRAM|ALT_INV_ram~21_q\ <= NOT \memoriaRAM|ram~21_q\;
\memoriaRAM|ALT_INV_dado_out[3]~8_combout\ <= NOT \memoriaRAM|dado_out[3]~8_combout\;
\memoriaRAM|ALT_INV_ram~81_combout\ <= NOT \memoriaRAM|ram~81_combout\;
\memoriaRAM|ALT_INV_ram~60_q\ <= NOT \memoriaRAM|ram~60_q\;
\memoriaRAM|ALT_INV_ram~20_q\ <= NOT \memoriaRAM|ram~20_q\;
\processador|MUXJMP|ALT_INV_saida_MUX[2]~0_combout\ <= NOT \processador|MUXJMP|saida_MUX[2]~0_combout\;
\processador|MUXJMP|ALT_INV_Equal1~0_combout\ <= NOT \processador|MUXJMP|Equal1~0_combout\;
\processador|flipFlop|ALT_INV_DOUT~q\ <= NOT \processador|flipFlop|DOUT~q\;
\ROM1|ALT_INV_memROM~10_combout\ <= NOT \ROM1|memROM~10_combout\;
\ROM1|ALT_INV_memROM~9_combout\ <= NOT \ROM1|memROM~9_combout\;
\ROM1|ALT_INV_memROM~8_combout\ <= NOT \ROM1|memROM~8_combout\;
\ROM1|ALT_INV_memROM~7_combout\ <= NOT \ROM1|memROM~7_combout\;
\ROM1|ALT_INV_memROM~6_combout\ <= NOT \ROM1|memROM~6_combout\;
\ROM1|ALT_INV_memROM~5_combout\ <= NOT \ROM1|memROM~5_combout\;
\ROM1|ALT_INV_memROM~4_combout\ <= NOT \ROM1|memROM~4_combout\;
\ROM1|ALT_INV_memROM~3_combout\ <= NOT \ROM1|memROM~3_combout\;
\ROM1|ALT_INV_memROM~2_combout\ <= NOT \ROM1|memROM~2_combout\;
\ROM1|ALT_INV_memROM~1_combout\ <= NOT \ROM1|memROM~1_combout\;
\ROM1|ALT_INV_memROM~0_combout\ <= NOT \ROM1|memROM~0_combout\;
\processador|ULA1|ALT_INV_Equal2~0_combout\ <= NOT \processador|ULA1|Equal2~0_combout\;
\processador|PC|ALT_INV_DOUT\(8) <= NOT \processador|PC|DOUT\(8);
\processador|PC|ALT_INV_DOUT\(7) <= NOT \processador|PC|DOUT\(7);
\processador|PC|ALT_INV_DOUT\(6) <= NOT \processador|PC|DOUT\(6);
\processador|PC|ALT_INV_DOUT\(5) <= NOT \processador|PC|DOUT\(5);
\processador|PC|ALT_INV_DOUT\(4) <= NOT \processador|PC|DOUT\(4);
\processador|PC|ALT_INV_DOUT\(3) <= NOT \processador|PC|DOUT\(3);
\processador|PC|ALT_INV_DOUT\(2) <= NOT \processador|PC|DOUT\(2);
\processador|PC|ALT_INV_DOUT\(1) <= NOT \processador|PC|DOUT\(1);
\processador|PC|ALT_INV_DOUT\(0) <= NOT \processador|PC|DOUT\(0);
\processador|incrementaPC|ALT_INV_Add0~33_sumout\ <= NOT \processador|incrementaPC|Add0~33_sumout\;
\processador|incrementaPC|ALT_INV_Add0~29_sumout\ <= NOT \processador|incrementaPC|Add0~29_sumout\;
\processador|incrementaPC|ALT_INV_Add0~25_sumout\ <= NOT \processador|incrementaPC|Add0~25_sumout\;
\processador|incrementaPC|ALT_INV_Add0~21_sumout\ <= NOT \processador|incrementaPC|Add0~21_sumout\;
\processador|incrementaPC|ALT_INV_Add0~17_sumout\ <= NOT \processador|incrementaPC|Add0~17_sumout\;
\processador|incrementaPC|ALT_INV_Add0~13_sumout\ <= NOT \processador|incrementaPC|Add0~13_sumout\;
\processador|incrementaPC|ALT_INV_Add0~9_sumout\ <= NOT \processador|incrementaPC|Add0~9_sumout\;
\processador|incrementaPC|ALT_INV_Add0~5_sumout\ <= NOT \processador|incrementaPC|Add0~5_sumout\;
\processador|incrementaPC|ALT_INV_Add0~1_sumout\ <= NOT \processador|incrementaPC|Add0~1_sumout\;
\processador|REGA|ALT_INV_DOUT\(7) <= NOT \processador|REGA|DOUT\(7);
\processador|REGA|ALT_INV_DOUT\(6) <= NOT \processador|REGA|DOUT\(6);
\processador|REGA|ALT_INV_DOUT\(5) <= NOT \processador|REGA|DOUT\(5);
\processador|REGA|ALT_INV_DOUT\(4) <= NOT \processador|REGA|DOUT\(4);
\processador|REGA|ALT_INV_DOUT\(3) <= NOT \processador|REGA|DOUT\(3);
\processador|REGA|ALT_INV_DOUT\(2) <= NOT \processador|REGA|DOUT\(2);
\processador|REGA|ALT_INV_DOUT\(1) <= NOT \processador|REGA|DOUT\(1);
\processador|REGA|ALT_INV_DOUT\(0) <= NOT \processador|REGA|DOUT\(0);
\processador|ULA1|ALT_INV_Add1~29_sumout\ <= NOT \processador|ULA1|Add1~29_sumout\;
\processador|ULA1|ALT_INV_Add1~25_sumout\ <= NOT \processador|ULA1|Add1~25_sumout\;
\processador|ULA1|ALT_INV_Add1~21_sumout\ <= NOT \processador|ULA1|Add1~21_sumout\;
\processador|ULA1|ALT_INV_Add1~17_sumout\ <= NOT \processador|ULA1|Add1~17_sumout\;
\processador|ULA1|ALT_INV_Add1~13_sumout\ <= NOT \processador|ULA1|Add1~13_sumout\;
\processador|ULA1|ALT_INV_Add1~9_sumout\ <= NOT \processador|ULA1|Add1~9_sumout\;
\processador|ULA1|ALT_INV_Add1~5_sumout\ <= NOT \processador|ULA1|Add1~5_sumout\;
\processador|ULA1|ALT_INV_Add1~1_sumout\ <= NOT \processador|ULA1|Add1~1_sumout\;
\processador|decoderInstru|ALT_INV_Equal1~2_combout\ <= NOT \processador|decoderInstru|Equal1~2_combout\;
\processador|decoderInstru|ALT_INV_saida[1]~1_combout\ <= NOT \processador|decoderInstru|saida[1]~1_combout\;

\DATA_IN[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoriaRAM|ram~86_combout\,
	oe => \processador|decoderInstru|saida[1]~1_combout\,
	devoe => ww_devoe,
	o => \DATA_IN[0]~output_o\);

\DATA_IN[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoriaRAM|ram~87_combout\,
	oe => \processador|decoderInstru|saida[1]~1_combout\,
	devoe => ww_devoe,
	o => \DATA_IN[1]~output_o\);

\DATA_IN[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoriaRAM|ram~88_combout\,
	oe => \processador|decoderInstru|saida[1]~1_combout\,
	devoe => ww_devoe,
	o => \DATA_IN[2]~output_o\);

\DATA_IN[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoriaRAM|ram~81_combout\,
	oe => \processador|decoderInstru|saida[1]~1_combout\,
	devoe => ww_devoe,
	o => \DATA_IN[3]~output_o\);

\DATA_IN[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoriaRAM|ram~82_combout\,
	oe => \processador|decoderInstru|saida[1]~1_combout\,
	devoe => ww_devoe,
	o => \DATA_IN[4]~output_o\);

\DATA_IN[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoriaRAM|ram~83_combout\,
	oe => \processador|decoderInstru|saida[1]~1_combout\,
	devoe => ww_devoe,
	o => \DATA_IN[5]~output_o\);

\DATA_IN[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoriaRAM|ram~84_combout\,
	oe => \processador|decoderInstru|saida[1]~1_combout\,
	devoe => ww_devoe,
	o => \DATA_IN[6]~output_o\);

\DATA_IN[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoriaRAM|ram~85_combout\,
	oe => \processador|decoderInstru|saida[1]~1_combout\,
	devoe => ww_devoe,
	o => \DATA_IN[7]~output_o\);

\LEDR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(0),
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

\LEDR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(1),
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

\LEDR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(2),
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

\LEDR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(3),
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

\LEDR[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(4),
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

\LEDR[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(5),
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

\LEDR[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(6),
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

\LEDR[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(7),
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

\LEDR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(8),
	devoe => ww_devoe,
	o => \LEDR[8]~output_o\);

\LEDR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|ULA1|Equal2~1_combout\,
	devoe => ww_devoe,
	o => \LEDR[9]~output_o\);

\HEX0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

\HEX0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

\HEX0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

\HEX0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

\HEX0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

\HEX0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

\HEX0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

\HEX1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

\HEX1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

\HEX1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

\HEX1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

\HEX1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

\HEX1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

\HEX1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

\HEX2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

\HEX2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

\HEX2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

\HEX2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

\HEX2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

\HEX2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

\HEX2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

\HEX3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

\HEX3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

\HEX3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

\HEX3[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

\HEX3[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

\HEX3[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

\HEX3[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

\HEX4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

\HEX4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

\HEX4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

\HEX4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

\HEX4[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

\HEX4[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

\HEX4[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

\HEX5[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[0]~output_o\);

\HEX5[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[1]~output_o\);

\HEX5[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[2]~output_o\);

\HEX5[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[3]~output_o\);

\HEX5[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[4]~output_o\);

\HEX5[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[5]~output_o\);

\HEX5[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX5[6]~output_o\);

\DATA_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|REGA|DOUT\(0),
	devoe => ww_devoe,
	o => \DATA_OUT[0]~output_o\);

\DATA_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|REGA|DOUT\(1),
	devoe => ww_devoe,
	o => \DATA_OUT[1]~output_o\);

\DATA_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|REGA|DOUT\(2),
	devoe => ww_devoe,
	o => \DATA_OUT[2]~output_o\);

\DATA_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|REGA|DOUT\(3),
	devoe => ww_devoe,
	o => \DATA_OUT[3]~output_o\);

\DATA_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|REGA|DOUT\(4),
	devoe => ww_devoe,
	o => \DATA_OUT[4]~output_o\);

\DATA_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|REGA|DOUT\(5),
	devoe => ww_devoe,
	o => \DATA_OUT[5]~output_o\);

\DATA_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|REGA|DOUT\(6),
	devoe => ww_devoe,
	o => \DATA_OUT[6]~output_o\);

\DATA_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|REGA|DOUT\(7),
	devoe => ww_devoe,
	o => \DATA_OUT[7]~output_o\);

\Instruction_IN[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~1_combout\,
	devoe => ww_devoe,
	o => \Instruction_IN[0]~output_o\);

\Instruction_IN[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~4_combout\,
	devoe => ww_devoe,
	o => \Instruction_IN[1]~output_o\);

\Instruction_IN[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~1_combout\,
	devoe => ww_devoe,
	o => \Instruction_IN[2]~output_o\);

\Instruction_IN[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Instruction_IN[3]~output_o\);

\Instruction_IN[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Instruction_IN[4]~output_o\);

\Instruction_IN[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Instruction_IN[5]~output_o\);

\Instruction_IN[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Instruction_IN[6]~output_o\);

\Instruction_IN[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Instruction_IN[7]~output_o\);

\Instruction_IN[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Instruction_IN[8]~output_o\);

\Instruction_IN[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~5_combout\,
	devoe => ww_devoe,
	o => \Instruction_IN[9]~output_o\);

\Instruction_IN[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~7_combout\,
	devoe => ww_devoe,
	o => \Instruction_IN[10]~output_o\);

\Instruction_IN[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~9_combout\,
	devoe => ww_devoe,
	o => \Instruction_IN[11]~output_o\);

\Instruction_IN[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~10_combout\,
	devoe => ww_devoe,
	o => \Instruction_IN[12]~output_o\);

\ROM_Address[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(0),
	devoe => ww_devoe,
	o => \ROM_Address[0]~output_o\);

\ROM_Address[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(1),
	devoe => ww_devoe,
	o => \ROM_Address[1]~output_o\);

\ROM_Address[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(2),
	devoe => ww_devoe,
	o => \ROM_Address[2]~output_o\);

\ROM_Address[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(3),
	devoe => ww_devoe,
	o => \ROM_Address[3]~output_o\);

\ROM_Address[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(4),
	devoe => ww_devoe,
	o => \ROM_Address[4]~output_o\);

\ROM_Address[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(5),
	devoe => ww_devoe,
	o => \ROM_Address[5]~output_o\);

\ROM_Address[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(6),
	devoe => ww_devoe,
	o => \ROM_Address[6]~output_o\);

\ROM_Address[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(7),
	devoe => ww_devoe,
	o => \ROM_Address[7]~output_o\);

\ROM_Address[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|PC|DOUT\(8),
	devoe => ww_devoe,
	o => \ROM_Address[8]~output_o\);

\flag_ff~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \processador|flipFlop|DOUT~q\,
	devoe => ww_devoe,
	o => \flag_ff~output_o\);

\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

\processador|incrementaPC|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|incrementaPC|Add0~17_sumout\ = SUM(( \processador|PC|DOUT\(4) ) + ( GND ) + ( \processador|incrementaPC|Add0~14\ ))
-- \processador|incrementaPC|Add0~18\ = CARRY(( \processador|PC|DOUT\(4) ) + ( GND ) + ( \processador|incrementaPC|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \processador|PC|ALT_INV_DOUT\(4),
	cin => \processador|incrementaPC|Add0~14\,
	sumout => \processador|incrementaPC|Add0~17_sumout\,
	cout => \processador|incrementaPC|Add0~18\);

\processador|incrementaPC|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|incrementaPC|Add0~21_sumout\ = SUM(( \processador|PC|DOUT\(5) ) + ( GND ) + ( \processador|incrementaPC|Add0~18\ ))
-- \processador|incrementaPC|Add0~22\ = CARRY(( \processador|PC|DOUT\(5) ) + ( GND ) + ( \processador|incrementaPC|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \processador|PC|ALT_INV_DOUT\(5),
	cin => \processador|incrementaPC|Add0~18\,
	sumout => \processador|incrementaPC|Add0~21_sumout\,
	cout => \processador|incrementaPC|Add0~22\);

\processador|MUXJMP|saida_MUX[5]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|saida_MUX[5]~6_combout\ = (!\processador|MUXJMP|Equal1~0_combout\ & \processador|incrementaPC|Add0~21_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|MUXJMP|ALT_INV_Equal1~0_combout\,
	datab => \processador|incrementaPC|ALT_INV_Add0~21_sumout\,
	combout => \processador|MUXJMP|saida_MUX[5]~6_combout\);

\processador|PC|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|MUXJMP|saida_MUX[5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|PC|DOUT\(5));

\processador|incrementaPC|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|incrementaPC|Add0~25_sumout\ = SUM(( \processador|PC|DOUT\(6) ) + ( GND ) + ( \processador|incrementaPC|Add0~22\ ))
-- \processador|incrementaPC|Add0~26\ = CARRY(( \processador|PC|DOUT\(6) ) + ( GND ) + ( \processador|incrementaPC|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \processador|PC|ALT_INV_DOUT\(6),
	cin => \processador|incrementaPC|Add0~22\,
	sumout => \processador|incrementaPC|Add0~25_sumout\,
	cout => \processador|incrementaPC|Add0~26\);

\processador|MUXJMP|saida_MUX[6]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|saida_MUX[6]~7_combout\ = (!\processador|MUXJMP|Equal1~0_combout\ & \processador|incrementaPC|Add0~25_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|MUXJMP|ALT_INV_Equal1~0_combout\,
	datab => \processador|incrementaPC|ALT_INV_Add0~25_sumout\,
	combout => \processador|MUXJMP|saida_MUX[6]~7_combout\);

\processador|PC|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|MUXJMP|saida_MUX[6]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|PC|DOUT\(6));

\processador|incrementaPC|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|incrementaPC|Add0~29_sumout\ = SUM(( \processador|PC|DOUT\(7) ) + ( GND ) + ( \processador|incrementaPC|Add0~26\ ))
-- \processador|incrementaPC|Add0~30\ = CARRY(( \processador|PC|DOUT\(7) ) + ( GND ) + ( \processador|incrementaPC|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \processador|PC|ALT_INV_DOUT\(7),
	cin => \processador|incrementaPC|Add0~26\,
	sumout => \processador|incrementaPC|Add0~29_sumout\,
	cout => \processador|incrementaPC|Add0~30\);

\processador|MUXJMP|saida_MUX[7]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|saida_MUX[7]~8_combout\ = (!\processador|MUXJMP|Equal1~0_combout\ & \processador|incrementaPC|Add0~29_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|MUXJMP|ALT_INV_Equal1~0_combout\,
	datab => \processador|incrementaPC|ALT_INV_Add0~29_sumout\,
	combout => \processador|MUXJMP|saida_MUX[7]~8_combout\);

\processador|PC|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|MUXJMP|saida_MUX[7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|PC|DOUT\(7));

\processador|incrementaPC|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|incrementaPC|Add0~33_sumout\ = SUM(( \processador|PC|DOUT\(8) ) + ( GND ) + ( \processador|incrementaPC|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \processador|PC|ALT_INV_DOUT\(8),
	cin => \processador|incrementaPC|Add0~30\,
	sumout => \processador|incrementaPC|Add0~33_sumout\);

\processador|MUXJMP|saida_MUX[8]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|saida_MUX[8]~9_combout\ = (!\processador|MUXJMP|Equal1~0_combout\ & \processador|incrementaPC|Add0~33_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|MUXJMP|ALT_INV_Equal1~0_combout\,
	datab => \processador|incrementaPC|ALT_INV_Add0~33_sumout\,
	combout => \processador|MUXJMP|saida_MUX[8]~9_combout\);

\processador|PC|DOUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|MUXJMP|saida_MUX[8]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|PC|DOUT\(8));

\ROM1|memROM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~2_combout\ = ( !\processador|PC|DOUT\(8) & ( (!\processador|PC|DOUT\(4) & (!\processador|PC|DOUT\(5) & (!\processador|PC|DOUT\(6) & !\processador|PC|DOUT\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(4),
	datab => \processador|PC|ALT_INV_DOUT\(5),
	datac => \processador|PC|ALT_INV_DOUT\(6),
	datad => \processador|PC|ALT_INV_DOUT\(7),
	datae => \processador|PC|ALT_INV_DOUT\(8),
	combout => \ROM1|memROM~2_combout\);

\ROM1|memROM~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~3_combout\ = (!\processador|PC|DOUT\(2) & !\processador|PC|DOUT\(3))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(2),
	datab => \processador|PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~3_combout\);

\ROM1|memROM~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~4_combout\ = (!\processador|PC|DOUT\(0) & (!\processador|PC|DOUT\(1) & (\ROM1|memROM~2_combout\ & \ROM1|memROM~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000000000000100000000000000010000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(0),
	datab => \processador|PC|ALT_INV_DOUT\(1),
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datad => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \ROM1|memROM~4_combout\);

\processador|incrementaPC|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|incrementaPC|Add0~1_sumout\ = SUM(( \processador|PC|DOUT\(0) ) + ( VCC ) + ( !VCC ))
-- \processador|incrementaPC|Add0~2\ = CARRY(( \processador|PC|DOUT\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \processador|PC|ALT_INV_DOUT\(0),
	cin => GND,
	sumout => \processador|incrementaPC|Add0~1_sumout\,
	cout => \processador|incrementaPC|Add0~2\);

\processador|incrementaPC|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|incrementaPC|Add0~5_sumout\ = SUM(( \processador|PC|DOUT\(1) ) + ( GND ) + ( \processador|incrementaPC|Add0~2\ ))
-- \processador|incrementaPC|Add0~6\ = CARRY(( \processador|PC|DOUT\(1) ) + ( GND ) + ( \processador|incrementaPC|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \processador|PC|ALT_INV_DOUT\(1),
	cin => \processador|incrementaPC|Add0~2\,
	sumout => \processador|incrementaPC|Add0~5_sumout\,
	cout => \processador|incrementaPC|Add0~6\);

\processador|MUXJMP|saida_MUX[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|saida_MUX[1]~2_combout\ = (!\ROM1|memROM~4_combout\ & (((!\processador|MUXJMP|saida_MUX[2]~0_combout\ & \processador|incrementaPC|Add0~5_sumout\)))) # (\ROM1|memROM~4_combout\ & (((!\processador|MUXJMP|saida_MUX[2]~0_combout\ & 
-- \processador|incrementaPC|Add0~5_sumout\)) # (\processador|MUXJMP|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111110001000100011111000100010001111100010001000111110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \processador|MUXJMP|ALT_INV_Equal1~0_combout\,
	datac => \processador|MUXJMP|ALT_INV_saida_MUX[2]~0_combout\,
	datad => \processador|incrementaPC|ALT_INV_Add0~5_sumout\,
	combout => \processador|MUXJMP|saida_MUX[1]~2_combout\);

\processador|PC|DOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|MUXJMP|saida_MUX[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|PC|DOUT\(1));

\ROM1|memROM~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~8_combout\ = (!\processador|PC|DOUT\(3) & ((!\processador|PC|DOUT\(1)) # ((\processador|PC|DOUT\(0) & !\processador|PC|DOUT\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101110000000000110111000000000011011100000000001101110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(0),
	datab => \processador|PC|ALT_INV_DOUT\(1),
	datac => \processador|PC|ALT_INV_DOUT\(2),
	datad => \processador|PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~8_combout\);

\ROM1|memROM~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~9_combout\ = (\ROM1|memROM~2_combout\ & \ROM1|memROM~8_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~2_combout\,
	datab => \ROM1|ALT_INV_memROM~8_combout\,
	combout => \ROM1|memROM~9_combout\);

\ROM1|memROM~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~10_combout\ = (!\processador|PC|DOUT\(0) & (\processador|PC|DOUT\(1) & (\ROM1|memROM~2_combout\ & \ROM1|memROM~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010000000000000001000000000000000100000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(0),
	datab => \processador|PC|ALT_INV_DOUT\(1),
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datad => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \ROM1|memROM~10_combout\);

\ROM1|memROM~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~6_combout\ = (!\processador|PC|DOUT\(3) & ((!\processador|PC|DOUT\(1) & ((\processador|PC|DOUT\(2)))) # (\processador|PC|DOUT\(1) & (\processador|PC|DOUT\(0) & !\processador|PC|DOUT\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110000000000000111000000000000011100000000000001110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(0),
	datab => \processador|PC|ALT_INV_DOUT\(1),
	datac => \processador|PC|ALT_INV_DOUT\(2),
	datad => \processador|PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~6_combout\);

\ROM1|memROM~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~7_combout\ = (\ROM1|memROM~2_combout\ & \ROM1|memROM~6_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~2_combout\,
	datab => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \ROM1|memROM~7_combout\);

\processador|decoderInstru|saida[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|decoderInstru|saida[1]~1_combout\ = ( !\processador|PC|DOUT\(0) & ( (!\processador|PC|DOUT\(3) & (!\processador|PC|DOUT\(2) & (\ROM1|memROM~2_combout\ & \processador|PC|DOUT\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000000000000000000000000000010000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(3),
	datab => \processador|PC|ALT_INV_DOUT\(2),
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datad => \processador|PC|ALT_INV_DOUT\(1),
	datae => \processador|PC|ALT_INV_DOUT\(0),
	combout => \processador|decoderInstru|saida[1]~1_combout\);

\ROM1|memROM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~0_combout\ = (!\processador|PC|DOUT\(3) & ((!\processador|PC|DOUT\(0) & (!\processador|PC|DOUT\(1) & !\processador|PC|DOUT\(2))) # (\processador|PC|DOUT\(0) & (!\processador|PC|DOUT\(1) $ (!\processador|PC|DOUT\(2))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001010000000000100101000000000010010100000000001001010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(0),
	datab => \processador|PC|ALT_INV_DOUT\(1),
	datac => \processador|PC|ALT_INV_DOUT\(2),
	datad => \processador|PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~0_combout\);

\ROM1|memROM~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~11_combout\ = ( \ROM1|memROM~0_combout\ & ( (!\processador|PC|DOUT\(4) & (!\processador|PC|DOUT\(5) & (!\processador|PC|DOUT\(6) & !\processador|PC|DOUT\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(4),
	datab => \processador|PC|ALT_INV_DOUT\(5),
	datac => \processador|PC|ALT_INV_DOUT\(6),
	datad => \processador|PC|ALT_INV_DOUT\(7),
	datae => \ROM1|ALT_INV_memROM~0_combout\,
	combout => \ROM1|memROM~11_combout\);

\memoriaRAM|ram~90\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|ram~90_combout\ = ( !\ROM1|memROM~4_combout\ & ( \ROM1|memROM~1_combout\ & ( (\ROM1|memROM~5_combout\ & (\ROM1|memROM~9_combout\ & (!\ROM1|memROM~10_combout\ & !\ROM1|memROM~7_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~5_combout\,
	datab => \ROM1|ALT_INV_memROM~9_combout\,
	datac => \ROM1|ALT_INV_memROM~10_combout\,
	datad => \ROM1|ALT_INV_memROM~7_combout\,
	datae => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~1_combout\,
	combout => \memoriaRAM|ram~90_combout\);

\memoriaRAM|ram~57\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(0),
	ena => \memoriaRAM|ram~90_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~57_q\);

\memoriaRAM|dado_out[0]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|dado_out[0]~13_combout\ = ( \memoriaRAM|ram~57_q\ & ( (!\processador|decoderInstru|saida[1]~1_combout\) # ((!\ROM1|memROM~4_combout\ & ((\ROM1|memROM~1_combout\) # (\memoriaRAM|ram~17_q\)))) ) ) # ( !\memoriaRAM|ram~57_q\ & ( 
-- (!\processador|decoderInstru|saida[1]~1_combout\) # ((\memoriaRAM|ram~17_q\ & (!\ROM1|memROM~4_combout\ & !\ROM1|memROM~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101010101010101110101111101010111010101010101011101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_saida[1]~1_combout\,
	datab => \memoriaRAM|ALT_INV_ram~17_q\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \ROM1|ALT_INV_memROM~1_combout\,
	datae => \memoriaRAM|ALT_INV_ram~57_q\,
	combout => \memoriaRAM|dado_out[0]~13_combout\);

\processador|ULA1|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add0~1_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & (\memoriaRAM|dado_out[0]~13_combout\)) # (\processador|decoderInstru|Equal1~2_combout\ & (((!\processador|PC|DOUT\(8) & \ROM1|memROM~11_combout\)))) ) + ( 
-- \processador|REGA|DOUT\(0) ) + ( !VCC ))
-- \processador|ULA1|Add0~2\ = CARRY(( (!\processador|decoderInstru|Equal1~2_combout\ & (\memoriaRAM|dado_out[0]~13_combout\)) # (\processador|decoderInstru|Equal1~2_combout\ & (((!\processador|PC|DOUT\(8) & \ROM1|memROM~11_combout\)))) ) + ( 
-- \processador|REGA|DOUT\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000010001001110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \memoriaRAM|ALT_INV_dado_out[0]~13_combout\,
	datac => \processador|PC|ALT_INV_DOUT\(8),
	datad => \ROM1|ALT_INV_memROM~11_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(0),
	cin => GND,
	sumout => \processador|ULA1|Add0~1_sumout\,
	cout => \processador|ULA1|Add0~2\);

\processador|ULA1|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add0~5_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & ((\memoriaRAM|dado_out[1]~14_combout\))) # (\processador|decoderInstru|Equal1~2_combout\ & (\ROM1|memROM~4_combout\)) ) + ( \processador|REGA|DOUT\(1) ) + ( 
-- \processador|ULA1|Add0~2\ ))
-- \processador|ULA1|Add0~6\ = CARRY(( (!\processador|decoderInstru|Equal1~2_combout\ & ((\memoriaRAM|dado_out[1]~14_combout\))) # (\processador|decoderInstru|Equal1~2_combout\ & (\ROM1|memROM~4_combout\)) ) + ( \processador|REGA|DOUT\(1) ) + ( 
-- \processador|ULA1|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[1]~14_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(1),
	cin => \processador|ULA1|Add0~2\,
	sumout => \processador|ULA1|Add0~5_sumout\,
	cout => \processador|ULA1|Add0~6\);

\processador|ULA1|Add1~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add1~34_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \processador|ULA1|Add1~34_cout\);

\processador|ULA1|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add1~21_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & (!\memoriaRAM|dado_out[0]~13_combout\)) # (\processador|decoderInstru|Equal1~2_combout\ & (((!\ROM1|memROM~11_combout\) # (\processador|PC|DOUT\(8))))) ) + ( 
-- \processador|REGA|DOUT\(0) ) + ( \processador|ULA1|Add1~34_cout\ ))
-- \processador|ULA1|Add1~22\ = CARRY(( (!\processador|decoderInstru|Equal1~2_combout\ & (!\memoriaRAM|dado_out[0]~13_combout\)) # (\processador|decoderInstru|Equal1~2_combout\ & (((!\ROM1|memROM~11_combout\) # (\processador|PC|DOUT\(8))))) ) + ( 
-- \processador|REGA|DOUT\(0) ) + ( \processador|ULA1|Add1~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001101110110001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \memoriaRAM|ALT_INV_dado_out[0]~13_combout\,
	datac => \processador|PC|ALT_INV_DOUT\(8),
	datad => \ROM1|ALT_INV_memROM~11_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(0),
	cin => \processador|ULA1|Add1~34_cout\,
	sumout => \processador|ULA1|Add1~21_sumout\,
	cout => \processador|ULA1|Add1~22\);

\processador|ULA1|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add1~25_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & ((!\memoriaRAM|dado_out[1]~14_combout\))) # (\processador|decoderInstru|Equal1~2_combout\ & (!\ROM1|memROM~4_combout\)) ) + ( \processador|REGA|DOUT\(1) ) + ( 
-- \processador|ULA1|Add1~22\ ))
-- \processador|ULA1|Add1~26\ = CARRY(( (!\processador|decoderInstru|Equal1~2_combout\ & ((!\memoriaRAM|dado_out[1]~14_combout\))) # (\processador|decoderInstru|Equal1~2_combout\ & (!\ROM1|memROM~4_combout\)) ) + ( \processador|REGA|DOUT\(1) ) + ( 
-- \processador|ULA1|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001111101001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[1]~14_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(1),
	cin => \processador|ULA1|Add1~22\,
	sumout => \processador|ULA1|Add1~25_sumout\,
	cout => \processador|ULA1|Add1~26\);

\processador|decoderInstru|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|decoderInstru|Equal1~0_combout\ = (\ROM1|memROM~5_combout\ & (!\ROM1|memROM~9_combout\ & (!\ROM1|memROM~10_combout\ & \ROM1|memROM~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000010000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~5_combout\,
	datab => \ROM1|ALT_INV_memROM~9_combout\,
	datac => \ROM1|ALT_INV_memROM~10_combout\,
	datad => \ROM1|ALT_INV_memROM~7_combout\,
	combout => \processador|decoderInstru|Equal1~0_combout\);

\processador|ULA1|saida[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|saida[1]~1_combout\ = ( \processador|decoderInstru|Equal1~0_combout\ & ( \processador|ULA1|Add1~25_sumout\ ) ) # ( !\processador|decoderInstru|Equal1~0_combout\ & ( (!\processador|decoderInstru|Equal1~2_combout\ & 
-- ((\memoriaRAM|dado_out[1]~14_combout\))) # (\processador|decoderInstru|Equal1~2_combout\ & (\ROM1|memROM~4_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000000001111111100011011000110110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \ROM1|ALT_INV_memROM~4_combout\,
	datac => \memoriaRAM|ALT_INV_dado_out[1]~14_combout\,
	datad => \processador|ULA1|ALT_INV_Add1~25_sumout\,
	datae => \processador|decoderInstru|ALT_INV_Equal1~0_combout\,
	combout => \processador|ULA1|saida[1]~1_combout\);

\processador|decoderInstru|Equal1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|decoderInstru|Equal1~1_combout\ = (((!\ROM1|memROM~7_combout\) # (\ROM1|memROM~10_combout\)) # (\ROM1|memROM~9_combout\)) # (\ROM1|memROM~5_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111101111111111111110111111111111111011111111111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~5_combout\,
	datab => \ROM1|ALT_INV_memROM~9_combout\,
	datac => \ROM1|ALT_INV_memROM~10_combout\,
	datad => \ROM1|ALT_INV_memROM~7_combout\,
	combout => \processador|decoderInstru|Equal1~1_combout\);

\processador|decoderInstru|saida[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|decoderInstru|saida[5]~0_combout\ = (!\ROM1|memROM~10_combout\ & (!\ROM1|memROM~9_combout\ $ (((!\ROM1|memROM~7_combout\ & !\ROM1|memROM~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100010001000001010001000100000101000100010000010100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~10_combout\,
	datab => \ROM1|ALT_INV_memROM~9_combout\,
	datac => \ROM1|ALT_INV_memROM~7_combout\,
	datad => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \processador|decoderInstru|saida[5]~0_combout\);

\processador|REGA|DOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|ULA1|Add0~5_sumout\,
	asdata => \processador|ULA1|saida[1]~1_combout\,
	sload => \processador|decoderInstru|Equal1~1_combout\,
	ena => \processador|decoderInstru|saida[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|REGA|DOUT\(1));

\memoriaRAM|ram~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|ram~89_combout\ = ( !\ROM1|memROM~4_combout\ & ( !\ROM1|memROM~1_combout\ & ( (\ROM1|memROM~5_combout\ & (\ROM1|memROM~9_combout\ & (!\ROM1|memROM~10_combout\ & !\ROM1|memROM~7_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~5_combout\,
	datab => \ROM1|ALT_INV_memROM~9_combout\,
	datac => \ROM1|ALT_INV_memROM~10_combout\,
	datad => \ROM1|ALT_INV_memROM~7_combout\,
	datae => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~1_combout\,
	combout => \memoriaRAM|ram~89_combout\);

\memoriaRAM|ram~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(1),
	ena => \memoriaRAM|ram~89_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~18_q\);

\memoriaRAM|ram~58\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(1),
	ena => \memoriaRAM|ram~90_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~58_q\);

\memoriaRAM|dado_out[1]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|dado_out[1]~14_combout\ = ( \memoriaRAM|ram~58_q\ & ( (!\processador|decoderInstru|saida[1]~1_combout\) # ((!\ROM1|memROM~4_combout\ & ((\memoriaRAM|ram~18_q\) # (\ROM1|memROM~1_combout\)))) ) ) # ( !\memoriaRAM|ram~58_q\ & ( 
-- (!\processador|decoderInstru|saida[1]~1_combout\) # ((!\ROM1|memROM~4_combout\ & (!\ROM1|memROM~1_combout\ & \memoriaRAM|ram~18_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011101010101011101110111010101010111010101010111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_saida[1]~1_combout\,
	datab => \ROM1|ALT_INV_memROM~4_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \memoriaRAM|ALT_INV_ram~18_q\,
	datae => \memoriaRAM|ALT_INV_ram~58_q\,
	combout => \memoriaRAM|dado_out[1]~14_combout\);

\processador|ULA1|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add0~9_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & (((\memoriaRAM|dado_out[2]~15_combout\)))) # (\processador|decoderInstru|Equal1~2_combout\ & (!\processador|PC|DOUT\(8) & (\ROM1|memROM~11_combout\))) ) + ( 
-- \processador|REGA|DOUT\(2) ) + ( \processador|ULA1|Add0~6\ ))
-- \processador|ULA1|Add0~10\ = CARRY(( (!\processador|decoderInstru|Equal1~2_combout\ & (((\memoriaRAM|dado_out[2]~15_combout\)))) # (\processador|decoderInstru|Equal1~2_combout\ & (!\processador|PC|DOUT\(8) & (\ROM1|memROM~11_combout\))) ) + ( 
-- \processador|REGA|DOUT\(2) ) + ( \processador|ULA1|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \processador|PC|ALT_INV_DOUT\(8),
	datac => \ROM1|ALT_INV_memROM~11_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[2]~15_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(2),
	cin => \processador|ULA1|Add0~6\,
	sumout => \processador|ULA1|Add0~9_sumout\,
	cout => \processador|ULA1|Add0~10\);

\processador|ULA1|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add1~29_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & (((!\memoriaRAM|dado_out[2]~15_combout\)))) # (\processador|decoderInstru|Equal1~2_combout\ & (((!\ROM1|memROM~11_combout\)) # (\processador|PC|DOUT\(8)))) ) + ( 
-- \processador|REGA|DOUT\(2) ) + ( \processador|ULA1|Add1~26\ ))
-- \processador|ULA1|Add1~30\ = CARRY(( (!\processador|decoderInstru|Equal1~2_combout\ & (((!\memoriaRAM|dado_out[2]~15_combout\)))) # (\processador|decoderInstru|Equal1~2_combout\ & (((!\ROM1|memROM~11_combout\)) # (\processador|PC|DOUT\(8)))) ) + ( 
-- \processador|REGA|DOUT\(2) ) + ( \processador|ULA1|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001111101101010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \processador|PC|ALT_INV_DOUT\(8),
	datac => \ROM1|ALT_INV_memROM~11_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[2]~15_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(2),
	cin => \processador|ULA1|Add1~26\,
	sumout => \processador|ULA1|Add1~29_sumout\,
	cout => \processador|ULA1|Add1~30\);

\processador|ULA1|saida[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|saida[2]~2_combout\ = ( \processador|decoderInstru|Equal1~0_combout\ & ( \processador|ULA1|Add1~29_sumout\ ) ) # ( !\processador|decoderInstru|Equal1~0_combout\ & ( (!\processador|decoderInstru|Equal1~2_combout\ & 
-- ((\memoriaRAM|dado_out[2]~15_combout\))) # (\processador|decoderInstru|Equal1~2_combout\ & (\ROM1|memROM~1_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000000001111111100011011000110110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \ROM1|ALT_INV_memROM~1_combout\,
	datac => \memoriaRAM|ALT_INV_dado_out[2]~15_combout\,
	datad => \processador|ULA1|ALT_INV_Add1~29_sumout\,
	datae => \processador|decoderInstru|ALT_INV_Equal1~0_combout\,
	combout => \processador|ULA1|saida[2]~2_combout\);

\processador|REGA|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|ULA1|Add0~9_sumout\,
	asdata => \processador|ULA1|saida[2]~2_combout\,
	sload => \processador|decoderInstru|Equal1~1_combout\,
	ena => \processador|decoderInstru|saida[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|REGA|DOUT\(2));

\memoriaRAM|ram~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(2),
	ena => \memoriaRAM|ram~89_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~19_q\);

\memoriaRAM|ram~59\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(2),
	ena => \memoriaRAM|ram~90_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~59_q\);

\memoriaRAM|dado_out[2]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|dado_out[2]~15_combout\ = ( \memoriaRAM|ram~59_q\ & ( (!\processador|decoderInstru|saida[1]~1_combout\) # ((!\ROM1|memROM~4_combout\ & ((\memoriaRAM|ram~19_q\) # (\ROM1|memROM~1_combout\)))) ) ) # ( !\memoriaRAM|ram~59_q\ & ( 
-- (!\processador|decoderInstru|saida[1]~1_combout\) # ((!\ROM1|memROM~4_combout\ & (!\ROM1|memROM~1_combout\ & \memoriaRAM|ram~19_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011101010101011101110111010101010111010101010111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_saida[1]~1_combout\,
	datab => \ROM1|ALT_INV_memROM~4_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \memoriaRAM|ALT_INV_ram~19_q\,
	datae => \memoriaRAM|ALT_INV_ram~59_q\,
	combout => \memoriaRAM|dado_out[2]~15_combout\);

\processador|ULA1|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add0~13_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & \memoriaRAM|dado_out[3]~8_combout\) ) + ( \processador|REGA|DOUT\(3) ) + ( \processador|ULA1|Add0~10\ ))
-- \processador|ULA1|Add0~14\ = CARRY(( (!\processador|decoderInstru|Equal1~2_combout\ & \memoriaRAM|dado_out[3]~8_combout\) ) + ( \processador|REGA|DOUT\(3) ) + ( \processador|ULA1|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[3]~8_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(3),
	cin => \processador|ULA1|Add0~10\,
	sumout => \processador|ULA1|Add0~13_sumout\,
	cout => \processador|ULA1|Add0~14\);

\processador|ULA1|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add1~1_sumout\ = SUM(( (!\memoriaRAM|dado_out[3]~8_combout\) # (\processador|decoderInstru|Equal1~2_combout\) ) + ( \processador|REGA|DOUT\(3) ) + ( \processador|ULA1|Add1~30\ ))
-- \processador|ULA1|Add1~2\ = CARRY(( (!\memoriaRAM|dado_out[3]~8_combout\) # (\processador|decoderInstru|Equal1~2_combout\) ) + ( \processador|REGA|DOUT\(3) ) + ( \processador|ULA1|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[3]~8_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(3),
	cin => \processador|ULA1|Add1~30\,
	sumout => \processador|ULA1|Add1~1_sumout\,
	cout => \processador|ULA1|Add1~2\);

\processador|ULA1|saida[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|saida[3]~3_combout\ = (!\processador|decoderInstru|Equal1~0_combout\ & (!\processador|decoderInstru|Equal1~2_combout\ & (\memoriaRAM|dado_out[3]~8_combout\))) # (\processador|decoderInstru|Equal1~0_combout\ & 
-- (((\processador|ULA1|Add1~1_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000001111001000100000111100100010000011110010001000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \memoriaRAM|ALT_INV_dado_out[3]~8_combout\,
	datac => \processador|ULA1|ALT_INV_Add1~1_sumout\,
	datad => \processador|decoderInstru|ALT_INV_Equal1~0_combout\,
	combout => \processador|ULA1|saida[3]~3_combout\);

\processador|REGA|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|ULA1|Add0~13_sumout\,
	asdata => \processador|ULA1|saida[3]~3_combout\,
	sload => \processador|decoderInstru|Equal1~1_combout\,
	ena => \processador|decoderInstru|saida[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|REGA|DOUT\(3));

\memoriaRAM|ram~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(3),
	ena => \memoriaRAM|ram~89_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~20_q\);

\memoriaRAM|ram~60\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(3),
	ena => \memoriaRAM|ram~90_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~60_q\);

\memoriaRAM|ram~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|ram~81_combout\ = (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~1_combout\ & (\memoriaRAM|ram~20_q\)) # (\ROM1|memROM~1_combout\ & ((\memoriaRAM|ram~60_q\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010000010000010101000001000001010100000100000101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \ROM1|ALT_INV_memROM~1_combout\,
	datac => \memoriaRAM|ALT_INV_ram~20_q\,
	datad => \memoriaRAM|ALT_INV_ram~60_q\,
	combout => \memoriaRAM|ram~81_combout\);

\memoriaRAM|dado_out[3]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|dado_out[3]~8_combout\ = (!\processador|decoderInstru|saida[1]~1_combout\) # (\memoriaRAM|ram~81_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011101110111011101110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_saida[1]~1_combout\,
	datab => \memoriaRAM|ALT_INV_ram~81_combout\,
	combout => \memoriaRAM|dado_out[3]~8_combout\);

\processador|ULA1|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add0~17_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & \memoriaRAM|dado_out[4]~9_combout\) ) + ( \processador|REGA|DOUT\(4) ) + ( \processador|ULA1|Add0~14\ ))
-- \processador|ULA1|Add0~18\ = CARRY(( (!\processador|decoderInstru|Equal1~2_combout\ & \memoriaRAM|dado_out[4]~9_combout\) ) + ( \processador|REGA|DOUT\(4) ) + ( \processador|ULA1|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[4]~9_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(4),
	cin => \processador|ULA1|Add0~14\,
	sumout => \processador|ULA1|Add0~17_sumout\,
	cout => \processador|ULA1|Add0~18\);

\processador|ULA1|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add1~5_sumout\ = SUM(( (!\memoriaRAM|dado_out[4]~9_combout\) # (\processador|decoderInstru|Equal1~2_combout\) ) + ( \processador|REGA|DOUT\(4) ) + ( \processador|ULA1|Add1~2\ ))
-- \processador|ULA1|Add1~6\ = CARRY(( (!\memoriaRAM|dado_out[4]~9_combout\) # (\processador|decoderInstru|Equal1~2_combout\) ) + ( \processador|REGA|DOUT\(4) ) + ( \processador|ULA1|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[4]~9_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(4),
	cin => \processador|ULA1|Add1~2\,
	sumout => \processador|ULA1|Add1~5_sumout\,
	cout => \processador|ULA1|Add1~6\);

\processador|ULA1|saida[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|saida[4]~4_combout\ = (!\processador|decoderInstru|Equal1~0_combout\ & (!\processador|decoderInstru|Equal1~2_combout\ & (\memoriaRAM|dado_out[4]~9_combout\))) # (\processador|decoderInstru|Equal1~0_combout\ & 
-- (((\processador|ULA1|Add1~5_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000001111001000100000111100100010000011110010001000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \memoriaRAM|ALT_INV_dado_out[4]~9_combout\,
	datac => \processador|ULA1|ALT_INV_Add1~5_sumout\,
	datad => \processador|decoderInstru|ALT_INV_Equal1~0_combout\,
	combout => \processador|ULA1|saida[4]~4_combout\);

\processador|REGA|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|ULA1|Add0~17_sumout\,
	asdata => \processador|ULA1|saida[4]~4_combout\,
	sload => \processador|decoderInstru|Equal1~1_combout\,
	ena => \processador|decoderInstru|saida[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|REGA|DOUT\(4));

\memoriaRAM|ram~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(4),
	ena => \memoriaRAM|ram~89_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~21_q\);

\memoriaRAM|ram~61\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(4),
	ena => \memoriaRAM|ram~90_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~61_q\);

\memoriaRAM|ram~82\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|ram~82_combout\ = (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~1_combout\ & (\memoriaRAM|ram~21_q\)) # (\ROM1|memROM~1_combout\ & ((\memoriaRAM|ram~61_q\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010000010000010101000001000001010100000100000101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \ROM1|ALT_INV_memROM~1_combout\,
	datac => \memoriaRAM|ALT_INV_ram~21_q\,
	datad => \memoriaRAM|ALT_INV_ram~61_q\,
	combout => \memoriaRAM|ram~82_combout\);

\memoriaRAM|dado_out[4]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|dado_out[4]~9_combout\ = (!\processador|decoderInstru|saida[1]~1_combout\) # (\memoriaRAM|ram~82_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011101110111011101110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_saida[1]~1_combout\,
	datab => \memoriaRAM|ALT_INV_ram~82_combout\,
	combout => \memoriaRAM|dado_out[4]~9_combout\);

\processador|ULA1|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add0~21_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & \memoriaRAM|dado_out[5]~10_combout\) ) + ( \processador|REGA|DOUT\(5) ) + ( \processador|ULA1|Add0~18\ ))
-- \processador|ULA1|Add0~22\ = CARRY(( (!\processador|decoderInstru|Equal1~2_combout\ & \memoriaRAM|dado_out[5]~10_combout\) ) + ( \processador|REGA|DOUT\(5) ) + ( \processador|ULA1|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[5]~10_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(5),
	cin => \processador|ULA1|Add0~18\,
	sumout => \processador|ULA1|Add0~21_sumout\,
	cout => \processador|ULA1|Add0~22\);

\processador|ULA1|saida[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|saida[5]~5_combout\ = (!\processador|decoderInstru|Equal1~0_combout\ & (!\processador|decoderInstru|Equal1~2_combout\ & (\memoriaRAM|dado_out[5]~10_combout\))) # (\processador|decoderInstru|Equal1~0_combout\ & 
-- (((\processador|ULA1|Add1~9_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000001111001000100000111100100010000011110010001000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \memoriaRAM|ALT_INV_dado_out[5]~10_combout\,
	datac => \processador|ULA1|ALT_INV_Add1~9_sumout\,
	datad => \processador|decoderInstru|ALT_INV_Equal1~0_combout\,
	combout => \processador|ULA1|saida[5]~5_combout\);

\processador|REGA|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|ULA1|Add0~21_sumout\,
	asdata => \processador|ULA1|saida[5]~5_combout\,
	sload => \processador|decoderInstru|Equal1~1_combout\,
	ena => \processador|decoderInstru|saida[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|REGA|DOUT\(5));

\memoriaRAM|ram~22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(5),
	ena => \memoriaRAM|ram~89_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~22_q\);

\memoriaRAM|ram~62\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(5),
	ena => \memoriaRAM|ram~90_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~62_q\);

\memoriaRAM|ram~83\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|ram~83_combout\ = (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~1_combout\ & (\memoriaRAM|ram~22_q\)) # (\ROM1|memROM~1_combout\ & ((\memoriaRAM|ram~62_q\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010000010000010101000001000001010100000100000101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \ROM1|ALT_INV_memROM~1_combout\,
	datac => \memoriaRAM|ALT_INV_ram~22_q\,
	datad => \memoriaRAM|ALT_INV_ram~62_q\,
	combout => \memoriaRAM|ram~83_combout\);

\memoriaRAM|dado_out[5]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|dado_out[5]~10_combout\ = (!\processador|decoderInstru|saida[1]~1_combout\) # (\memoriaRAM|ram~83_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011101110111011101110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_saida[1]~1_combout\,
	datab => \memoriaRAM|ALT_INV_ram~83_combout\,
	combout => \memoriaRAM|dado_out[5]~10_combout\);

\processador|ULA1|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add1~9_sumout\ = SUM(( (!\memoriaRAM|dado_out[5]~10_combout\) # (\processador|decoderInstru|Equal1~2_combout\) ) + ( \processador|REGA|DOUT\(5) ) + ( \processador|ULA1|Add1~6\ ))
-- \processador|ULA1|Add1~10\ = CARRY(( (!\memoriaRAM|dado_out[5]~10_combout\) # (\processador|decoderInstru|Equal1~2_combout\) ) + ( \processador|REGA|DOUT\(5) ) + ( \processador|ULA1|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[5]~10_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(5),
	cin => \processador|ULA1|Add1~6\,
	sumout => \processador|ULA1|Add1~9_sumout\,
	cout => \processador|ULA1|Add1~10\);

\processador|ULA1|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add0~25_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & \memoriaRAM|dado_out[6]~11_combout\) ) + ( \processador|REGA|DOUT\(6) ) + ( \processador|ULA1|Add0~22\ ))
-- \processador|ULA1|Add0~26\ = CARRY(( (!\processador|decoderInstru|Equal1~2_combout\ & \memoriaRAM|dado_out[6]~11_combout\) ) + ( \processador|REGA|DOUT\(6) ) + ( \processador|ULA1|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[6]~11_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(6),
	cin => \processador|ULA1|Add0~22\,
	sumout => \processador|ULA1|Add0~25_sumout\,
	cout => \processador|ULA1|Add0~26\);

\processador|ULA1|saida[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|saida[6]~6_combout\ = (!\processador|decoderInstru|Equal1~0_combout\ & (!\processador|decoderInstru|Equal1~2_combout\ & (\memoriaRAM|dado_out[6]~11_combout\))) # (\processador|decoderInstru|Equal1~0_combout\ & 
-- (((\processador|ULA1|Add1~13_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000001111001000100000111100100010000011110010001000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \memoriaRAM|ALT_INV_dado_out[6]~11_combout\,
	datac => \processador|ULA1|ALT_INV_Add1~13_sumout\,
	datad => \processador|decoderInstru|ALT_INV_Equal1~0_combout\,
	combout => \processador|ULA1|saida[6]~6_combout\);

\processador|REGA|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|ULA1|Add0~25_sumout\,
	asdata => \processador|ULA1|saida[6]~6_combout\,
	sload => \processador|decoderInstru|Equal1~1_combout\,
	ena => \processador|decoderInstru|saida[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|REGA|DOUT\(6));

\memoriaRAM|ram~23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(6),
	ena => \memoriaRAM|ram~89_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~23_q\);

\memoriaRAM|ram~63\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(6),
	ena => \memoriaRAM|ram~90_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~63_q\);

\memoriaRAM|ram~84\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|ram~84_combout\ = (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~1_combout\ & (\memoriaRAM|ram~23_q\)) # (\ROM1|memROM~1_combout\ & ((\memoriaRAM|ram~63_q\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010000010000010101000001000001010100000100000101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \ROM1|ALT_INV_memROM~1_combout\,
	datac => \memoriaRAM|ALT_INV_ram~23_q\,
	datad => \memoriaRAM|ALT_INV_ram~63_q\,
	combout => \memoriaRAM|ram~84_combout\);

\memoriaRAM|dado_out[6]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|dado_out[6]~11_combout\ = (!\processador|decoderInstru|saida[1]~1_combout\) # (\memoriaRAM|ram~84_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011101110111011101110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_saida[1]~1_combout\,
	datab => \memoriaRAM|ALT_INV_ram~84_combout\,
	combout => \memoriaRAM|dado_out[6]~11_combout\);

\processador|ULA1|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add1~13_sumout\ = SUM(( (!\memoriaRAM|dado_out[6]~11_combout\) # (\processador|decoderInstru|Equal1~2_combout\) ) + ( \processador|REGA|DOUT\(6) ) + ( \processador|ULA1|Add1~10\ ))
-- \processador|ULA1|Add1~14\ = CARRY(( (!\memoriaRAM|dado_out[6]~11_combout\) # (\processador|decoderInstru|Equal1~2_combout\) ) + ( \processador|REGA|DOUT\(6) ) + ( \processador|ULA1|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[6]~11_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(6),
	cin => \processador|ULA1|Add1~10\,
	sumout => \processador|ULA1|Add1~13_sumout\,
	cout => \processador|ULA1|Add1~14\);

\processador|ULA1|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add0~29_sumout\ = SUM(( (!\processador|decoderInstru|Equal1~2_combout\ & \memoriaRAM|dado_out[7]~12_combout\) ) + ( \processador|REGA|DOUT\(7) ) + ( \processador|ULA1|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[7]~12_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(7),
	cin => \processador|ULA1|Add0~26\,
	sumout => \processador|ULA1|Add0~29_sumout\);

\processador|ULA1|saida[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|saida[7]~7_combout\ = (!\processador|decoderInstru|Equal1~0_combout\ & (!\processador|decoderInstru|Equal1~2_combout\ & (\memoriaRAM|dado_out[7]~12_combout\))) # (\processador|decoderInstru|Equal1~0_combout\ & 
-- (((\processador|ULA1|Add1~17_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000001111001000100000111100100010000011110010001000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \memoriaRAM|ALT_INV_dado_out[7]~12_combout\,
	datac => \processador|ULA1|ALT_INV_Add1~17_sumout\,
	datad => \processador|decoderInstru|ALT_INV_Equal1~0_combout\,
	combout => \processador|ULA1|saida[7]~7_combout\);

\processador|REGA|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|ULA1|Add0~29_sumout\,
	asdata => \processador|ULA1|saida[7]~7_combout\,
	sload => \processador|decoderInstru|Equal1~1_combout\,
	ena => \processador|decoderInstru|saida[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|REGA|DOUT\(7));

\memoriaRAM|ram~24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(7),
	ena => \memoriaRAM|ram~89_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~24_q\);

\memoriaRAM|ram~64\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(7),
	ena => \memoriaRAM|ram~90_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~64_q\);

\memoriaRAM|ram~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|ram~85_combout\ = (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~1_combout\ & (\memoriaRAM|ram~24_q\)) # (\ROM1|memROM~1_combout\ & ((\memoriaRAM|ram~64_q\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010000010000010101000001000001010100000100000101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \ROM1|ALT_INV_memROM~1_combout\,
	datac => \memoriaRAM|ALT_INV_ram~24_q\,
	datad => \memoriaRAM|ALT_INV_ram~64_q\,
	combout => \memoriaRAM|ram~85_combout\);

\memoriaRAM|dado_out[7]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|dado_out[7]~12_combout\ = (!\processador|decoderInstru|saida[1]~1_combout\) # (\memoriaRAM|ram~85_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011101110111011101110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_saida[1]~1_combout\,
	datab => \memoriaRAM|ALT_INV_ram~85_combout\,
	combout => \memoriaRAM|dado_out[7]~12_combout\);

\processador|ULA1|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Add1~17_sumout\ = SUM(( (!\memoriaRAM|dado_out[7]~12_combout\) # (\processador|decoderInstru|Equal1~2_combout\) ) + ( \processador|REGA|DOUT\(7) ) + ( \processador|ULA1|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datad => \memoriaRAM|ALT_INV_dado_out[7]~12_combout\,
	dataf => \processador|REGA|ALT_INV_DOUT\(7),
	cin => \processador|ULA1|Add1~14\,
	sumout => \processador|ULA1|Add1~17_sumout\);

\processador|flipFlop|DOUT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|flipFlop|DOUT~0_combout\ = (!\ROM1|memROM~5_combout\ & (!\ROM1|memROM~9_combout\ & (\ROM1|memROM~10_combout\ & !\ROM1|memROM~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000010000000000000001000000000000000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~5_combout\,
	datab => \ROM1|ALT_INV_memROM~9_combout\,
	datac => \ROM1|ALT_INV_memROM~10_combout\,
	datad => \ROM1|ALT_INV_memROM~7_combout\,
	combout => \processador|flipFlop|DOUT~0_combout\);

\processador|ULA1|Equal2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Equal2~2_combout\ = ( !\processador|ULA1|Add1~5_sumout\ & ( (!\processador|ULA1|Add1~21_sumout\ & (!\processador|ULA1|Add1~25_sumout\ & (!\processador|ULA1|Add1~29_sumout\ & !\processador|ULA1|Add1~1_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|ULA1|ALT_INV_Add1~21_sumout\,
	datab => \processador|ULA1|ALT_INV_Add1~25_sumout\,
	datac => \processador|ULA1|ALT_INV_Add1~29_sumout\,
	datad => \processador|ULA1|ALT_INV_Add1~1_sumout\,
	datae => \processador|ULA1|ALT_INV_Add1~5_sumout\,
	combout => \processador|ULA1|Equal2~2_combout\);

\processador|flipFlop|DOUT~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|flipFlop|DOUT~1_combout\ = ( \processador|flipFlop|DOUT~0_combout\ & ( \processador|ULA1|Equal2~2_combout\ & ( (!\processador|ULA1|Add1~9_sumout\ & (!\processador|ULA1|Add1~13_sumout\ & !\processador|ULA1|Add1~17_sumout\)) ) ) ) # ( 
-- !\processador|flipFlop|DOUT~0_combout\ & ( \processador|ULA1|Equal2~2_combout\ & ( \processador|flipFlop|DOUT~q\ ) ) ) # ( !\processador|flipFlop|DOUT~0_combout\ & ( !\processador|ULA1|Equal2~2_combout\ & ( \processador|flipFlop|DOUT~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000000000000000000000111111111000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|ULA1|ALT_INV_Add1~9_sumout\,
	datab => \processador|ULA1|ALT_INV_Add1~13_sumout\,
	datac => \processador|ULA1|ALT_INV_Add1~17_sumout\,
	datad => \processador|flipFlop|ALT_INV_DOUT~q\,
	datae => \processador|flipFlop|ALT_INV_DOUT~0_combout\,
	dataf => \processador|ULA1|ALT_INV_Equal2~2_combout\,
	combout => \processador|flipFlop|DOUT~1_combout\);

\processador|flipFlop|DOUT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|flipFlop|DOUT~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|flipFlop|DOUT~q\);

\processador|MUXJMP|saida_MUX[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|saida_MUX[2]~0_combout\ = ( \processador|flipFlop|DOUT~q\ & ( (\ROM1|memROM~7_combout\ & ((!\ROM1|memROM~9_combout\ & (!\ROM1|memROM~5_combout\ & \ROM1|memROM~10_combout\)) # (\ROM1|memROM~9_combout\ & ((!\ROM1|memROM~10_combout\))))) 
-- ) ) # ( !\processador|flipFlop|DOUT~q\ & ( (!\ROM1|memROM~5_combout\ & (\ROM1|memROM~7_combout\ & (!\ROM1|memROM~9_combout\ $ (!\ROM1|memROM~10_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000101000000000000011100000000000001010000000000000111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~5_combout\,
	datab => \ROM1|ALT_INV_memROM~9_combout\,
	datac => \ROM1|ALT_INV_memROM~10_combout\,
	datad => \ROM1|ALT_INV_memROM~7_combout\,
	datae => \processador|flipFlop|ALT_INV_DOUT~q\,
	combout => \processador|MUXJMP|saida_MUX[2]~0_combout\);

\processador|incrementaPC|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|incrementaPC|Add0~9_sumout\ = SUM(( \processador|PC|DOUT\(2) ) + ( GND ) + ( \processador|incrementaPC|Add0~6\ ))
-- \processador|incrementaPC|Add0~10\ = CARRY(( \processador|PC|DOUT\(2) ) + ( GND ) + ( \processador|incrementaPC|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \processador|PC|ALT_INV_DOUT\(2),
	cin => \processador|incrementaPC|Add0~6\,
	sumout => \processador|incrementaPC|Add0~9_sumout\,
	cout => \processador|incrementaPC|Add0~10\);

\processador|MUXJMP|saida_MUX[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|saida_MUX[2]~3_combout\ = (!\ROM1|memROM~1_combout\ & (((!\processador|MUXJMP|saida_MUX[2]~0_combout\ & \processador|incrementaPC|Add0~9_sumout\)))) # (\ROM1|memROM~1_combout\ & (((!\processador|MUXJMP|saida_MUX[2]~0_combout\ & 
-- \processador|incrementaPC|Add0~9_sumout\)) # (\processador|MUXJMP|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111110001000100011111000100010001111100010001000111110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \processador|MUXJMP|ALT_INV_Equal1~0_combout\,
	datac => \processador|MUXJMP|ALT_INV_saida_MUX[2]~0_combout\,
	datad => \processador|incrementaPC|ALT_INV_Add0~9_sumout\,
	combout => \processador|MUXJMP|saida_MUX[2]~3_combout\);

\processador|PC|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|MUXJMP|saida_MUX[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|PC|DOUT\(2));

\processador|incrementaPC|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|incrementaPC|Add0~13_sumout\ = SUM(( \processador|PC|DOUT\(3) ) + ( GND ) + ( \processador|incrementaPC|Add0~10\ ))
-- \processador|incrementaPC|Add0~14\ = CARRY(( \processador|PC|DOUT\(3) ) + ( GND ) + ( \processador|incrementaPC|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \processador|PC|ALT_INV_DOUT\(3),
	cin => \processador|incrementaPC|Add0~10\,
	sumout => \processador|incrementaPC|Add0~13_sumout\,
	cout => \processador|incrementaPC|Add0~14\);

\processador|MUXJMP|saida_MUX[4]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|saida_MUX[4]~5_combout\ = (!\processador|MUXJMP|Equal1~0_combout\ & \processador|incrementaPC|Add0~17_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|MUXJMP|ALT_INV_Equal1~0_combout\,
	datab => \processador|incrementaPC|ALT_INV_Add0~17_sumout\,
	combout => \processador|MUXJMP|saida_MUX[4]~5_combout\);

\processador|PC|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|MUXJMP|saida_MUX[4]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|PC|DOUT\(4));

\ROM1|memROM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~1_combout\ = ( !\processador|PC|DOUT\(8) & ( \ROM1|memROM~0_combout\ & ( (!\processador|PC|DOUT\(4) & (!\processador|PC|DOUT\(5) & (!\processador|PC|DOUT\(6) & !\processador|PC|DOUT\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(4),
	datab => \processador|PC|ALT_INV_DOUT\(5),
	datac => \processador|PC|ALT_INV_DOUT\(6),
	datad => \processador|PC|ALT_INV_DOUT\(7),
	datae => \processador|PC|ALT_INV_DOUT\(8),
	dataf => \ROM1|ALT_INV_memROM~0_combout\,
	combout => \ROM1|memROM~1_combout\);

\processador|MUXJMP|saida_MUX[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|saida_MUX[0]~1_combout\ = (!\ROM1|memROM~1_combout\ & (\processador|incrementaPC|Add0~1_sumout\ & ((!\processador|MUXJMP|saida_MUX[2]~0_combout\)))) # (\ROM1|memROM~1_combout\ & (((\processador|incrementaPC|Add0~1_sumout\ & 
-- !\processador|MUXJMP|saida_MUX[2]~0_combout\)) # (\processador|MUXJMP|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011100000101001101110000010100110111000001010011011100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \processador|incrementaPC|ALT_INV_Add0~1_sumout\,
	datac => \processador|MUXJMP|ALT_INV_Equal1~0_combout\,
	datad => \processador|MUXJMP|ALT_INV_saida_MUX[2]~0_combout\,
	combout => \processador|MUXJMP|saida_MUX[0]~1_combout\);

\processador|PC|DOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|MUXJMP|saida_MUX[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|PC|DOUT\(0));

\ROM1|memROM~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~5_combout\ = (\processador|PC|DOUT\(0) & (\ROM1|memROM~2_combout\ & \ROM1|memROM~3_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(0),
	datab => \ROM1|ALT_INV_memROM~2_combout\,
	datac => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \ROM1|memROM~5_combout\);

\processador|MUXJMP|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|Equal1~0_combout\ = ( \processador|flipFlop|DOUT~q\ & ( (\ROM1|memROM~9_combout\ & (!\ROM1|memROM~10_combout\ & \ROM1|memROM~7_combout\)) ) ) # ( !\processador|flipFlop|DOUT~q\ & ( (!\ROM1|memROM~5_combout\ & (\ROM1|memROM~9_combout\ & 
-- (!\ROM1|memROM~10_combout\ & \ROM1|memROM~7_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000000000000011000000000000001000000000000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~5_combout\,
	datab => \ROM1|ALT_INV_memROM~9_combout\,
	datac => \ROM1|ALT_INV_memROM~10_combout\,
	datad => \ROM1|ALT_INV_memROM~7_combout\,
	datae => \processador|flipFlop|ALT_INV_DOUT~q\,
	combout => \processador|MUXJMP|Equal1~0_combout\);

\processador|MUXJMP|saida_MUX[3]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|MUXJMP|saida_MUX[3]~4_combout\ = (!\processador|MUXJMP|Equal1~0_combout\ & \processador|incrementaPC|Add0~13_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|MUXJMP|ALT_INV_Equal1~0_combout\,
	datab => \processador|incrementaPC|ALT_INV_Add0~13_sumout\,
	combout => \processador|MUXJMP|saida_MUX[3]~4_combout\);

\processador|PC|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|MUXJMP|saida_MUX[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|PC|DOUT\(3));

\processador|decoderInstru|Equal1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|decoderInstru|Equal1~2_combout\ = ( !\processador|PC|DOUT\(0) & ( (!\processador|PC|DOUT\(3) & (!\processador|PC|DOUT\(2) & (\ROM1|memROM~2_combout\ & !\processador|PC|DOUT\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000000000000000000001000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|PC|ALT_INV_DOUT\(3),
	datab => \processador|PC|ALT_INV_DOUT\(2),
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datad => \processador|PC|ALT_INV_DOUT\(1),
	datae => \processador|PC|ALT_INV_DOUT\(0),
	combout => \processador|decoderInstru|Equal1~2_combout\);

\processador|ULA1|saida[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|saida[0]~0_combout\ = ( \processador|decoderInstru|Equal1~0_combout\ & ( \processador|ULA1|Add1~21_sumout\ ) ) # ( !\processador|decoderInstru|Equal1~0_combout\ & ( (!\processador|decoderInstru|Equal1~2_combout\ & 
-- ((\memoriaRAM|dado_out[0]~13_combout\))) # (\processador|decoderInstru|Equal1~2_combout\ & (\ROM1|memROM~1_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000000001111111100011011000110110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|decoderInstru|ALT_INV_Equal1~2_combout\,
	datab => \ROM1|ALT_INV_memROM~1_combout\,
	datac => \memoriaRAM|ALT_INV_dado_out[0]~13_combout\,
	datad => \processador|ULA1|ALT_INV_Add1~21_sumout\,
	datae => \processador|decoderInstru|ALT_INV_Equal1~0_combout\,
	combout => \processador|ULA1|saida[0]~0_combout\);

\processador|REGA|DOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|ULA1|Add0~1_sumout\,
	asdata => \processador|ULA1|saida[0]~0_combout\,
	sload => \processador|decoderInstru|Equal1~1_combout\,
	ena => \processador|decoderInstru|saida[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \processador|REGA|DOUT\(0));

\memoriaRAM|ram~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \processador|REGA|DOUT\(0),
	ena => \memoriaRAM|ram~89_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoriaRAM|ram~17_q\);

\memoriaRAM|ram~86\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|ram~86_combout\ = (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~1_combout\ & (\memoriaRAM|ram~17_q\)) # (\ROM1|memROM~1_combout\ & ((\memoriaRAM|ram~57_q\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001001100010000000100110001000000010011000100000001001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \memoriaRAM|ALT_INV_ram~17_q\,
	datab => \ROM1|ALT_INV_memROM~4_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \memoriaRAM|ALT_INV_ram~57_q\,
	combout => \memoriaRAM|ram~86_combout\);

\memoriaRAM|ram~87\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|ram~87_combout\ = (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~1_combout\ & (\memoriaRAM|ram~18_q\)) # (\ROM1|memROM~1_combout\ & ((\memoriaRAM|ram~58_q\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010000010000010101000001000001010100000100000101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \ROM1|ALT_INV_memROM~1_combout\,
	datac => \memoriaRAM|ALT_INV_ram~18_q\,
	datad => \memoriaRAM|ALT_INV_ram~58_q\,
	combout => \memoriaRAM|ram~87_combout\);

\memoriaRAM|ram~88\ : cyclonev_lcell_comb
-- Equation(s):
-- \memoriaRAM|ram~88_combout\ = (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~1_combout\ & (\memoriaRAM|ram~19_q\)) # (\ROM1|memROM~1_combout\ & ((\memoriaRAM|ram~59_q\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010000010000010101000001000001010100000100000101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \ROM1|ALT_INV_memROM~1_combout\,
	datac => \memoriaRAM|ALT_INV_ram~19_q\,
	datad => \memoriaRAM|ALT_INV_ram~59_q\,
	combout => \memoriaRAM|ram~88_combout\);

\processador|ULA1|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Equal2~0_combout\ = (!\processador|ULA1|Add1~21_sumout\ & (!\processador|ULA1|Add1~25_sumout\ & !\processador|ULA1|Add1~29_sumout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|ULA1|ALT_INV_Add1~21_sumout\,
	datab => \processador|ULA1|ALT_INV_Add1~25_sumout\,
	datac => \processador|ULA1|ALT_INV_Add1~29_sumout\,
	combout => \processador|ULA1|Equal2~0_combout\);

\processador|ULA1|Equal2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \processador|ULA1|Equal2~1_combout\ = ( !\processador|ULA1|Add1~17_sumout\ & ( \processador|ULA1|Equal2~0_combout\ & ( (!\processador|ULA1|Add1~1_sumout\ & (!\processador|ULA1|Add1~5_sumout\ & (!\processador|ULA1|Add1~9_sumout\ & 
-- !\processador|ULA1|Add1~13_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \processador|ULA1|ALT_INV_Add1~1_sumout\,
	datab => \processador|ULA1|ALT_INV_Add1~5_sumout\,
	datac => \processador|ULA1|ALT_INV_Add1~9_sumout\,
	datad => \processador|ULA1|ALT_INV_Add1~13_sumout\,
	datae => \processador|ULA1|ALT_INV_Add1~17_sumout\,
	dataf => \processador|ULA1|ALT_INV_Equal2~0_combout\,
	combout => \processador|ULA1|Equal2~1_combout\);

\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

\SW[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

\SW[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

\KEY[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

\KEY[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

\FPGA_RESET_N~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FPGA_RESET_N,
	o => \FPGA_RESET_N~input_o\);

\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

\SW[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

\SW[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

\SW[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

\SW[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(8) <= \LEDR[8]~output_o\;

ww_LEDR(9) <= \LEDR[9]~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX5(0) <= \HEX5[0]~output_o\;

ww_HEX5(1) <= \HEX5[1]~output_o\;

ww_HEX5(2) <= \HEX5[2]~output_o\;

ww_HEX5(3) <= \HEX5[3]~output_o\;

ww_HEX5(4) <= \HEX5[4]~output_o\;

ww_HEX5(5) <= \HEX5[5]~output_o\;

ww_HEX5(6) <= \HEX5[6]~output_o\;

ww_DATA_IN(0) <= \DATA_IN[0]~output_o\;

ww_DATA_IN(1) <= \DATA_IN[1]~output_o\;

ww_DATA_IN(2) <= \DATA_IN[2]~output_o\;

ww_DATA_IN(3) <= \DATA_IN[3]~output_o\;

ww_DATA_IN(4) <= \DATA_IN[4]~output_o\;

ww_DATA_IN(5) <= \DATA_IN[5]~output_o\;

ww_DATA_IN(6) <= \DATA_IN[6]~output_o\;

ww_DATA_IN(7) <= \DATA_IN[7]~output_o\;

ww_DATA_OUT(0) <= \DATA_OUT[0]~output_o\;

ww_DATA_OUT(1) <= \DATA_OUT[1]~output_o\;

ww_DATA_OUT(2) <= \DATA_OUT[2]~output_o\;

ww_DATA_OUT(3) <= \DATA_OUT[3]~output_o\;

ww_DATA_OUT(4) <= \DATA_OUT[4]~output_o\;

ww_DATA_OUT(5) <= \DATA_OUT[5]~output_o\;

ww_DATA_OUT(6) <= \DATA_OUT[6]~output_o\;

ww_DATA_OUT(7) <= \DATA_OUT[7]~output_o\;

ww_Instruction_IN(0) <= \Instruction_IN[0]~output_o\;

ww_Instruction_IN(1) <= \Instruction_IN[1]~output_o\;

ww_Instruction_IN(2) <= \Instruction_IN[2]~output_o\;

ww_Instruction_IN(3) <= \Instruction_IN[3]~output_o\;

ww_Instruction_IN(4) <= \Instruction_IN[4]~output_o\;

ww_Instruction_IN(5) <= \Instruction_IN[5]~output_o\;

ww_Instruction_IN(6) <= \Instruction_IN[6]~output_o\;

ww_Instruction_IN(7) <= \Instruction_IN[7]~output_o\;

ww_Instruction_IN(8) <= \Instruction_IN[8]~output_o\;

ww_Instruction_IN(9) <= \Instruction_IN[9]~output_o\;

ww_Instruction_IN(10) <= \Instruction_IN[10]~output_o\;

ww_Instruction_IN(11) <= \Instruction_IN[11]~output_o\;

ww_Instruction_IN(12) <= \Instruction_IN[12]~output_o\;

ww_ROM_Address(0) <= \ROM_Address[0]~output_o\;

ww_ROM_Address(1) <= \ROM_Address[1]~output_o\;

ww_ROM_Address(2) <= \ROM_Address[2]~output_o\;

ww_ROM_Address(3) <= \ROM_Address[3]~output_o\;

ww_ROM_Address(4) <= \ROM_Address[4]~output_o\;

ww_ROM_Address(5) <= \ROM_Address[5]~output_o\;

ww_ROM_Address(6) <= \ROM_Address[6]~output_o\;

ww_ROM_Address(7) <= \ROM_Address[7]~output_o\;

ww_ROM_Address(8) <= \ROM_Address[8]~output_o\;

ww_flag_ff <= \flag_ff~output_o\;
END structure;


