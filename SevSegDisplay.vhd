
-------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TEST1 is
port (
      clk : in std_logic;
        bcd : in std_logic_vector(3 downto 0);  --BCD input
        segment7 : out std_logic_vector(6 downto 0)  -- 7 bit decoded output.
    );
end TEST1;
--'a' corresponds to MSB of segment7 and g corresponds to LSB of segment7.
architecture Behavioral of TEST1 is

begin
process (clk,bcd)
BEGIN
if (clk'event and clk='1') then
case  bcd is
            when "0000" => segment7 <= "1000000"; --0
            when "0001" => segment7 <= "1111001"; --1
            when "0010" => segment7 <= "0100100"; --2
            when "0011" => segment7 <= "0110000"; --3
            when "0100" => segment7 <= "0011001"; --4
            when "0101" => segment7 <= "0010010"; --5
            when "0110" => segment7 <= "0000010"; --6
            when "0111" => segment7 <= "1111000"; --7
            when "1000" => segment7 <= "0000000"; --8
            when "1001" => segment7 <= "0010000"; --9
            when "1010" => segment7 <= "0001000"; --a
            when "1011" => segment7 <= "0000011"; --b
            when "1100" => segment7 <= "1000110"; --c
            when "1101" => segment7 <= "0100001"; --d
            when "1110" => segment7 <= "0000110"; --e
            when "1111" => segment7 <= "0001110"; --f
            when others => segment7 <= "1111111"; --nothing
end case;
end if;

end process;

end Behavioral;