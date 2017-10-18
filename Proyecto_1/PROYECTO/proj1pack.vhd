--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package proj1pack is

component GPU is
    Port ( dat : in std_logic_vector ( 3 downto 0);
			  clk : in  STD_LOGIC;
			  up : in  STD_LOGIC;
			  down : in  STD_LOGIC;
			  right : in  STD_LOGIC;
			  left : in  STD_LOGIC;
           reset : in  STD_LOGIC;
	        h : in  STD_LOGIC_VECTOR (10 downto 0);
           v : in  STD_LOGIC_VECTOR (9 downto 0);
           rgb : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

component VGA is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           vsync : out  STD_LOGIC;
           hsync : out  STD_LOGIC;
           h : out  STD_LOGIC_VECTOR (10 downto 0);
           v : out  STD_LOGIC_VECTOR (9 downto 0);
			  dir : out STD_LOGIC_VECTOR ( 13 downto 0)
			  );
end component;

component int IS
Port (clk : in STD_LOGIC;
			 reset : in STD_LOGIC;
			 dir: in STD_LOGIC_VECTOR(13 downto 0);
			 dat : out STD_LOGIC_VECTOR(3 downto 0));
END component;


component mem IS
	port (
	clka: in std_logic;
	addra: in std_logic_vector(13 downto 0);
	douta: out std_logic_vector(3 downto 0));
END component;

component mem2 IS
	port (
	clka: in std_logic;
	addra: in std_logic_vector(13 downto 0);
	douta: out std_logic_vector(3 downto 0));
END component;

end proj1pack;
