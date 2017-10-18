library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.proj1pack.all;

entity int is
    Port (clk : in STD_LOGIC;
			 reset : in STD_LOGIC;
			 dir: in STD_LOGIC_VECTOR(13 downto 0);
			 dat : out STD_LOGIC_VECTOR(3 downto 0));
end int;

architecture Behavioral of int is
signal data1,data2,data : std_logic_vector (3 downto 0);
signal cont : std_logic_vector (24 downto 0);
begin

c4: mem port map
(clka=>clk, addra => dir, douta => data1);
c5: mem2 port map
(clka=>clk, addra => dir, douta => data2);

process(clk,reset)
begin
	if reset='1' then
		cont<=(others=> '0');
	elsif clk'event and clk='1' then
		cont<=cont+1;
	end if;
end process;

process(data1,data2,cont)
begin
	if cont < 16777216 then
		data<=data1;
	elsif cont > 16777216 then
		data<=data2;
	end if;
end process;

dat<=data;
end Behavioral;

