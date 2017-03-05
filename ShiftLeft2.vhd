library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity ShiftLeft_2 is 

Port(
	Inn:	in  std_logic_vector(31 downto 0);
	Outt:	out std_logic_vector(31 downto 0)
);

end ShiftLeft_2;

---------------------------------------------------

Architecture behv_2 of ShiftLeft_2 is
begin

	Outt <= Inn(29 downto 0) & "00";

end behv_2;