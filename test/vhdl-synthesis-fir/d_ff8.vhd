library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF8 is
PORT( D_in8: in std_logic_vector (7 downto 0); CLOCK: in std_logic;
Q_out8: out std_logic_vector(7 downto 0));
end D_FF8;

architecture Behavioral of D_FF8 is

COMPONENT D_FF IS PORT (D,CLOCK: in std_logic;Q: out std_logic);
END COMPONENT;

begin

D_FF0: D_FF PORT MAP(D_in8(0), CLOCK, Q_out8(0));
D_FF1: D_FF PORT MAP(D_in8(1), CLOCK, Q_out8(1));
D_FF2: D_FF PORT MAP(D_in8(2), CLOCK, Q_out8(2));
D_FF3: D_FF PORT MAP(D_in8(3), CLOCK, Q_out8(3));
D_FF4: D_FF PORT MAP(D_in8(4), CLOCK, Q_out8(4));
D_FF5: D_FF PORT MAP(D_in8(5), CLOCK, Q_out8(5));
D_FF6: D_FF PORT MAP(D_in8(6), CLOCK, Q_out8(6));
D_FF7: D_FF PORT MAP(D_in8(7), CLOCK, Q_out8(7));


end Behavioral;
