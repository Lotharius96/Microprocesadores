library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VGA is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           vsync : out  STD_LOGIC;
           hsync : out  STD_LOGIC;
           h : out  STD_LOGIC_VECTOR (10 downto 0);
           v : out  STD_LOGIC_VECTOR (9 downto 0);
			  dir : out STD_LOGIC_VECTOR ( 13 downto 0)
			  );
end VGA;

architecture Behavioral of VGA is

signal hcount : std_logic_vector(10 downto 0);
signal vcount : std_logic_vector(9  downto 0);
signal enav   : std_logic;
--signal hcounta : std_logic_vector(10 downto 0);
--signal hcountb : std_logic_vector(10 downto 0);
--signal hcountc : std_logic_vector(10 downto 0);
begin

process(clk,reset) -- contador horizontal 
	begin
		if reset ='1' then 
			hcount <= ( others =>'0');
		elsif clk'event and clk ='1' then 
			if hcount = 1600 then  -- tope en 1600 unidades
				hcount <= ( others => '0');
			else
				hcount <= hcount + 1;
			end if;
		end if;
end process;

enav <= '1' when hcount = 1600 else '0'; -- activación del contador vertical 

process (clk,reset) -- contador vertical 
	begin
		if reset = '1' then 
			vcount <= ( others =>'0');
		elsif clk'event and clk ='1' then 
			if enav = '1' then  -- se activa cuando el contador horizontal llega a 1600
				if vcount = 525 then  -- tope en 525
					vcount <= ( others =>'0');
				else
					vcount <= vcount + 1;
				end if;
			else null;
			end if;
		end if;
end process;


hsync <= '0' when hcount > 1320 and hcount < 1512 else '1'; -- Señal de sincronismo horizontal
vsync <= '0' when vcount > 493 and vcount < 496 else '1'; -- señal de sincronismo vertical 


h <= hcount;
v <= vcount;

dir <=vcount(6 downto 0)&hcount(7 downto 1);


end Behavioral;