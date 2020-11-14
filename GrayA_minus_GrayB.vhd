-- Team Number 7
-- Vishal Mansuria, Sean McCray 
-- vpm5113@psu.edu, smm7442@psu.edu
-- GrayA_minus_GrayB.vhd
-- Version 1.0 , 10/4/2020

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;
        
entity GrayA_minus_GrayB is 
 port(
	CLK : in  std_logic;
	A, B: in std_logic_vector(3 downto 0);

	dif : out std_logic_vector(7 downto 0));
       
end GrayA_minus_GrayB;
        
architecture behavior of GrayA_minus_GrayB is  

signal tempA : std_logic_vector(7 downto 0);
signal tempB : std_logic_vector(7 downto 0);
signal temp : std_logic_vector(7 downto 0);

begin

 REG: process (CLK) 
		 begin   
tempA <= "0000" & A;
tempB <= "0000" & B;
			 if (CLK'event and CLK='1') then
                 tempA(3) <= A(3);
                 tempA(2) <= A(3) XOR A(2);
                 tempA(1) <= A(2) XOR A(1);
                 tempA(0) <= A(1) XOR A(0);
                 
                 tempB(3) <= B(3);
                 tempB(2) <= B(3) XOR B(2);
                 tempB(1) <= B(2) XOR B(1);
                 tempB(0) <= B(1) XOR B(0);
					temp <= tempA - tempB;
			 end if;
			 
		end process; 
		 
	dif <= temp;
    
end behavior;
