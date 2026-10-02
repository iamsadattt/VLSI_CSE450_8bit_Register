LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Register_8bit_TB IS
END Register_8bit_TB;
 
ARCHITECTURE behavior OF Register_8bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Register_8bit
    PORT(
         D   : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         Q   : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal D   : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

   --Outputs
   signal Q : std_logic_vector(7 downto 0);

   -- Clock period definition
   constant CLK_period : time := 20 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Register_8bit PORT MAP (
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

      -- Test Case 1: Load 10101010 (170 in decimal)
      D <= "10101010";
      wait for CLK_period * 2; 
      
      -- Test Case 2: Load 01010101 (85 in decimal)
      D <= "01010101";
      wait for CLK_period * 2;
      
      -- Test Case 3: Load 11111111 (255 in decimal)
      D <= "11111111";
      wait for CLK_period * 2;
      
      -- Test Case 4: Load 00000000 (0 in decimal)
      D <= "00000000";
      wait for CLK_period * 2;

      -- Stop execution
      wait;
   end process;

END;