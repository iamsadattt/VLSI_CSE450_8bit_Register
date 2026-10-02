library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_1bit is
    Port ( 
        D   : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end Register_1bit;

architecture Structural of Register_1bit is

    -- Declare the 1-bit D Flip-Flop component
    COMPONENT D_FF
    PORT(
         D   : IN  std_logic;
         CLK : IN  std_logic;
         Q   : OUT std_logic
        );
    END COMPONENT;

begin

    -- Instantiate the D Flip-Flop
    U1: D_FF PORT MAP (
          D   => D,
          CLK => CLK,
          Q   => Q
        );

end Structural;