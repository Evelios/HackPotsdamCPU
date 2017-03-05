library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity SwitchInput is

Port(
	sw0 = in std_logic;
	sw1 = in std_logic;
	sw2 = in std_logic;
	sw3 = in std_logic;
	O:	out std_logic_vector(3 downto 0);
);

end SwitchInput;

---------------------------------------------------

Architecture behv of ShiftLeft2 is
begin

	O(0) <= sw0;
	O(1) <= sw1;

	O(2) <= sw2;
	O(3) <= sw3;

end behv;