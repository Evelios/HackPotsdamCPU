library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity InstructionMemory is

Port(
	ReadAddress	: in  std_logic_vector(31 downto 0);
	Instruction	: out std_logic_vector(31 downto 0)
);

end InstructionMemory;

---------------------------------------------------

Architecture behv of InstructionMemory is
begin

	Instruction <= "0";

end behv;