--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:08:24 10/27/2017
-- Design Name:   
-- Module Name:   C:/Proyectos ISE/NumALea/prueba.vhd
-- Project Name:  NumALea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lfsr
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_textio.all;
    use ieee.numeric_std.ALL;
    use std.textio.all;
	 use work.lfsr_pkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY prueba IS
END prueba;
 
ARCHITECTURE behavior OF prueba IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lfsr
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         enable : IN  std_logic;
         count : OUT  std_logic_vector(LFSR_W-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '1';
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';
	signal endSim	 : boolean   := false;

 	--Outputs
   signal count : std_logic_vector(LFSR_W-1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
      reset   <= '0' after  clk_period*10;
      enable <= '1';
		
   end process;





process 
	begin
		if (endSim) then
			assert false 
				report "End of simulation." 
				severity failure; 
		end if;
		wait until (clk = '1');
	end process;	



	-- Instantiate the Unit Under Test (UUT)
   uut: lfsr PORT MAP (
          reset => reset,
          clk => clk,
          enable => enable,
          count => count
        );

END;
