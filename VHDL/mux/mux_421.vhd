library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;

entity MUX421 is
port
(
	SEL:	in	std_logic_vector(1 downto 0);
	A:		in	std_logic;
	B:		in	std_logic;
	C:		in	std_logic;
	D:		in	std_logic;
	Y:		out	std_logic
);
end MUX421;

architecture MUX421_ARC of MUX421 is
begin
	process (SEL, A, B, C, D)
	begin
		case SEL is 
			when "00" => Y <= A;
			when "01" => Y <= B;
			when "10" => Y <= C;
			when others => Y <= D;
		end case;
	end process;
end MUX421_ARC;