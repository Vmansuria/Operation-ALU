-- Team Number 7
-- Vishal Mansuria, Sean McCray 
-- vpm5113@psu.edu, smm7442@psu.edu
-- Gray_A_minus_B.vhd
-- Version 1.0 , 10/4/2020

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;
        
entity Gray_A_minus_B is 
 port(
	CLK : in  std_logic;
	A, B: in std_logic_vector(3 downto 0);

	dif2 : out std_logic_vector(3 downto 0));
       
end Gray_A_minus_B;
        
architecture behavior of Gray_A_minus_B is  

signal tempG : std_logic_vector(3 downto 0);
signal temp : std_logic_vector(3 downto 0);

begin


 REG: process (CLK) 
		 begin   
			 
			 if (CLK'event and CLK='1') then 
				temp <= A-B;
                tempG(3) <= temp(3);
				tempG(2) <= temp(3) XOR temp(2);
				tempG(1) <= temp(2) XOR temp(1);
				tempG(0) <= temp(1) XOR temp(0);
			 end if;
			 
		end process; 
		 
	dif2 <= tempG;
    
end behavior;
