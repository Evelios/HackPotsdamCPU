--FOR USE WITH NEXYS 4 DDR 7-SEG STYLE ONLY
--Use 4 of these, one for each display

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity SegDisplayDriver is
    port(
        iDisplayData    :in std_logic_vector(3 downto 0);
        oCathodes       :out std_logic_vector(6 downto 0)
    );
end SegDisplayDriver;

architecture Behavioral of SegDisplayDriver is


begin
    --Cathode LUT
    process(iDisplayData)
    begin
        case iDisplayData is
            when "0000" => oCathodes <= "1000000"; --0
            when "0001" => oCathodes <= "1111001"; --1
            when "0010" => oCathodes <= "0100100"; --2
            when "0011" => oCathodes <= "0110000"; --3
            when "0100" => oCathodes <= "0011001"; --4
            when "0101" => oCathodes <= "0010010"; --5
            when "0110" => oCathodes <= "0000010"; --6
            when "0111" => oCathodes <= "1111000"; --7
            when "1000" => oCathodes <= "0000000"; --8
            when "1001" => oCathodes <= "0010000"; --9
            when "1010" => oCathodes <= "0001000"; --a
            when "1011" => oCathodes <= "0000011"; --b
            when "1100" => oCathodes <= "1000110"; --c
            when "1101" => oCathodes <= "0100001"; --d
            when "1110" => oCathodes <= "0000110"; --e
            when "1111" => oCathodes <= "0001110"; --f
            when others => oCathodes <= "1111111"; --nothing
        end case;
    end process;
end Behavioral;
