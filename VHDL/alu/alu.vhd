library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  
entity ALU_8_BIT is
port
(
	OPCODE: in  std_logic_vector(2 downto 0);
	X: 		in  std_logic_vector(7 downto 0);
	Y: 		in  std_logic_vector(7 downto 0);
	O: 		out std_logic_vector(7 downto 0);
	C: 		out std_logic
);
end ALU_8_BIT;

architecture ALU_8_BIT_ARC of ALU_8_BIT is

	component ADDER_8_BIT is
	port
	(
		A: in  std_logic_vector(7 downto 0);
		B: in  std_logic_vector(7 downto 0);
		O: out std_logic_vector(7 downto 0);
		C: out std_logic
	);
	end component;
	
	component SUBTRACTOR_8_BIT is
	port
	(
		X: in  std_logic_vector(7 downto 0);
		Y: in  std_logic_vector(7 downto 0);
		D: out std_logic_vector(7 downto 0);
		B: out std_logic
	);
	end component;
	
	component INCREMENTER_8_BIT is
	port
	(
		A: in  std_logic_vector(7 downto 0);
		O: out std_logic_vector(7 downto 0);
		C: out std_logic
	);
	end component;

	component DECREMENTER_8_BIT is
	port
	(
		X: in  std_logic_vector(7 downto 0);
		D: out std_logic_vector(7 downto 0);
    	B: out std_logic
    );
    end component;
	
	component DECODER_328 is
	port
	(
		SEL: in  std_logic_vector(2 downto 0);
		Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7: out std_logic
	);
	end component;	
	
	signal ADD_OP, SUB_OP, INC_OP, DEC_OP: std_logic;
	signal ADD_O: std_logic_vector(7 downto 0);
    signal ADD_C: std_logic;
    signal SUB_O: std_logic_vector(7 downto 0);
    signal SUB_B: std_logic;
    signal INC_O: std_logic_vector(7 downto 0);
    signal INC_C: std_logic;
    signal DEC_O: std_logic_vector(7 downto 0);
    signal DEC_B: std_logic;
	
	begin
	
	P1: DECODER_328 port map (OPCODE, ADD_OP, SUB_OP, INC_OP, DEC_OP, open, open, open, open);
	P2: ADDER_8_BIT port map (X, Y, ADD_O, ADD_C);
	P3: SUBTRACTOR_8_BIT port map (X, Y, SUB_O, SUB_B);
	P4: INCREMENTER_8_BIT port map (X, INC_O, INC_C);
	P5: DECREMENTER_8_BIT port map (X, DEC_O, DEC_B);
	
	P6: process
	begin
	
		O <= (others => '0');
        C <= '0';

		if ADD_OP = '1' then
		
            O <= ADD_O;
            C <= ADD_C;
		
		elsif SUB_OP = '1' then
			
            O <= SUB_O;
            C <= SUB_B;
		
		elsif INC_OP = '1' then
		
			O <= INC_O;
            C <= INC_C;
					
		elsif DEC_OP = '1' then
			
			O <= DEC_O;
            C <= DEC_B;
		
		end if;
		
		wait;
		
	end process P6;
		
end ALU_8_BIT_ARC;