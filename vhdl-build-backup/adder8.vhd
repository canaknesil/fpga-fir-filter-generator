----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:40:20 04/16/2017 
-- Design Name: 
-- Module Name:    adder8 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder8 is
    Port ( term1 : in  STD_LOGIC_VECTOR (15 downto 0);
           term2 : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0);
           cout : out  STD_LOGIC);
end adder8;

architecture Behavioral of adder8 is

COMPONENT FullAdder IS     
	PORT (A: IN std_logic; B: IN std_logic; Cin: IN std_logic; Sum: OUT std_logic; Cout: OUT std_logic);
END COMPONENT; 

SIGNAL interc : std_logic_vector(14 downto 0);

begin

FullAdder0: FullAdder PORT MAP(term1(0), term2(0), '0', output(0), interc(0));
FullAdder1: FullAdder PORT MAP(term1(1), term2(1), interc(0), output(1), interc(1));
FullAdder2: FullAdder PORT MAP(term1(2), term2(2), interc(1), output(2), interc(2));
FullAdder3: FullAdder PORT MAP(term1(3), term2(3), interc(2), output(3), interc(3));
FullAdder4: FullAdder PORT MAP(term1(4), term2(4), interc(3), output(4), interc(4));
FullAdder5: FullAdder PORT MAP(term1(5), term2(5), interc(4), output(5), interc(5));
FullAdder6: FullAdder PORT MAP(term1(6), term2(6), interc(5), output(6), interc(6));
FullAdder7: FullAdder PORT MAP(term1(7), term2(7), interc(6), output(7), interc(7));
FullAdder8: FullAdder PORT MAP(term1(8), term2(8), interc(7), output(8), interc(8));
FullAdder9: FullAdder PORT MAP(term1(9), term2(9), interc(8), output(9), interc(9));
FullAdder10: FullAdder PORT MAP(term1(10), term2(10), interc(9), output(10), interc(10));
FullAdder11: FullAdder PORT MAP(term1(11), term2(11), interc(10), output(11), interc(11));
FullAdder12: FullAdder PORT MAP(term1(12), term2(12), interc(11), output(12), interc(12));
FullAdder13: FullAdder PORT MAP(term1(13), term2(13), interc(12), output(13), interc(13));
FullAdder14: FullAdder PORT MAP(term1(14), term2(14), interc(13), output(14), interc(14));
FullAdder15: FullAdder PORT MAP(term1(15), term2(15), interc(14), output(15), cout);

end Behavioral;

