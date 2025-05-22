library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity HALF_ADDER is
	port
	(
		A: in  std_logic;
		B: in  std_logic;
		O: out std_logic;
		C: out std_logic
	);
end HALF_ADDER;

architecture HALF_ADDER_ARC of HALF_ADDER is
	begin
	
	O <= A xor B;
	C <= A and B;

end HALF_ADDER_ARC;