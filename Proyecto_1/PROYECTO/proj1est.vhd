library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.proj1pack.all;

entity proj1est is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
           rgb : out  STD_LOGIC_VECTOR (11 downto 0));
end proj1est;

architecture Behavioral of proj1est is
signal h : std_logic_vector ( 10 downto 0);
signal v : std_logic_vector ( 9 downto 0);
signal dir : std_logic_vector ( 13 downto 0);
signal dat : std_logic_vector ( 3 downto 0);
begin


c1: VGA port map
( clk => clk, reset => reset, h => h, v => v, vsync => vsync, hsync => hsync, dir => dir);
c2: GPU port map
(h => h, v => v, rgb => rgb,dat => dat);
c3: int port map
(clk => clk, reset => reset,dir => dir, dat => dat);
end Behavioral;

