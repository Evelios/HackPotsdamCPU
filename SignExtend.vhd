library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity SignExtend is

Port(
	I:	in  std_logic_vector(15 downto 0);
	O:	out std_logic_vector(31 downto 0)
);

end SignExtend;

---------------------------------------------------

Architecture behv of SignExtend is
begin

	O(31 downto 16) <= "0";
	O(15 downto 0) <= I(15 downto 0);

end behv;