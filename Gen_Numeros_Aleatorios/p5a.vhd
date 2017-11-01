-- File name     : lfsr1_1.vhd
-- 	Comments     : Random number generator in VHDL - Version 1.1
--
-- Revisions
--   v1:    Initial
--   v1.1:  Added enable signal
--          Constants defined on external package lfsr_pkg
-----------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
	use work.lfsr_pkg.all;

entity lfsr is
  port (
    reset  : in  std_logic;
    clk    : in  std_logic; 
    enable : in  std_logic;                    		 -- Enable counting	
    count  : out std_logic_vector (LFSR_W-1 downto 0) -- lfsr output
  );
end entity;

architecture rtl of lfsr is
    signal count_i    	: std_logic_vector (LFSR_W-1 downto 0);
    signal feedback 	: std_logic;

begin

    feedback <= not(count_i(LFSR_W-1) xor count_i(LFSR_W-5));		-- LFSR size 9

    process (reset, clk) 
	begin
        if (reset = '1') then
            count_i <= (others=>'0');
        elsif (rising_edge(clk)) then
			if (enable = '1') then
				count_i <= count_i(LFSR_W-2 downto 0) & feedback;
			end if;	
        end if;
    end process;
    count <= count_i;
end architecture;
