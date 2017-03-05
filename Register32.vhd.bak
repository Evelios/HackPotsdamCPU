-- Code from http://stackoverflow.com/questions/21581556/register-design-in-vhdl
-- Written by Bill Lynch

ENTITY Register32 IS PORT(
    d   : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- input
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- output
);
END Register32;

ARCHITECTURE description OF Register32 IS

BEGIN
    process(clk, clr)
    begin
        if clr = '1' then
            q <= x"00000000";
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
END description;