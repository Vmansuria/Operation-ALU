-- Team Number 7
-- Vishal Mansuria, Sean McCray 
-- vpm5113@psu.edu, smm7442@psu.edu
-- Alien_ALU.vhd
-- Version 1.0 , 10/4/2020

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;
        
entity Alien_ALU is 
 port(
	CLK_in : in  std_logic;
	A_in, B_in: in std_logic_vector(3 downto 0);
	
	Accumulator_out, GrayA_plus_GrayB_out, Gray_A_plus_B_out, GrayA_minus_GrayB_out : out std_logic_vector(7 downto 0);
	Gray_A_minus_B_out : out std_logic_vector(3 downto 0)
	);
end Alien_ALU;

architecture Structural of Alien_ALU is

component A_accumulator
port(
	CLK : in  std_logic;
	A: in std_logic_vector(3 downto 0);

	Accumulation : out std_logic_vector(7 downto 0)
);
end component;

component GrayA_plus_GrayB
 port(
	CLK : in  std_logic;
	A, B: in std_logic_vector(3 downto 0);

	sum : out std_logic_vector(7 downto 0));
       
end component;

component Gray_A_plus_B is 
 port(
	CLK : in  std_logic;
	A, B: in std_logic_vector(3 downto 0);

	sum2 : out std_logic_vector(7 downto 0));
       
end component;

component GrayA_minus_GrayB is 
 port(
	CLK : in  std_logic;
	A, B: in std_logic_vector(3 downto 0);

	dif : out std_logic_vector(7 downto 0));
       
end component;

component Gray_A_minus_B is 
 port(
	CLK : in  std_logic;
	A, B: in std_logic_vector(3 downto 0);

	dif2 : out std_logic_vector(3 downto 0));
       
end component;

begin

--Port Mapping of the Alien_ALU
AU0: A_Accumulator port map(CLK_in, A_in, Accumulator_out);
AU1: GrayA_plus_GrayB port map(CLK_in, A_in, B_in, GrayA_plus_GrayB_out);
AU2: Gray_A_plus_B port map(CLK_in, A_in, B_in, Gray_A_plus_B_out);
AU3: GrayA_minus_GrayB port map(CLK_in, A_in, B_in, GrayA_minus_GrayB_out);
AU4: Gray_A_minus_B port map(CLK_in, A_in, B_in, Gray_A_minus_B_out);

end Structural;