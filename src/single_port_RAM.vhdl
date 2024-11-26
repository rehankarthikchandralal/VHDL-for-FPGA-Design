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


