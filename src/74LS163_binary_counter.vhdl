architecture Behavioral of AAC2M2P1 is
    signal count: std_logic_vector(3 downto 0) := "0000";  -- 4-bit counter signal
begin
    process (CP, SR)
    begin
        if (SR = '0') then  -- Active low reset
            count <= "0000";  -- Reset the counter
            TC <= '0';        -- Reset Terminal Count
        elsif rising_edge(CP) then
            if (PE = '1' and CEP = '1') then
                count <= P;  -- Load parallel input if enabled
                TC <= '0';   -- Reset Terminal Count after loading
            elsif (CET = '1') then
                if (count = "1111") then
                    count <= "0000";  -- Wrap around on max value
                else
                    count <= std_logic_vector(unsigned(count) + 1);  -- Increment counter
                end if;
            end if;
        end if;
    end process;

    -- Update Terminal Count (TC) outside of other conditions
    TC <= '1' when count = "1111" else '0';

end Behavioral;
