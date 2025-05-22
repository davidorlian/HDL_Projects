library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity ADDER_32_BIT is
port
(
	A:     in  std_logic_vector(31 downto 0);
	B:     in  std_logic_vector(31 downto 0);
	C_IN:  in  std_logic;       
	O:	   out std_logic_vector(31 downto 0);
	C_OUT: out std_logic
);
end ADDER_32_BIT;

architecture ADDER_32_BIT_ARC of ADDER_32_BIT is

	component ADDER_8_BIT_CIN is
	port
	(
		A:     in  std_logic_vector(7 downto 0);
		B:     in  std_logic_vector(7 downto 0);
		C_IN:  in  std_logic;
		O:	   out std_logic_vector(7 downto 0);
		C_OUT: out std_logic
	);
	end component;
		
	signal C_IN_1: std_logic;
	signal C_IN_2: std_logic;
	signal C_IN_3: std_logic;
	
	begin
	
	P1: ADDER_8_BIT_CIN port map (A(7  downto 0 ), B(7  downto 0 ), C_IN,   O(7  downto 0 ), C_IN_1);
	P2: ADDER_8_BIT_CIN port map (A(15 downto 8 ), B(15 downto 8 ), C_IN_1, O(15 downto 8 ), C_IN_2);
	P3: ADDER_8_BIT_CIN port map (A(23 downto 16), B(23 downto 16), C_IN_2, O(23 downto 16), C_IN_3);
	P4: ADDER_8_BIT_CIN port map (A(31 downto 24), B(31 downto 24), C_IN_3, O(31 downto 24), C_OUT );

end ADDER_32_BIT_ARC;