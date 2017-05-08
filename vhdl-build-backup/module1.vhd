----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:19:01 04/16/2017 
-- Design Name: 
-- Module Name:    module1 - Behavioral 
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

entity module1 is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           term : in  STD_LOGIC_VECTOR (7 downto 0);
			  hardcoded : in std_logic_vector (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end module1;

architecture Behavioral of module1 is

COMPONENT adder8 is Port ( term1 : in  STD_LOGIC_VECTOR (7 downto 0); term2 : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end COMPONENT;

signal multoutext: std_logic_vector(15 downto 0);
signal multout: std_logic_vector(7 downto 0);
--signal hardcoded: std_logic_vector(7 downto 0) := "00000101";

begin

multoutext <= std_logic_vector(signed(input) * signed(hardcoded));
multout <= multoutext(14 downto 7);
adder: adder8 PORT MAP(multout, term, output);

end Behavioral;

