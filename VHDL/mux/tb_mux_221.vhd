library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;

entity TB_MUX221 is
end TB_MUX221;

architecture TB_MUX221_ARC of TB_MUX221 is

	component MUX221 is
	port
	(
		SEL: in	 std_logic;
		A:	 in	 std_logic;
		B:	 in	 std_logic;
		Y:	 out std_logic
	);
	end component;

	signal tbSEL: std_logic;
	signal tbA:   std_logic;
	signal tbB:   std_logic;
	signal tbY:   std_logic;
	
	begin
	DUT: MUX221
	port map
	(
		SEL => tbSEL,
	    A	=> tbA,
        B	=> tbB, 
        Y	=> tbY 
	);
	
	process
	begin
	
		for i in 0 to 7 loop
            -- Bit 2 (MSB) to SEL
            if ((i / 4) mod 2 = 1) then
                tbSEL <= '1';
            else
                tbSEL <= '0';
            end if;
            
            -- Bit 1 to A
            if ((i / 2) mod 2 = 1) then
                tbA <= '1';
            else
                tbA <= '0';
            end if;
            
            -- Bit 0 (LSB) to B
            if (i mod 2 = 1) then
                tbB <= '1';
            else
                tbB <= '0';
            end if;
            
            wait for 10 ns;
			
        end loop;

		wait;
	
	end process;
end TB_MUX221_ARC;
				



	
	