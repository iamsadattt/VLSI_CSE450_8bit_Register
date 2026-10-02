library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    Port ( 
        D   : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end D_FF;

architecture Structural of D_FF is

    COMPONENT NOR_gate
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Y : OUT std_logic
        );
    END COMPONENT;

    -- Master Latch Signals
    signal inv_D  : std_logic;
    signal S_m    : std_logic;
    signal R_m    : std_logic;
    signal Qm     : std_logic := '0'; -- Initialized for ISim
    signal Qm_bar : std_logic := '1'; -- Initialized for ISim

    -- Slave Latch Signals
    signal inv_CLK   : std_logic;
    signal inv_Qm    : std_logic;
    signal S_s       : std_logic;
    signal R_s       : std_logic;
    signal Q_int     : std_logic := '0'; -- Initialized for ISim
    signal Q_bar_int : std_logic := '1'; -- Initialized for ISim

begin

    -- ==========================================
    -- MASTER LATCH (Transparent when CLK = 0)
    -- ==========================================
    U1: NOR_gate PORT MAP (A => D, B => D, Y => inv_D);
    U2: NOR_gate PORT MAP (A => inv_D, B => CLK, Y => S_m);
    U3: NOR_gate PORT MAP (A => D, B => CLK, Y => R_m);
    
    -- Master SR Cross-Coupled Loop
    U4: NOR_gate PORT MAP (A => R_m, B => Qm_bar, Y => Qm);
    U5: NOR_gate PORT MAP (A => S_m, B => Qm, Y => Qm_bar);


    -- ==========================================
    -- SLAVE LATCH (Transparent when CLK = 1)
    -- ==========================================
    U6: NOR_gate PORT MAP (A => CLK, B => CLK, Y => inv_CLK);
    U7: NOR_gate PORT MAP (A => Qm, B => Qm, Y => inv_Qm);
    
    U8: NOR_gate PORT MAP (A => inv_Qm, B => inv_CLK, Y => S_s);
    U9: NOR_gate PORT MAP (A => Qm, B => inv_CLK, Y => R_s);
    
    -- Slave SR Cross-Coupled Loop
    U10: NOR_gate PORT MAP (A => R_s, B => Q_bar_int, Y => Q_int);
    U11: NOR_gate PORT MAP (A => S_s, B => Q_int, Y => Q_bar_int);

    -- Connect internal Q to output port
    Q <= Q_int;

end Structural;