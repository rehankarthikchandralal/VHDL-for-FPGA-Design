library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO8x9 is
    port(
        clk, rst, RdPtrClr, WrPtrClr, RdInc, WrInc : in std_logic;
        DataIn : in std_logic_vector(8 downto 0);
        DataOut : out std_logic_vector(8 downto 0);
        rden, wren : in std_logic
    );
end entity FIFO8x9;

architecture RTL of FIFO8x9 is
    type fifo_array is array (7 downto 0) of std_logic_vector(8 downto 0);
    signal fifo : fifo_array;
    signal wrptr, rdptr : unsigned(2 downto 0);
    signal en : std_logic_vector(7 downto 0);
    signal dmuxout : std_logic_vector(8 downto 0);

begin

    -- Reset logic
    process(clk, rst)
    begin
        if rst = '1' then
            wrptr <= "000";
            rdptr <= "000";
        elsif rising_edge(clk) then
            if RdPtrClr = '1' then
                rdptr <= "000";
            elsif WrPtrClr = '1' then
                wrptr <= "000";
            elsif RdInc = '1' and rden = '1' then
                rdptr <= rdptr + 1;
            elsif WrInc = '1' and wren = '1' then
                wrptr <= wrptr + 1;
            end if;
        end if;
    end process;

    -- FIFO write logic
    process(clk, rst)
    begin
        if rst = '1' then
            for i in 0 to 7 loop
                fifo(i) <= (others => '0');
            end loop;
        elsif rising_edge(clk) then
            if wren = '1' then
                fifo(to_integer(wrptr)) <= DataIn;
            end if;
        end if;
    end process;

    -- FIFO read logic
    generate
        for i in 0 to 7 generate
            en(i) <= '1' when rdptr = i and rden = '1' else '0';
        end generate;
    end generate;

    -- Demultiplexer to select the correct data
    with select when rden = '1' else "000" select
        dmuxout <= fifo(0) when "000",
                    fifo(1) when "001",
                    fifo(2) when "010",
                    fifo(3) when "011",
                    fifo(4) when "100",
                    fifo(5) when "101",
                    fifo(6) when "110",
                    fifo(7) when others;
    end process;

    DataOut <= dmuxout;
end architecture RTL;