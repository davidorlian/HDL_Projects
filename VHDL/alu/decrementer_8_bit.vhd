library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity DECREMENTER_8_BIT is
port
(
	X: in  std_logic_vector(7 downto 0);
	D: out std_logic_vector(7 downto 0);
	B: out std_logic
);
end DECREMENTER_8_BIT;

architecture DECREMENTER_8_BIT_ARC of DECREMENTER_8_BIT is

	component HALF_SUBTRACTOR is
	port
	(
		X: in  std_logic;
		Y: in  std_logic;
		D: out std_logic;
		B: out std_logic
	);
	end component;
	
	component FULL_SUBTRACTOR is
	port
	(
		X:     in  std_logic;
		Y:     in  std_logic;
		B_IN:  in  std_logic;
		D:     out std_logic;
		B_OUT: out std_logic
	);
	end component;
	
	signal B_IN_1: std_logic;
	signal B_IN_2: std_logic;
	signal B_IN_3: std_logic;
	signal B_IN_4: std_logic;
	signal B_IN_5: std_logic;
	signal B_IN_6: std_logic;
	signal B_IN_7: std_logic;
    signal Y:      std_logic := '1';
    signal NOT_Y:  std_logic := '0';
    
    begin
    
    P1: HALF_SUBTRACTOR port map (X(0), Y, D(0), B_IN_1);
    P2: FULL_SUBTRACTOR port map (X(1), NOT_Y, B_IN_1, D(1), B_IN_2);
    P3: FULL_SUBTRACTOR port map (X(2), NOT_Y, B_IN_2, D(2), B_IN_3);
    P4: FULL_SUBTRACTOR port map (X(3), NOT_Y, B_IN_3, D(3), B_IN_4);
    P5: FULL_SUBTRACTOR port map (X(4), NOT_Y, B_IN_4, D(4), B_IN_5);
    P6: FULL_SUBTRACTOR port map (X(5), NOT_Y, B_IN_5, D(5), B_IN_6);
    P7: FULL_SUBTRACTOR port map (X(6), NOT_Y, B_IN_6, D(6), B_IN_7);
    P8: FULL_SUBTRACTOR port map (X(7), NOT_Y, B_IN_7, D(7), B);
	
end DECREMENTER_8_BIT_ARC;