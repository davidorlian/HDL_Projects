library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity INCREMENTER_8_BIT is
port
(
	A: in  std_logic_vector(7 downto 0);
	O: out std_logic_vector(7 downto 0);
	C: out std_logic
);
end INCREMENTER_8_BIT;

architecture INCREMENTER_8_BIT_ARC of INCREMENTER_8_BIT is

	component HALF_ADDER is
	port
	(
		A: in  std_logic;
		B: in  std_logic;
		O: out std_logic;
		C: out std_logic
	);
	end component;
	
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
    signal B:      std_logic := '1';
    signal NOT_B:  std_logic := '0';
    
    begin
    
    P1: HALF_ADDER port map (A(0), B, O(0), C_IN_1);
    P2: FULL_ADDER port map (A(1), NOT_B, C_IN_1, O(1), C_IN_2);
    P3: FULL_ADDER port map (A(2), NOT_B, C_IN_2, O(2), C_IN_3);
    P4: FULL_ADDER port map (A(3), NOT_B, C_IN_3, O(3), C_IN_4);
    P5: FULL_ADDER port map (A(4), NOT_B, C_IN_4, O(4), C_IN_5);
    P6: FULL_ADDER port map (A(5), NOT_B, C_IN_5, O(5), C_IN_6);
    P7: FULL_ADDER port map (A(6), NOT_B, C_IN_6, O(6), C_IN_7);
    P8: FULL_ADDER port map (A(7), NOT_B, C_IN_7, O(7), C);
	
end INCREMENTER_8_BIT_ARC;