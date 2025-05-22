library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity FULL_SUBTRACTOR is
	port
	(
		X:     in  std_logic;
		Y:     in  std_logic;
		B_IN:  in  std_logic;
		D:     out std_logic;
		B_OUT: out std_logic
	);
end FULL_SUBTRACTOR;

architecture FULL_SUBTRACTOR_ARC of FULL_SUBTRACTOR is
	begin
	
	D     <= (X xor Y) xor B_IN;
	B_OUT <= ((not X) and Y) or (B_IN and (not X or Y));
end FULL_SUBTRACTOR_ARC;