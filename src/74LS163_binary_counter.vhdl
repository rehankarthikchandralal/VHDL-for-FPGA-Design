architecture Behavioral of AAC2M2P1 is
    signal count: std_logic_vector(3 downto 0) := "0000";  -- 4-bit counter signal
begin
    process (CP, SR)
    begin
        if (SR = '0') then  -- Active low reset
            count <= "0000";  -- Reset the counter
        elsif rising_edge(CP) then
            if (PE = '1' and CEP = '1') then
                count <= P;  -- Load parallel input if enabled
            elsif (CET = '1') then
                if (count = "1111") then
                    TC <= '1';  -- Set Terminal Count when counter reaches max value
                else
                    TC <= '0';
                    count <= count + 1;  -- Increment counter
                end if;
            end if;
        end if;
    end process;
end Behavioral;
