library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;

entity MUX821 is
port
(
	SEL: in  std_logic_vector(2 downto 0);
	A:	 in  std_logic;
	B:	 in  std_logic;
	C:	 in  std_logic;
	D:	 in  std_logic;
	E:	 in  std_logic;
	F:	 in  std_logic;
	G:	 in  std_logic;
	H:	 in  std_logic;
	Y:	 out std_logic
);	
end MUX821;

architecture MUX821_ARC of MUX821 is
	
	component MUX421 is
	port
	(
		SEL: in	 std_logic_vector(1 downto 0);
		A:	 in	 std_logic;
		B:	 in	 std_logic;
		C:	 in	 std_logic;
		D:	 in	 std_logic;
		Y:	 out std_logic
	);
	end component;
	
	component MUX221 is
	port
	(
		SEL: in	 std_logic;
		A:	 in	 std_logic;
		B:	 in	 std_logic;
		Y:	 out std_logic
	);
	end component;
	
	signal OUT41: std_logic;
	signal OUT42: std_logic;

	begin
	P1: MUX421 port map (SEL(1 downto 0), A, B, C, D, OUT41);
	P2: MUX421 port map (SEL(1 downto 0), E, F, G, H, OUT42);
	P3: MUX221 port map (SEL(2), OUT41, OUT42, Y);
	
end MUX821_ARC;