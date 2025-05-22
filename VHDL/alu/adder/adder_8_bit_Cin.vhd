library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity ADDER_8_BIT_CIN is
port
(
	A:     in  std_logic_vector(7 downto 0);
	B:     in  std_logic_vector(7 downto 0);
	C_IN:  in  std_logic;
	O:	   out std_logic_vector(7 downto 0);
	C_OUT: out std_logic
);
end ADDER_8_BIT_CIN;

architecture ADDER_8_BIT_CIN_ARC of ADDER_8_BIT_CIN is
	
	component FULL_ADDER is
	port
	(
		A:     in  std_logic;
		B:     in  std_logic;
		C_IN:  in  std_logic;
		O:     out std_logic;
		C_OUT: out std_logic
	);
	end component;
	
	signal C_IN_1: std_logic;
	signal C_IN_2: std_logic;
	signal C_IN_3: std_logic;
	signal C_IN_4: std_logic;
	signal C_IN_5: std_logic;
	signal C_IN_6: std_logic;
	signal C_IN_7: std_logic;
	
	begin
	
	P1: FULL_ADDER port map (A(0), B(0), C_IN,   O(0), C_IN_1);
	P2: FULL_ADDER port map (A(1), B(1), C_IN_1, O(1), C_IN_2);
	P3: FULL_ADDER port map (A(2), B(2), C_IN_2, O(2), C_IN_3);
	P4: FULL_ADDER port map (A(3), B(3), C_IN_3, O(3), C_IN_4);
	P5: FULL_ADDER port map (A(4), B(4), C_IN_4, O(4), C_IN_5);
	P6: FULL_ADDER port map (A(5), B(5), C_IN_5, O(5), C_IN_6);
	P7: FULL_ADDER port map (A(6), B(6), C_IN_6, O(6), C_IN_7);
	P8: FULL_ADDER port map (A(7), B(7), C_IN_7, O(7), C_OUT );

end ADDER_8_BIT_CIN_ARC;