LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RAM128_32 IS
    PORT (
        address : IN STD_LOGIC_VECTOR(6 DOWNTO 0);  -- 7-bit address for 128 locations
        clock   : IN STD_LOGIC := '1';             -- Clock input
        data    : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- 32-bit input data
        wren    : IN STD_LOGIC;                   -- Write enable signal
        q       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- 32-bit output data
    );
END RAM128_32;

ARCHITECTURE Behavioral OF RAM128_32 IS
    -- Declare the RAM as a 2D array with 128 rows, each 32 bits wide
    TYPE ram_type IS ARRAY (0 TO 127) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL ram : ram_type := (OTHERS => (OTHERS => '0')); -- Initialize all memory locations to '0'
BEGIN

PROCESS (clock)
BEGIN
    IF rising_edge(clock) THEN
        IF wren = '1' THEN
            -- Write operation
            ram(to_integer(unsigned(address))) <= data;
        END IF;
    END IF;
END PROCESS;
END Behavioral;
            -- Read operation
            q <= ram(to_integer(unsigned(address)));
        END IF;
    END PROCESS;
END Behavioral;
