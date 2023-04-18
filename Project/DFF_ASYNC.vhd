library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF_ASYNC is
  Port (D, CLK, RESET : IN STD_LOGIC;
                    Q : OUT STD_LOGIC);
end DFF_ASYNC;

architecture DFF_ASYNC_ARCH of DFF_ASYNC is
begin
    process(CLK, RESET)
    begin
    if (RESET = '1') then
        Q <= '0';
    elsif CLK = '1' and CLK'event then
        Q <= D;
    end if;
    end process;
end DFF_ASYNC_ARCH;