-- Team Number 7
-- Vishal Mansuria, Sean McCray 
-- vpm5113@psu.edu, smm7442@psu.edu
-- Gray_A_plus_B.vhd
-- Version 1.0 , 10/4/2020

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;
        
entity Gray_A_plus_B is 
 port(
	CLK : in  std_logic;
	A, B: in std_logic_vector(3 downto 0);

	sum2 : out std_logic_vector(7 downto 0));
       
end Gray_A_plus_B;
        
architecture behavior of Gray_A_plus_B is  

signal tempG : std_logic_vector(7 downto 0);
signal temp : std_logic_vector(7 downto 0);

begin


 REG: process (CLK) 
		 begin   			 
			 if (CLK'event and CLK='1') then 
				temp <= ("0000" & A) + ("0000" & B);
                tempG(7) <= temp(7);
				tempG(6) <= temp(7) XOR temp(6);
				tempG(5) <= temp(6) XOR temp(5);
				tempG(4) <= temp(5) XOR temp(4);
				tempG(3) <= temp(4) XOR temp(3);
                tempG(2) <= temp(3) XOR temp(2);
                tempG(1) <= temp(2) XOR temp(1);
                tempG(0) <= temp(1) XOR temp(0);
			 end if;
			 
		end process; 
		 
	sum2 <= tempG;
    
end behavior;
