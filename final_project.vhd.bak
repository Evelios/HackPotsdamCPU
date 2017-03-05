library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.values.all;

entity Final_Project is
    port(
        BTNReset,BTNEnable,BTNFwd  :in      std_logic;
        CLK50MHZ        :in      std_logic;
        CA              :out     std_logic_vector(27 downto 0); --7 Seg Cathodes
		  oData				:out		std_logic_vector(7 downto 0);
		  oEnable			:out		std_logic;
		  oMode_Select		:out		std_logic
        );
end Final_Project;

architecture Behavioral of Final_Project is

component bin_counter is
    generic(arrayLength: integer:=9;
            requiredBits: integer:=4);
    port(
        CLK50MHZ,clk_en,iEnable,iFwd,Reset  : in    std_logic;
        oCounter    : out   std_logic_vector(requiredBits-1 downto 0));
end component;

component SegDisplayDriver is
    port(
        iDisplayData    :in std_logic_vector(3 downto 0);
        oCathodes       :out std_logic_vector(0 to 6)
    );
end component;

component btn_debounce_toggle is
GENERIC (
	CONSTANT CNTR_MAX : std_logic_vector(15 downto 0) := X"FFFF");  
	--CONSTANT CNTR_MAX : std_logic_vector(15 downto 0) := X"000A");  --Simulation ONLY
    Port ( BTN_I 	: in  STD_LOGIC;
           CLK 		: in  STD_LOGIC;
           BTN_O 	: out  STD_LOGIC;
           TOGGLE_O : out  STD_LOGIC);
end component;

component clk_enabler is
	GENERIC (
		CONSTANT cnt_max : integer := 49999999);
		--CONSTANT cnt_max : integer := 100);   --Simulation ONLY      
	port(	
		clock:		in std_logic;
		Reset:      in std_logic;
		clk_en: 	out std_logic
	);
end component;

component Reset_Delay is	
    PORT (
        SIGNAL iCLK : IN std_logic;	
        SIGNAL oRESET : OUT std_logic
			);	
end component;

component Hex_ROM IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;

component ASCII_Converter is
    port(
        iDisplayData   	:in std_logic_vector(3 downto 0);
        oASCII      		:out std_logic_vector(0 to 7)
    );
end component;

component LCD_Driver is
Generic(
Constant HexMax :std_logic_vector(15 downto 0) := x"FFFF"
--Constant HexMax :std_logic_vector(15 downto 0) := x"0020" --Simulation ONLY
    );
Port (
    iClk            :in std_logic;
    Reset           :in std_logic; --Reset Button OR Init_Reset
	 iData			  :in std_logic_vector(31 downto 0); --Input ASCII values
	 iEnable, FwdBack:in std_logic; --enable and forward buttons
    oData           :out std_logic_vector(7 downto 0);
    oEnable         :out std_logic;
    oMode_Select    :out std_logic
    );
end component;

signal Reset   :   std_logic;
signal initReset, BTNEnableeset, clk_en, Fwd, Enable:   std_logic;
signal oCounter:    std_logic_vector(requiredBits-1 downto 0);
signal oHex:        std_logic_vector(15 downto 0);
signal Data_ASCII:  std_logic_vector(31 downto 0);

begin	
Reset <= initReset or BTNEnableeset;

init_reset: Reset_Delay
    port map(iCLK => CLK50MHZ, oRESET => initReset);

init_BTNReset_Debounce: btn_debounce_toggle
    port map(BTN_I => BTNReset,CLK => CLK50MHZ,BTN_O => BTNEnableeset,TOGGLE_O => open); 

init_BTNFwd_Toggle: btn_debounce_toggle
    port map(BTN_I => BTNFwd,CLK => CLK50MHZ,BTN_O => open,TOGGLE_O => Fwd); 
    
init_BTNEnable_Toggle: btn_debounce_toggle
    port map(BTN_I => BTNEnable,CLK => CLK50MHZ,BTN_O => open,TOGGLE_O => Enable); 
    
init_clk_Enable: clk_Enabler
    port map(clock => CLK50MHZ, Reset => Reset, clk_en => clk_en);
    
init_counter: bin_counter
    generic map(arrayLength => arrayLength, requiredBits => requiredBits)
    port map(CLK50MHZ => CLK50MHZ, clk_en => clk_en, iEnable => Enable, iFwd => Fwd, Reset => Reset, oCounter => oCounter);
    
init_hexROM: Hex_ROM
	 port map(address => oCounter, clock => CLK50MHZ, q => oHex);

--4 7-Segment Driver instances	 
init_7Seg_Digit1: SegDisplayDriver
    port map(iDisplayData => oHex(15 downto 12), oCathodes => CA(27 downto 21));
	 
init_7Seg_Digit2: SegDisplayDriver
    port map(iDisplayData => oHex(11 downto 8), oCathodes => CA(20 downto 14));
	
init_7Seg_Digit3: SegDisplayDriver
    port map(iDisplayData => oHex(7 downto 4), oCathodes => CA(13 downto 7));
	 
init_7Seg_Digit4: SegDisplayDriver
    port map(iDisplayData => oHex(3 downto 0), oCathodes => CA(6 downto 0));

--4 Hex-to-ASCII Converter instances
init_ASCII_Conv1: ASCII_Converter
	port map(iDisplayData => oHex(15 downto 12), oASCII => data_ASCII(31 downto 24));
	
init_ASCII_Conv2: ASCII_Converter
	port map(iDisplayData => oHex(11 downto 8), oASCII => data_ASCII(23 downto 16));
	
init_ASCII_Conv3: ASCII_Converter
	port map(iDisplayData => oHex(7 downto 4), oASCII => data_ASCII(15 downto 8));
	
init_ASCII_Conv4: ASCII_Converter
	port map(iDisplayData => oHex(3 downto 0), oASCII => data_ASCII(7 downto 0));
	
init_LCD_Driver: LCD_Driver
	generic map(HexMax => x"FFFF")
	port map(iClk => CLK50MHZ, Reset => Reset, iData => Data_ASCII, iEnable => Enable, FwdBack => Fwd, oData => oData, oEnable => oEnable, oMode_Select => oMode_Select);
	
end Behavioral;