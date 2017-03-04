library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity ShiftLeft2 is

Port(
	I:	in  std_logic_vector(31 downto 0);
	O:	out std_logic_vector(31 downto 0);
);

end ShiftLeft2;

---------------------------------------------------

Architecture behv of ShiftLeft2 is
begin

	O <= I sll 2;

end behv;