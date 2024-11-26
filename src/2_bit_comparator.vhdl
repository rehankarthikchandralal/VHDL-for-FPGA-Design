

library ieee;
use ieee.std_logic_1164.all;

entity comparator_2_bit is
  port (
    a,b : in  std_logic_vector(1 downto 0);
    c: out std_logic
  );
end entity comparator_2_bit;

architecture 1  Behavioral of comparator2 is
begin
  c <= '1' when a = b else '0';
end architecture Behavioral;
