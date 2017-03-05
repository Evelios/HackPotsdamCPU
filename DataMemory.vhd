library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity DataMem is
Port(
	Address		: in  std_logic_vector(31 downto 0);
	WriteData	: in  std_logic_vector(31 downto 0);
	ReadData	: out std_logic_vector(31 downto 0)
);

end DataMem;

---------------------------------------------------

Architecture behv of DataMem is
begin

	ReadData <= "0";

end behv;