----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:35:57 04/16/2017 
-- Design Name: 
-- Module Name:    module2 - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity module2 is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           term : in  STD_LOGIC_VECTOR (7 downto 0);
           clock : in  STD_LOGIC;
			  hardcoded : in std_logic_vector (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0);
           fout : out  STD_LOGIC_VECTOR (7 downto 0));
end module2;

architecture Behavioral of module2 is

COMPONENT D_FF8 IS PORT( D_in8: in std_logic_vector (7 downto 0); CLOCK: in std_logic;
Q_out8: out std_logic_vector(7 downto 0));
END COMPONENT; 

COMPONENT adder8 is Port ( term1 : in  STD_LOGIC_VECTOR (7 downto 0); term2 : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end COMPONENT;

signal multoutext: std_logic_vector(15 downto 0);
signal multin, multout: std_logic_vector(7 downto 0);
--signal hardcoded: std_logic_vector(7 downto 0) := "00000101";

begin

D_FF8op: D_FF8 PORT MAP(input, clock, multin);
multoutext <= std_logic_vector(signed(multin) * signed(hardcoded));
multout <= multoutext(7 downto 0);
adder: adder8 PORT MAP(multout, term, output);


fout <= multin;

end Behavioral;

