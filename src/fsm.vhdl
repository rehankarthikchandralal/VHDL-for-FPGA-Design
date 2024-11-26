library ieee;
use ieee.std_logic_1164.all;

entity FSM is
    port (
        In1 : in std_logic;
        RST : in std_logic;
        CLK : in std_logic;
        Out1 : out std_logic
    );
end entity FSM;

architecture Behavioral of FSM is
    type State_Type is (A, B, C);
    signal Present_State, Next_State : State_Type;

begin
    FSM_Process: process (RST, CLK)
    begin
        if RST = '1' then
            Present_State <= A;
        elsif rising_edge(CLK) then
            Present_State <= Next_State;
        end if;

        case Present_State is
            when A =>
                if In1 = '1' then
                    Next_State <= B;
                    Out1 <= '0';
                else
                    Next_State <= A;
                    Out1 <= '0';
                end if;

            when B =>
                if In1 = '0' then
                    Next_State <= C;
                    Out1 <= '0';
                else
                    Next_State <= B;
                    Out1 <= '0';
                end if;

            when C =>
                if In1 = '0' then
                    Next_State <= A;
                    Out1 <= '1';
                else
                    Next_State <= C;
                    Out1 <= '1';
                end if;

            when others =>
                Next_State <= A;
                Out1 <= '0';
        end case;
    end process FSM_Process;
end architecture Behavioral;