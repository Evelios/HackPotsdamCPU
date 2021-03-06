library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity Control is

Port(
	Op       : in  std_logic_vector(5 downto 0);
	RegDes   : out std_logic;
	ALU_Src  : out std_logic;
	MemtoReg : out std_logic;
	RegWrite : out std_logic;
	MemRead  : out std_logic;
	Branch   : out std_logic;
	ALUOp1   : out std_logic;
	ALUOp2   : out std_logic
);

end Control;

---------------------------------------------------

Architecture behv of Control is

signal Rformat : std_logic;
signal lw : std_logic;
signal sw : std_logic;
signal beq : std_logic;

begin

	Rformat <= ((not Op(5) and not Op(4)) and ((not Op(3) and not Op(2)) and (not Op(1) and not Op(0))));
	lw 		<=  ((Op(5) and not Op(4)) and ((not Op(3) and not Op(2)) and  (Op(1) and  Op(0))));
	sw 		<=  ((Op(5) and not Op(4)) and  ((Op(3) and not Op(2)) and  (Op(1) and  Op(0))));
	beq		<= (((not Op(5) and not Op(4)) and (not Op(3) and  Op(2))) and (not Op(1) and not Op(0)));

	RegDes   <= Rformat;
	ALU_Src  <= lw or sw;
	MemtoReg <= lw;
	RegWrite <= Rformat or lw;
	MemRead  <= lw;
	Branch   <= beq;
	ALUOp1   <= Rformat;
	ALUOp2   <= beq;

end behv;