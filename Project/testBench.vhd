library ieee;
use ieee.std_logic_1164.all;

entity testBench is
end testBench;

architecture tb of testBench is

    component SIPO
        port (D   : in std_logic;
              CLK : in std_logic;
              RST : in std_logic;
              Q   : out std_logic_vector (7 downto 0));
    end component;

    signal D   : std_logic;
    signal CLK : std_logic;
    signal RST : std_logic;
    signal Q   : std_logic_vector (7 downto 0);

    constant TbPeriod : time := 10 ps;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : SIPO
    port map (D   => D,
              CLK => CLK,
              RST => RST,
              Q   => Q);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
    CLK <= TbClock;

    stimuli : process
    begin
        D <= '0';
        RST <= '1';
        wait for 6 ps;
        RST <= '0';
        D <= '1';
        wait for 7.5 ps;
        RST <= '0';
        D <= '0';
        wait for 12.5 ps;
        RST <= '0';
        D <= '1';
        wait for 22.5 ps;
        RST <= '0';
        D <= '0';
        wait for 12.5 ps;
        RST <= '0';
        D <= '1';
        wait for 22.5 ps;
        RST <= '0';
        D <= '0';
        wait for 100*TbPeriod;
        
        TbSimEnded <= '1';
        wait;
    end process;
end tb;