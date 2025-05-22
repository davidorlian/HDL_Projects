library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TB_DECODER_4X32 is
end TB_DECODER_4X32;

architecture TB_DECODER_4X32_ARC of TB_DECODER_4X32 is

	component DECODER_4X32 is
    port
	(
      ENABLE : in std_logic;
      SEL    : in std_logic_vector(3 downto 0);
      Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7,
      Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15,
      Y16, Y17, Y18, Y19, Y20, Y21, Y22, Y23,
      Y24, Y25, Y26, Y27, Y28, Y29, Y30, Y31 : out std_logic
    );
    end component;
    
    signal tb_ENABLE: std_logic := '0';
    signal tb_SEL   : std_logic_vector(3 downto 0);
    signal tb_Y0,  tb_Y1,  tb_Y2,  tb_Y3,  tb_Y4,  tb_Y5,  tb_Y6,  tb_Y7,
 	 	 tb_Y8,  tb_Y9,  tb_Y10, tb_Y11, tb_Y12, tb_Y13, tb_Y14, tb_Y15,
 	 	 tb_Y16, tb_Y17, tb_Y18, tb_Y19, tb_Y20, tb_Y21, tb_Y22, tb_Y23,
 	 	 tb_Y24, tb_Y25, tb_Y26, tb_Y27, tb_Y28, tb_Y29, tb_Y30, tb_Y31 : std_logic;
    
    constant clock_period : time := 10 ns;

begin

	DUT : DECODER_4X32
	
	port map
	(
		ENABLE => tb_ENABLE,
		SEL    => tb_SEL,
		Y0  => tb_Y0,  Y1  => tb_Y1,  Y2  => tb_Y2,  Y3  => tb_Y3,
		Y4  => tb_Y4,  Y5  => tb_Y5,  Y6  => tb_Y6,  Y7  => tb_Y7,
		Y8  => tb_Y8,  Y9  => tb_Y9,  Y10 => tb_Y10, Y11 => tb_Y11,
		Y12 => tb_Y12, Y13 => tb_Y13, Y14 => tb_Y14, Y15 => tb_Y15,
		Y16 => tb_Y16, Y17 => tb_Y17, Y18 => tb_Y18, Y19 => tb_Y19,
		Y20 => tb_Y20, Y21 => tb_Y21, Y22 => tb_Y22, Y23 => tb_Y23,
		Y24 => tb_Y24, Y25 => tb_Y25, Y26 => tb_Y26, Y27 => tb_Y27,
		Y28 => tb_Y28, Y29 => tb_Y29, Y30 => tb_Y30, Y31 => tb_Y31
	);
	
	enable: process
	begin
	
		tb_ENABLE <= '0';
		wait for clock_period / 2;
		
		tb_ENABLE <= '1';
		wait for clock_period / 2;
		
	end process;
	
	process
	begin
	
		for i in 0 to 15 loop
			
			tb_SEL <= std_logic_vector(to_unsigned(i, 4));
			
			wait for clock_period;
			
		end loop;
			
		wait;
		
	end process;
	
end TB_DECODER_4X32_ARC;