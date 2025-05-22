library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;

entity TB_MUX421 is
end TB_MUX421;

architecture TB_MUX421_ARC of TB_MUX421 is
	
	component MUX421 is
	port
	(
		SEL:	in	std_logic_vector(1 downto 0);
		A:		in	std_logic;
		B:		in	std_logic;
		C:		in	std_logic;
		D:		in	std_logic;
		Y:		out	std_logic
	);
	end component;
	
	signal tbSEL: std_logic_vector(1 downto 0);
	signal tbA:   std_logic;
	signal tbB:   std_logic;
	signal tbC:   std_logic;
	signal tbD:   std_logic;
	signal tbY:   std_logic;
	
	begin
	DUT: MUX421
	port map
	(
		SEL => tbSEL,
		A   => tbA,
		B   => tbB,  
		C   => tbC,  
		D   => tbD,  
		Y   => tbY  
	);            
	
	process
	begin
	
		for i in 0 to 63 loop
            -- Bits 5-4 for SEL (2 bits)
            if ((i / 16) mod 4 = 0) then
                tbSEL <= "00";
            elsif ((i / 16) mod 4 = 1) then
                tbSEL <= "01";
            elsif ((i / 16) mod 4 = 2) then
                tbSEL <= "10";
            else
                tbSEL <= "11";
            end if;
            
            -- Bit 3 for A
            if ((i / 8) mod 2 = 1) then
                tbA <= '1';
            else
                tbA <= '0';
            end if;
            
            -- Bit 2 for B
            if ((i / 4) mod 2 = 1) then
                tbB <= '1';
            else
                tbB <= '0';
            end if;
            
            -- Bit 1 for C
            if ((i / 2) mod 2 = 1) then
                tbC <= '1';
            else
                tbC <= '0';
            end if;
            
            -- Bit 0 for D
            if (i mod 2 = 1) then
                tbD <= '1';
            else
                tbD <= '0';
            end if;
            
            wait for 10 ns;
			
        end loop;
		
		wait;
		
	end process;
	
end TB_MUX421_ARC;
