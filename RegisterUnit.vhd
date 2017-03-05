-- Code from http://stackoverflow.com/questions/21581556/register-design-in-vhdl
-- Written by Bill Lynch

ENTITY RegisterUnit IS PORT(
	slowClk		: in std_logic;
	RegWrite		: in std_logic;
	ReadAddr1	: in std_logic_vector(4 downto 0);
	ReadAddr2	: in std_logic_vector(4 downto 0);
	WriteAddr1	: in std_logic_vector(4 downto 0);
	WriteData	: in std_logic_vector(32 downto 0);
	ReadData1	: out std_logic_vector(32 downto 0);	
	ReadData2	: out std_logic_vector(32 downto 0)
);
END RegisterUnit;

ARCHITECTURE description OF RegisterUnit IS

component Register32 is
	Port(
		d   : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- input
		ld  : IN STD_LOGIC; -- load/enable.
		clr : IN STD_LOGIC; -- async. clear.
		clk : IN STD_LOGIC; -- clock.
		q   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- output
		);
end component;

signal WriteEnable : std_logic_vector(7 downto 0);
signal RegCopy : std_logic_vector(255 downto 0) ;

Begin
Process(WriteData, WriteEnable)
	BEGIN
		case WriteData is
			when "000" => WriteEnable(0) <= "00000001";
			when "001" => WriteEnable(1) <= "00000010";
			when "010" => WriteEnable(2) <= "00000100";
			when "011" => WriteEnable(3) <= "00001000";
			when "100" => WriteEnable(4) <= "00010000";
			when "101" => WriteEnable(5) <= "00100000";
			when "110" => WriteEnable(6) <= "01000000";
			when "111" => WriteEnable(7) <= "10000000";
	end case;
End Process;

	GEN_REG:
	for I in 0 to 7 generate
		REGX : Register32 port map(
			d => WriteData,
			ld => WriteEnable(I),
			clr => "0",
			slowClk => clk,
			q => RegCopy((I + 1) * 8 downto (I + 1) * 8 - 8)
		);
	end generate GEN_REG;



Process(ReadAddr1, ReadData1)
	Begin
	case ReadAddr1 is
		when "000" => ReadData1 <= RegCopy(1 * 8 downto 1 * 8 - 8);
		when "001" => ReadData1 <= RegCopy(2 * 8 downto 2 * 8 - 8);
		when "010" => ReadData1 <= RegCopy(3 * 8 downto 3 * 8 - 8);
		when "011" => ReadData1 <= RegCopy(4 * 8 downto 4 * 8 - 8);
		when "100" => ReadData1 <= RegCopy(5 * 8 downto 5 * 8 - 8);
		when "101" => ReadData1 <= RegCopy(6 * 8 downto 6 * 8 - 8);
		when "110" => ReadData1 <= RegCopy(7 * 8 downto 7 * 8 - 8);
		when "111" => ReadData1 <= RegCopy(8 * 8 downto 8 * 8 - 8);
	end case;
End Process;

Process(ReadAddr2, ReadData2)
	Begin
	 case ReadAddr2 is
	 	when "000" => ReadData2 <= RegCopy(1 * 8 downto 1 * 8 - 8);
	 	when "001" => ReadData2 <= RegCopy(2 * 8 downto 2 * 8 - 8);
	 	when "010" => ReadData2 <= RegCopy(3 * 8 downto 3 * 8 - 8);
	 	when "011" => ReadData2 <= RegCopy(4 * 8 downto 4 * 8 - 8);
	 	when "100" => ReadData2 <= RegCopy(5 * 8 downto 5 * 8 - 8);
	 	when "101" => ReadData2 <= RegCopy(6 * 8 downto 6 * 8 - 8);
	 	when "110" => ReadData2 <= RegCopy(7 * 8 downto 7 * 8 - 8);
	 	when "111" => ReadData2 <= RegCopy(8 * 8 downto 8 * 8 - 8);
	end case;
End Process;	
	
END description;