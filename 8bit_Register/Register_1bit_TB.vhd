LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Register_1bit_TB IS
END Register_1bit_TB;
 
ARCHITECTURE behavior OF Register_1bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Register_1bit
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
   uut: Register_1bit PORT MAP (
          D   => D,
          CLK => CLK,
          Q   => Q
        );

   -- ==========================================
   -- Background Clock Process
   -- ==========================================
   CLK_process :process
   begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
   end process;
 
   -- ==========================================
   -- Stimulus Process
   -- ==========================================
   stim_proc: process
   begin		
      -- Hold initial state
      wait for 100 ns;	

      -- Test Case 1: Write a '1' into the register
      D <= '1';
      wait for CLK_period * 2; 
      
      -- Test Case 2: Write a '0' into the register
      D <= '0';
      wait for CLK_period * 2;
      
      -- Test Case 3: Verify the register holds its value between clock pulses
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