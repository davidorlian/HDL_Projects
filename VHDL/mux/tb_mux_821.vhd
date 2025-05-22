library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity TB_MUX821 is
end TB_MUX821;

architecture TB_MUX821_ARC of TB_MUX821 is

	component MUX821 is
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
	end component;

	signal tbSEL: std_logic_vector(2 downto 0);
	signal tbA, tbB, tbC, tbD, tbE, tbF, tbG, tbH, tbY: std_logic;
	
	begin
	DUT: MUX821
	port map
	(
		SEL => tbSEL,
		A   => tbA,
		B   => tbB,
		C   => tbC,
		D   => tbD,
		E   => tbE,
		F   => tbF,
		G   => tbG,
		H   => tbH,
		Y   => tbY
	);
	
	process
	begin
	
		for i in 0 to 2047 loop
			-- Assign SEL signals (MSB bits)
			tbSEL <= std_logic_vector(to_unsigned(i / 256, 3));
		
			-- Assign Input Signals (from highest bit to lowest)
			if ((i / 128) mod 2 = 1) then
				tbA <= '1';
			else
				tbA <= '0';
			end if;
			
			if ((i / 64) mod 2 = 1) then
				tbB <= '1';
			else
				tbB <= '0';
			end if;
			
			if ((i / 32) mod 2 = 1) then
				tbC <= '1';
			else
				tbC <= '0';
			end if;
			
			if ((i / 16) mod 2 = 1) then
				tbD <= '1';
			else
				tbD <= '0';
			end if;
			
			if ((i / 8) mod 2 = 1) then
				tbE <= '1';
			else
				tbE <= '0';
			end if;
			
			if ((i / 4) mod 2 = 1) then
				tbF <= '1';
			else
				tbF <= '0';
			end if;
			
			if ((i / 2) mod 2 = 1) then
				tbG <= '1';
			else
				tbG <= '0';
			end if;
			
			if ((i / 1) mod 2 = 1) then
				tbH <= '1';
			else
				tbH <= '0';
			end if;
		
			wait for 10 ns;
			
		end loop;
	
		wait;
		
	end process;

end TB_MUX821_ARC;