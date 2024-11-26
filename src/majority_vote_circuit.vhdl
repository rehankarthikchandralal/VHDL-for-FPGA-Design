library ieee;
use ieee.std_logic_1164.all;

entity Majority is
    port (
        a,b,c : in  std_logic;
        y: out std_logic
    );
end entity Majority;

architecture Behavioral of Majority is
begin
    -- Error checking: If all inputs are 'X' (unknown), output 'X'
    y <= 'X' when (a = 'X' and b = 'X' and c = 'X') else
         (A and B) or (A and C) or (B **and** C);
end architecture Behavioral;