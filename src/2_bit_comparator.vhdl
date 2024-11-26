library ieee;
use ieee.std_logic_1164.all;

entity comparator_2_bit is
  port (
    a, b : in  std_logic_vector(1 downto 0);  -- Inputs
    c    : out std_logic                     -- Output
  );
end entity comparator_2_bit;

architecture Behavioral of comparator_2_bit is
begin
  c <= '1' when (a = b) else '0';          -- Comparator logic
end architecture Behavioral;
