-- Team Number 7
-- Vishal Mansuria, Sean McCray 
-- vpm5113@psu.edu, smm7442@psu.edu
-- Register_4bits_BiDirectionalRing.vhd
-- Version 1.0 , 10/4/2020

library IEEE;
use IEEE.std_logic_1164.all;

entity Register_4bits_BiDirectionalRing is
	port(
		-- this register has ACTIVE HIGH Enable
		--clr, ce, clk, LoadOrShift, Dir : in  std_logic;
		--data_in         : in  std_logic_vector(3 downto 0);
		--dout         : out std_logic_vector(3 downto 0)
		CLK, RST_Global, EN : in  std_logic;
		RST : in std_logic_vector(3 downto 0);
		DIR : in std_logic_vector(6 downto 0);
		
		dout         : out std_logic_vector(3 downto 0)
	);
end entity Register_4bits_BiDirectionalRing;

architecture Behavioral of Register_4bits_BiDirectionalRing is
signal Q : std_logic_vector(3 downto 0) := "0001";
--signal data_in : std_logic_vector(3 downto 0);



begin

--Q <= "0001";

	process(CLK) 
	begin
		if (CLK'event and CLK='1') then
     				
				if (RST_Global = '1' OR RST(3) ='1') then
		  		    Q <= "0001";
				
                else 
                    if EN = '1' then
                
				        if (DIR(4) = '0') then 
				    
					       Q(3 downto 1) <= Q(2 downto 0);
					       Q(0) <=  Q(3);		
					       	                   	
				        elsif (DIR(4) = '1') then
				    					
					       Q(2 downto 0) <= Q(3 downto 1);
					       Q(3) <=  Q(0);						
				        end if;				
				    end if;
			
				
		 	    end if;
		end if;
        
	end process;
	
	 dout <= Q;
end Behavioral;
