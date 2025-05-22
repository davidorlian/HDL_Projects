library IEEE;
    use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity TB_DECODER_4x16 is
end TB_DECODER_4x16;

architecture TB_DECODER_4x16_ARC of TB_DECODER_4x16 is

	component DECODER_4x16
	port
	(
		ENABLE:  in  std_logic;
		SEL:	 in  std_logic_vector(3  downto 0);
		Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15: out std_logic
	);
	end component;

	signal tbENABLE:  std_logic;
	signal tbSEL:     std_logic_vector(3  downto 0) := "0000";
	signal tbY0, tbY1, tbY2, tbY3, tbY4, tbY5, tbY6, tbY7, tbY8, tbY9, tbY10, tbY11, tbY12, tbY13, tbY14, tbY15: std_logic;

	begin
	DUT: DECODER_4x16
	port map
	(
		ENABLE  => tbENABLE,
		SEL	    => tbSEL,
		Y0  => tbY0,
		Y1  => tbY1,
		Y2  => tbY2,
		Y3  => tbY3,
		Y4  => tbY4,
		Y5  => tbY5,
		Y6  => tbY6,
		Y7  => tbY7,
		Y8  => tbY8,
		Y9  => tbY9,
		Y10 => tbY10,
		Y11 => tbY11,
		Y12 => tbY12,
		Y13 => tbY13,
		Y14 => tbY14,
		Y15 => tbY15

	);
	
	process
	begin
		
		tbENABLE <= '0';
		
		for i in 0 to 3 loop
			tbSEL <= std_logic_vector(to_unsigned(i, 4));
			wait for 10 ns;
		
		end loop;
		
		tbENABLE <= '1';
		
		for i in 0 to 15 loop
			tbSEL <= std_logic_vector(to_unsigned(i, 4));
			wait for 10 ns;
		
		end loop;

	
		wait;
	
	end process;

end TB_DECODER_4x16_ARC;