library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port (
        A       : in  STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit input register A
        B       : in  STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit input register B
        opcode  : in  STD_LOGIC_VECTOR(2 downto 0);   -- 3-bit opcode
        Y       : out STD_LOGIC_VECTOR(31 downto 0)    -- 32-bit output register Y
    );
end ALU;

architecture Behavioral of ALU is
begin
    process(A, B, opcode)
    begin
        case opcode is
            -- Opcode 000: Y <= A
            when "000" =>
                Y <= A;

            -- Opcode 001: Y <= A + B
            when "001" =>
                Y <= A + B;

            -- Opcode 010: Y <= A - B
            when "010" =>
                Y <= A - B;

            -- Opcode 011: Y <= A AND B
            when "011" =>
                Y <= A and B;

            -- Opcode 100: Y <= A OR B
            when "100" =>
                Y <= A or B;

            -- Opcode 101: Y <= A + 1 (Increment A)
            when "101" =>
                Y <= A + 1;

            -- Opcode 110: Y <= A - 1 (Decrement A)
            when "110" =>
                Y <= A - 1;

            -- Opcode 111: Y <= B
            when "111" =>
                Y <= B;

            -- Default case (this shouldn't happen with valid opcodes)
            when others =>
                Y <= (others => '0');
        end case;
    end process;
end Behavioral;
