library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit is
    Port ( 
        D   : in  STD_LOGIC_VECTOR (7 downto 0);
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR (7 downto 0)
    );
end Register_8bit;

architecture Structural of Register_8bit is

    -- Declare the 1-bit Register component
    COMPONENT Register_1bit
    PORT(
         D   : IN  std_logic;
         CLK : IN  std_logic;
         Q   : OUT std_logic
        );
    END COMPONENT;

begin

    -- Instantiate 8 1-bit Registers in parallel
    
    REG0: Register_1bit PORT MAP (
          D   => D(0),
          CLK => CLK,
          Q   => Q(0)
        );

    REG1: Register_1bit PORT MAP (
          D   => D(1),
          CLK => CLK,
          Q   => Q(1)
        );

    REG2: Register_1bit PORT MAP (
          D   => D(2),
          CLK => CLK,
          Q   => Q(2)
        );

    REG3: Register_1bit PORT MAP (
          D   => D(3),
          CLK => CLK,
          Q   => Q(3)
        );

    REG4: Register_1bit PORT MAP (
          D   => D(4),
          CLK => CLK,
          Q   => Q(4)
        );

    REG5: Register_1bit PORT MAP (
          D   => D(5),
          CLK => CLK,
          Q   => Q(5)
        );

    REG6: Register_1bit PORT MAP (
          D   => D(6),
          CLK => CLK,
          Q   => Q(6)
        );

    REG7: Register_1bit PORT MAP (
          D   => D(7),
          CLK => CLK,
          Q   => Q(7)
        );

end Structural;