LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MUX_2to1 is
	PORT(
		Con	: IN 	STD_LOGIC;
		A 	: IN	STD_LOGIC_VECTOR	(31 downto 0);
		B 	: IN	STD_LOGIC_VECTOR	(31 downto 0);
		X 	: OUT	STD_LOGIC_VECTOR	(31 downto 0);
		);
		
END ENTITY MUX_2to1;

ARCHITECTURE Behavior of MUX_2to1 is

Begin
	X <= A when (Con = '1') else B;
END Behavior;