library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEMUX_124 is
    Port
	(
        INPUT : in  STD_LOGIC;
        SEL   : in  STD_LOGIC_VECTOR (1 downto 0);
        Y0, Y1, Y2, Y3 : out STD_LOGIC;
    );
end DEMUX_124;

architecture DEMUX_124_ARC of DEMUX_124 is

begin

    process(INPUT, SEL)
    begin
        case SEL is
            when "00" =>
                Y0 <= INPUT;
                Y1 <= '0';
                Y2 <= '0';
                Y3 <= '0';
            when "01" =>
                Y0 <= '0';
                Y1 <= INPUT;
                Y2 <= '0';
                Y3 <= '0';
            when "10" =>
                Y0 <= '0';
                Y1 <= '0';
                Y2 <= INPUT;
                Y3 <= '0';
            when others =>
                Y0 <= '0';
                Y1 <= '0';
                Y2 <= '0';
                Y3 <= INPUT;
        end case;
    end process;

end DEMUX_124_ARC;