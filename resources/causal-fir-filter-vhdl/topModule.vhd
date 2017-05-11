----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:51 05/11/2017 
-- Design Name: 
-- Module Name:    topModule - Behavioral 
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

entity topModule is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           switch : in  STD_LOGIC;
           out_sw : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end topModule;

architecture Behavioral of topModule is

component MUX8_4 is
    PORT( sel: in std_logic;
          X, Y: in std_logic_vector(3 downto 0);
          m: out std_logic_vector(3 downto 0));
end component;

component threesamplefilter is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           clock : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal dummy_out: std_logic_vector(7 downto 0);
signal dummy_out_least, dummy_out_most : std_logic_vector(3 downto 0);

begin

threesamplefilter_op: threesamplefilter PORT MAP(input, switch, dummy_out);
dummy_out_least <= dummy_out(3 downto 0);
dummy_out_most <= dummy_out(7 downto 4);

muxop: MUX8_4 PORT MAP(out_sw, dummy_out_least, dummy_out_most, output);


end Behavioral;

