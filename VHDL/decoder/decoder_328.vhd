library IEEE;
    use IEEE.std_logic_1164.all;

entity DECODER_328 is
port
(
	SEL: in  std_logic_vector(2 downto 0);
	Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7: out std_logic
);
end DECODER_328;

architecture DECODER_328_ARC of DECODER_328 is
begin

	process(SEL)
	begin
		Y0 <= '0';
		Y1 <= '0';
		Y2 <= '0';
		Y3 <= '0';
		Y4 <= '0';
		Y5 <= '0';
		Y6 <= '0';
		Y7 <= '0';
		
		case SEL is
			when "000" =>
				Y0 <= '1';
				
			when "001" =>
				Y1 <= '1';
				
			when "010" =>
				Y2 <= '1';
				
			when "011" =>
				Y3 <= '1';
				
			when "100" =>
				Y4 <= '1';
				
			when "101" =>
				Y5 <= '1';
				
			when "110" =>
				Y6 <= '1';
				
			when others =>
				Y7 <= '1';
		
		end case;
						
	end process;

end DECODER_328_ARC;
