-- Team Number 7
-- Vishal Mansuria, Sean McCray 
-- vpm5113@psu.edu, smm7442@psu.edu
-- Accumulator.vhd
-- Version 1.0 , 10/4/2020

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;
        
entity A_accumulator is 
 port(
	CLK : in  std_logic;
	A: in std_logic_vector(3 downto 0);

	Accumulation : out std_logic_vector(7 downto 0));
       
end A_accumulator;
        
architecture behavior of A_accumulator is  

   
signal temp : std_logic_vector(7 downto 0);
signal reg0  : std_logic_vector(7 downto 0);
signal reg1  : std_logic_vector(7 downto 0);
signal reg2  : std_logic_vector(7 downto 0);
signal reg3  : std_logic_vector(7 downto 0);
signal reg4  : std_logic_vector(7 downto 0);
signal reg5  : std_logic_vector(7 downto 0);

begin

 REG: process (CLK) 
		 begin   
			 
			 if (CLK'event and CLK='1') then 
			    reg0 <= "0000" & A;
                reg1 <= reg0;
                reg2 <= reg1;
                reg3 <= reg2;
                reg4 <= reg3;
                reg5 <= reg4;
               
                temp <= (temp+A) - reg5;
                
			 end if;
			 
		end process; 
		 
	Accumulation <= temp;
    
end behavior;
