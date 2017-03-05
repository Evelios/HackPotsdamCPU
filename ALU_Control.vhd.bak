LIBRARY ieee;

USE ieee.std_logic_1164.ALL;

ENTITY ALU IS
  PORT (
		--ALU Signal
        A       	: IN    std_logic_vector(31 downto 0);--A is a 32 bit signal.
        B     	    : IN    std_logic_vector(31 downto 0);--B is a 32 bit signal.
        Result    	: OUT   std_logic_vector(31 downto 0); -- Result of A Funct_Field
        Overflow   	: OUT   std_logic;--Overflow
		--ALU Control
		FunctField	:IN     std_logic_vector(5 downto 0); 
		ALU_op		:IN		std_logic_vector(1 downto 0)
		);
END ALU;

ARCHITECTURE ALU_main OF ALU IS
BEGIN
  --Code goes hre
  --switch case statments
PROCESS(A,B, FunctField)
  BEGIN
      CASE FunctField IS
          WHEN "000000" =>
            Result <= A AND B;--AND
            Overflow <= '0';
          WHEN "000001" =>
            Result <= A OR B;--OR
            Overflow <= '0';
          WHEN "000010" =>
            Result <= A + B;--ADD
            Overflow <= (((A(31) AND B(31)) AND (NOT Result))   OR      (((NOT A(31)) AND (NOT B(31))) AND Result));
          WHEN "000110" =>
            Result <= A - B; --SUB
            Overflow <= '0';
          WHEN "000111" =>
            Result <= A < B;--Set on Less Than
            Overflow <= '0';
          WHEN "001100"=>
            Result <= A NOR B;--NOR
            Overflow <= '0';
          WHEN OTHERS =>
            Result <= A;-- Pass A
            Overflow <= '0';
      END CASE;
END PROCESS;


END ALU_main;