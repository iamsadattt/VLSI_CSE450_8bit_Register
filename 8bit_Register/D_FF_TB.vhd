LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY D_FF_TB IS
END D_FF_TB;
 
ARCHITECTURE behavior OF D_FF_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT D_FF
    PORT(
         D   : IN  std_logic;
         CLK : IN  std_logic;
         Q   : OUT std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal D   : std_logic := '0';
   signal CLK : std_logic := '0';

   --Outputs
   signal Q : std_logic;

   -- Clock period definition
   constant CLK_period : time := 20 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: D_FF PORT MAP (
          D   => D,
          CLK => CLK,
          Q   => Q
        );

   -- ==========================================
   -- Background Clock Process (Runs continuously)
   -- ==========================================
   CLK_process :process
   begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
   end process;
 
   -- ==========================================
   -- Stimulus Process (Changes the Data)
   -- ==========================================
   stim_proc: process
   begin		
      -- Hold initial state
      wait for 100 ns;	

      -- Test Case 1: Write a '1' into memory
      D <= '1';
      wait for CLK_period * 2; 
      
      -- Test Case 2: Write a '0' into memory
      D <= '0';
      wait for CLK_period * 2;
      
      -- Test Case 3: Change D rapidly while the clock is low
      -- This proves the flip-flop ignores data changes between clock pulses
      D <= '1';
      wait for 5 ns; 
      D <= '0';
      wait for 5 ns;
      D <= '1';
      wait for CLK_period * 2;

      -- Stop execution
      wait;
   end process;

END;