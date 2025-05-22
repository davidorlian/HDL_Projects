library IEEE;
    use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity DECODER_4x16 is
port
(
	ENABLE:  in  std_logic;
	SEL:	 in  std_logic_vector(3  downto 0);
	Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15: out std_logic
);
end DECODER_4x16;

architecture DECODER_4x16_ARC of DECODER_4x16 is
begin

	process(ENABLE, SEL)
	begin
		if (ENABLE = '1') then
			
			Y0  <= '0';
			Y1  <= '0';
			Y2  <= '0';
			Y3  <= '0';
			Y4  <= '0';
			Y5  <= '0';
			Y6  <= '0';
			Y7  <= '0';
			Y8  <= '0';
			Y9  <= '0';
			Y10 <= '0';
			Y11 <= '0';
			Y12 <= '0';
			Y13 <= '0';
			Y14 <= '0';
			Y15 <= '0';

			case SEL is
				when "0000" => Y0  <= '1';
				when "0001" => Y1  <= '1';
				when "0010" => Y2  <= '1';
				when "0011" => Y3  <= '1';
				when "0100" => Y4  <= '1';
				when "0101" => Y5  <= '1';
				when "0110" => Y6  <= '1';
				when "0111" => Y7  <= '1';
				when "1000" => Y8  <= '1';
				when "1001" => Y9  <= '1';
				when "1010" => Y10 <= '1';
				when "1011" => Y11 <= '1';
				when "1100" => Y12 <= '1';
				when "1101" => Y13 <= '1';
				when "1110" => Y14 <= '1';
				when others => Y15 <= '1';
			end case;
			
		else
			Y0 <= '0'; Y1 <= '0'; Y2 <= '0'; Y3 <= '0';
			Y4 <= '0'; Y5 <= '0'; Y6 <= '0'; Y7 <= '0';
			Y8 <= '0'; Y9 <= '0'; Y10 <= '0'; Y11 <= '0';
			Y12 <= '0'; Y13 <= '0'; Y14 <= '0'; Y15 <= '0';
			
		end if;
						
	end process;

end DECODER_4x16_ARC;
