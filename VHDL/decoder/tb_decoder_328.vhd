library IEEE;
    use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity TB_DECODER_328 is
end TB_DECODER_328;

architecture TB_DECODER_328_ARC of TB_DECODER_328 is

	component DECODER_328
	port
	(
		SEL: in  std_logic_vector(2 downto 0);
		Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7: out std_logic
	);
	end component;

	signal tbSEL:     std_logic_vector(2 downto 0) := "000";
	signal tbY0, tbY1, tbY2, tbY3, tbY4, tbY5, tbY6, tbY7: std_logic;

	begin
	DUT: DECODER_328
	port map
	(
		SEL	=> tbSEL,
		Y0  => tbY0,
		Y1  => tbY1,
		Y2  => tbY2,
		Y3  => tbY3,
		Y4  => tbY4,
		Y5  => tbY5,
		Y6  => tbY6,
		Y7  => tbY7

	);
	
	process
	begin
		
		for i in 0 to 7 loop
			tbSEL <= std_logic_vector(to_unsigned(i, 3));
			wait for 10 ns;
		
		end loop;
	
		wait;
	
	end process;

end TB_DECODER_328_ARC;