library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;

entity MUX221 is
port
(
	SEL:	in	std_logic;
	A:		in	std_logic;
	B:		in	std_logic;
	Y:		out	std_logic
);
end MUX221;

architecture MUX221_ARC of MUX221 is
begin
	Y <= A when SEL = '0'
	else B;
end MUX221_ARC;