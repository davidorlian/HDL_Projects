library IEEE;
    use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	
entity DECODER_4X32 is
port
(
	ENABLE: in std_logic;
	SEL:	in std_logic_vector(3  downto 0);
	Y0,  Y1,  Y2,  Y3,  Y4,  Y5,  Y6,  Y7,
	Y8,  Y9,  Y10, Y11, Y12, Y13, Y14, Y15,
	Y16, Y17, Y18, Y19, Y20, Y21, Y22, Y23,
	Y24, Y25, Y26, Y27, Y28, Y29, Y30, Y31 : out std_logic
);
end DECODER_4X32;

architecture DECODER_4X32_ARC of DECODER_4X32 is

	component DECODER_4x16 is
	port
	(
		ENABLE:  in  std_logic;
		SEL:	 in  std_logic_vector(3  downto 0);
		Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15: out std_logic
	);
	end component;
	
	signal NOT_ENABLE: std_logic;
	
	begin
	
	NOT_ENABLE <= not ENABLE;
	
	P1: DECODER_4x16 port map (ENABLE,     SEL, Y0,  Y1,  Y2,  Y3,  Y4,  Y5,  Y6,  Y7,  Y8,  Y9,  Y10, Y11, Y12, Y13, Y14, Y15);
	P2: DECODER_4x16 port map (NOT_ENABLE, SEL, Y16, Y17, Y18, Y19, Y20, Y21, Y22, Y23, Y24, Y25, Y26, Y27, Y28, Y29, Y30, Y31);
	
end DECODER_4X32_ARC;