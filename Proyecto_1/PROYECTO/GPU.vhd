library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GPU is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC; 
			  up : in  STD_LOGIC;
			  down : in  STD_LOGIC;
			  right : in  STD_LOGIC;
			  left : in  STD_LOGIC;
			  dat : in std_logic_vector ( 3 downto 0);
	        h : in  STD_LOGIC_VECTOR (10 downto 0);
           v : in  STD_LOGIC_VECTOR (9 downto 0);
           rgb : out  STD_LOGIC_VECTOR (11 downto 0));
end GPU;

architecture Behavioral of GPU is
signal x1,x2 : std_logic_vector(10 downto 0);
signal y1,y2 : std_logic_vector(9  downto 0);
signal q : std_logic_vector ( 4 downto 0);
signal a : std_logic_vector ( 2 downto 0);
signal b : std_logic_vector ( 2 downto 0);
signal c : std_logic;
signal cont : std_logic_vector(7 downto 0);
signal counter : std_logic_vector(7 downto 0);

begin


-- Limites dinámicos de las celdas dependen de las señales apuntadoras
-- limites horizontales
x1 <=a&'0'&h(6 downto 0);
x2 <=a&h(7 downto 1)&'1';
-- limites verticales
y1 <=b&v(6 downto 0);
y2 <=b&v(6 downto 0);



process (clk,reset)
begin
if reset = '1' then
a <="000";
b <="000";
elsif clk' event and clk='1' then
	if cont=1000000 then
		if up='1' then
			if b=0 then
			b<="111";
			else 
			b<=v-1;
			end if;
		elsif down='1' then 
			if b=7 then 
			b<="000";
			else 
			b<=b+1;
			end if;
		elsif right='1' then 
			if a=0 then
			a<="111";
			else 
			a<=a-1;
			end if;
		elsif left='1' then
			if a=7 then 
			a<="000";
			else 
			a<=a+1;
			end if;
			
		else null;
		end if;
	else null;
	end if;
end if;

end process;

--process(clk,reset)
--   begin 
--	 if reset ='1' then 
--        
--	 up<='0';
--	 down<='0';
--    left<='0';
-- 	 right<='0';
--  
--  elsif clk 'event and clk='1' then 
--	    if counter < 100 then 
--         counter<=Counter+1;
--			up<=up;
--			down<=Down;
--			right<=right;
--		   left<=left;
--        else		
--        	up<=up;
--			down<=Down;
--			right<=right;
--		   left<=left;			
--		   counter<= "00000000";
--	    end if;
--	 end if;
--  end process;

--process (arriba,a, b)
--begin
--if arriba = '1' then
--	if a = "0000" then
--	a <= a + 2;
--	b <= b + '1';
--	elsif a > "0000" and a < "1111" then
--   a <= a(3 downto 1)&'0';
--	b <= a(2 downto 1)&'0';	
--	elsif a = "1111" then
--	a <= ( others => '0');
--	b <= ( others => '0');
--	end if;
--end if;
--end process;
--process(arriba,reset) -- contador horizontal 
--	begin
--		if reset ='1' then 
--			c <= '0';
--		elsif arriba'event and arriba ='1' then 
--			c <= '1';
--		end if;
--end process;



-- Rectangulos dinámicos
-- cada bit se enciende cuando los contadores se encuentran en los rangos definidos por los limites dinámicos
c <='1' when (h >= x1 and h <= x2) and ( v >= y1 and v <= y2) else '0';
q <= c & dat;

process (q, dat)
begin
case q is
		when "10000" =>	rgb <= "000000000000";
		when "10001" =>	rgb <= "000000000000";
		when "10010" =>	rgb <= "000000000000";
		when "10011" =>	rgb <= "000000000000";
		when "10100" =>	rgb <= "111111110000";
		when "10101" =>	rgb <= "111111110000";
		when "10110" =>	rgb <= "111111110000";
		when "10111" =>	rgb <= "111111110000";
		when "11000" =>	rgb <= "111111110000";
		when "11001" =>	rgb <= "111111110000";
		when "11010" =>	rgb <= "000011110000";
		when "11011" =>	rgb <= "000011110000";
		when "11100" =>	rgb <= "111111111111";
		when "11101" =>	rgb <= "111111111111";
		when "11110" =>	rgb <= "111111111111";
		when "11111" =>	rgb <= "111111111111";
		when others  =>  	rgb <= "000000000000";
end case;
end process;


process (clk,reset)
begin
if reset = '1' then
cont<= (others =>'0');
elsif clk' event and clk='1' then
		if cont=1000000 then
		cont<=(others=>'0');
		else 
		cont<=cont+1;
end if;
end if;
end process;

end Behavioral;



