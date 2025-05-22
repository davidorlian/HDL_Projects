library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity FULL_ADDER is
	port
	(
		A:     in  std_logic;
		B:     in  std_logic;
		C_IN:  in  std_logic;
		O:     out std_logic;
		C_OUT: out std_logic
	);
end FULL_ADDER;

architecture FULL_ADDER_ARC of FULL_ADDER is
	begin
	
	O     <= (A xor B) xor C_IN;
	C_OUT <= (A and B) or (A and C_IN) or (B and C_IN);

end FULL_ADDER_ARC;