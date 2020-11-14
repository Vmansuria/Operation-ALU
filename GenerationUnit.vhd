-- Team Number 7
-- Vishal Mansuria, Sean McCray 
-- vpm5113@psu.edu, smm7442@psu.edu
-- GenerationUnit.vhd
-- Version 1.0 , 10/4/2020

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity GenerationUnit is
Port (
    
	CLK_in, RST_Global_in, EN_in : in std_logic;
	RST_in : in std_logic_vector(3 downto 0);
	DIR_in : in std_logic_vector(6 downto 0);

	Prime_out, Odd_out, Even_out, Counter_out, Ring_out, Johnson_out, Gray_out : out std_logic_vector(3 downto 0));

    
end GenerationUnit;
 
architecture Structural of GenerationUnit is
 

component PrimeGenerator
port(

    CLK, RST_Global, EN : in  std_logic;
	RST : in std_logic_vector(3 downto 0);
	DIR : in std_logic_vector(6 downto 0);
      
		Q : out std_logic_vector(3 downto 0)

    );

end component;

component OddGenerator
port(

    CLK, RST_Global, EN : in  std_logic;
	RST : in std_logic_vector(3 downto 0);
	DIR : in std_logic_vector(6 downto 0);

	Q : out std_logic_vector(3 downto 0)

    );

end component;

component EvenGenerator
port(

    CLK, RST_Global, EN : in  std_logic;
	RST : in std_logic_vector(3 downto 0);
	DIR : in std_logic_vector(6 downto 0);

	Q : out std_logic_vector(3 downto 0)

    );

end component;


component BinaryCounter
port(

    CLK, RST_Global, EN : in  std_logic;
	RST : in std_logic_vector(3 downto 0);
	DIR : in std_logic_vector(6 downto 0);
	
	Q : out std_logic_vector(3 downto 0)

    );

end component;

component Register_4bits_BiDirectionalRing
port(
		CLK, RST_Global, EN : in  std_logic;
		RST : in std_logic_vector(3 downto 0);
		DIR : in std_logic_vector(6 downto 0);
		
		dout         : out std_logic_vector(3 downto 0)

	);
end component;

component Register_4bits_BiDirectionalJohnsonCounter
port(
		CLK, RST_Global, EN : in  std_logic;
		RST : in std_logic_vector(3 downto 0);
		DIR : in std_logic_vector(6 downto 0);
		
		dout         : out std_logic_vector(3 downto 0)

	);
end component;

component GrayCounter
port(
	CLK, RST_Global, EN : in  std_logic;
	RST : in std_logic_vector(3 downto 0);
	DIR : in std_logic_vector(6 downto 0);

	Q : out std_logic_vector(3 downto 0)

	);
end component;

 
begin
 
-- Port Mapping of the 7 generators

GU0: PrimeGenerator port map(CLK_in,RST_Global_in,EN_in,RST_in,DIR_in,Prime_out);
GU1: OddGenerator port map(CLK_in,RST_Global_in,EN_in,RST_in,DIR_in,Odd_out);
GU2: EvenGenerator port map(CLK_in,RST_Global_in,EN_in,RST_in,DIR_in,Even_out);
GU3: BinaryCounter port map(CLK_in,RST_Global_in,EN_in,RST_in,DIR_in,Counter_out);
GU4: Register_4bits_BiDirectionalRing port map(CLK_in,RST_Global_in,EN_in,RST_in,DIR_in,Ring_out);
GU5: Register_4bits_BiDirectionalJohnsonCounter port map (CLK_in,RST_Global_in,EN_in,RST_in,DIR_in,Johnson_out);
GU6: GrayCounter port map (CLK_in,RST_Global_in,EN_in,RST_in,DIR_in,Gray_out);

 
end Structural;


