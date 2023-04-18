library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SIPO is
  Port (D, CLK, RST : IN STD_LOGIC;
                   Q : OUT STD_LOGIC_VECTOR(7 downto 0) );
end SIPO;

architecture SIPO_ARCH of SIPO is
component DFF_ASYNC is
port(D, CLK, RESET : IN STD_LOGIC;
                Q : out STD_LOGIC);
end component;
signal dout : STD_LOGIC_VECTOR(7 downto 0);
begin
DFF0 : DFF_ASYNC port map(D, CLK, RST, dout(0));
DFF1 : DFF_ASYNC port map(dout(0), CLK, RST, dout(1));
DFF2 : DFF_ASYNC port map(dout(1), CLK, RST, dout(2));
DFF3 : DFF_ASYNC port map(dout(2), CLK, RST, dout(3));
DFF4 : DFF_ASYNC port map(dout(3), CLK, RST, dout(4));
DFF5 : DFF_ASYNC port map(dout(4), CLK, RST, dout(5));
DFF6 : DFF_ASYNC port map(dout(5), CLK, RST, dout(6));
DFF7 : DFF_ASYNC port map(dout(6), CLK, RST, dout(7));
Q <= dout;
end SIPO_ARCH;
