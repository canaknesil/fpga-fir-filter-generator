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
           term : in  STD_LOGIC_VECTOR (15 downto 0);
			  hardcoded : in std_logic_vector (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end module1;

architecture Behavioral of module1 is

COMPONENT adder8 is Port ( term1 : in  STD_LOGIC_VECTOR (15 downto 0); term2 : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0);
           cout : out  STD_LOGIC);
end COMPONENT;

signal multoutext: unsigned(15 downto 0);
signal multoutext_logic: std_logic_vector(15 downto 0);
signal dumb_output: std_logic_vector(15 downto 0);

begin

multoutext <= unsigned(input) * unsigned(hardcoded);
multoutext_logic <= STD_LOGIC_VECTOR(multoutext);
adder: adder8 PORT MAP(multoutext_logic, term, dumb_output);
output <= dumb_output(14 downto 7);

end Behavioral;

