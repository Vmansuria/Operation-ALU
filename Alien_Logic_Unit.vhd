-- Team Number 7
-- Vishal Mansuria, Sean McCray 
-- vpm5113@psu.edu, smm7442@psu.edu
-- Alien_Logic_Unit.vhd
-- Version 1.0 , 10/4/2020

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity Alien_Logic_Unit is
port(
	Data_Control : in std_logic_vector(7 downto 0);
	S0_Ext,S1_Ext: in STD_LOGIC;
	Rst_Ext : in std_logic_vector(3 downto 0);
	Global_RST_Ext : in std_logic;
	CLK : in std_logic;

	
	DP_Ext : out std_logic;
	An_Ext : out std_logic_vector(3 downto 0);
	Ca_Ext : out std_logic_vector(6  downto 0)
	);
end Alien_Logic_Unit;

architecture structural of Alien_Logic_Unit is

component ClockDividerExternal
port(
	clock : in std_logic;
    RSET : in std_logic;
    s_out : out std_logic

);
end component;

component Alien_ALU
port(
	CLK_in : in  std_logic;
	A_in, B_in: in std_logic_vector(3 downto 0);
	
	Accumulator_out, GrayA_plus_GrayB_out, Gray_A_plus_B_out, GrayA_minus_GrayB_out : out std_logic_vector(7 downto 0);
	Gray_A_minus_B_out : out std_logic_vector(3 downto 0)

);
end component;

component GenerationUnit
port(
	CLK_in, RST_Global_in, EN_in : in std_logic;
	RST_in : in std_logic_vector(3 downto 0);
	DIR_in : in std_logic_vector(6 downto 0);

	Prime_out, Odd_out, Even_out, Counter_out, Ring_out, Johnson_out, Gray_out : out std_logic_vector(3 downto 0)

);
end component;

component mux_4to1
port(
	A,B,C,D : in STD_LOGIC_VECTOR(15 downto 0);
     S0,S1: in STD_LOGIC;
     Z: out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component Sequential_7Segments_Decoder
port(
	value : in std_logic_vector(15 downto 0);
	RESET: in std_logic;
	clk : in std_logic;
	dp : out std_logic;
	channels : out std_logic_vector(3 downto 0);
	    segs : out std_logic_vector(6 downto 0)
);
end component;

signal Prime_Internal, Odd_Internal, Even_Internal, Counter_Interal, Ring_Internal, Johnson_Internal, Gray_Internal, Gray_A_minus_B_Internal : std_logic_vector(3 downto 0);
signal Accumulator_Internal, GrayA_plus_GrayB_Internal, Gray_A_plus_B_Internal, GrayA_minus_GrayB_Internal : std_logic_vector(7 downto 0);
signal subclk : std_logic;
signal muxdata : std_logic_vector(15 downto 0);

begin

CLKDIV: ClockDividerExternal port map(clock=>CLK, RSET=>'0', s_out=>subclk);
Alien: Alien_ALU port map(CLK_in=>subclk, A_in=>Data_Control(7 downto 4), B_in=>Data_Control(3 downto 0), Accumulator_out=>Accumulator_Internal, GrayA_plus_GrayB_out=>GrayA_plus_GrayB_Internal, Gray_A_plus_B_out=>Gray_A_plus_B_Internal, GrayA_minus_GrayB_out=>GrayA_minus_GrayB_Internal, Gray_A_minus_B_out=>Gray_A_minus_B_Internal);
GENUNIT: GenerationUnit port map(CLK_in=>subclk, RST_Global_in=>Global_RST_Ext, EN_in=>Data_Control(7), RST_in=>Rst_Ext, DIR_in=>Data_Control(6 downto 0), Prime_out=>Prime_Internal, Odd_out=>Odd_Internal, Even_out=>Even_Internal, Counter_out=>Counter_Interal, Ring_out=>Ring_Internal,Johnson_out=>Johnson_Internal, Gray_out=>Gray_Internal);
MUX: mux_4to1 port map(A(7 downto 0)=>Accumulator_Internal, A(15 downto 8)=>GrayA_plus_GrayB_Internal, B(7 downto 0)=>Gray_A_plus_B_Internal, B(15 downto 8)=>GrayA_minus_GrayB_Internal,C(3 downto 0)=>Gray_A_minus_B_Internal, C(7 downto 4)=>Prime_Internal, C(11 downto 8)=>Odd_Internal, C(15 downto 12)=>Even_Internal, D(3 downto 0)=>Counter_Interal, D(7 downto 4)=>Ring_Internal, D(11 downto 8)=>Johnson_Internal, D(15 downto 12)=>Gray_Internal, S0=>S0_Ext, S1=>S1_Ext, Z=>muxdata);
Displaycontroller: Sequential_7Segments_Decoder port map(value(15 downto 12)=>muxdata(15 downto 12), value(11 downto 8)=>muxdata(11 downto 8), value(7 downto 4)=>muxdata(7 downto 4), value(3 downto 0)=>muxdata(3 downto 0), RESET => '0', clk => CLK, dp => DP_Ext, channels => An_Ext, segs => Ca_Ext);

end structural;
