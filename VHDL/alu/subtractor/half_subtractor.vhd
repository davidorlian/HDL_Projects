library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity HALF_SUBTRACTOR is
	port
	(
		X: in  std_logic;
		Y: in  std_logic;
		D: out std_logic;
		B: out std_logic
	);
end HALF_SUBTRACTOR;

architecture HALF_SUBTRACTOR_ARC of HALF_SUBTRACTOR is
	begin
	
	D <= X xor Y;
	B <= (not X) and Y;

end HALF_SUBTRACTOR_ARC;