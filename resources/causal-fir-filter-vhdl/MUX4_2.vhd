----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:34 05/11/2017 
-- Design Name: 
-- Module Name:    MUX4_2 - Behavioral 
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

entity MUX4_2 is
   PORT( sel: in std_logic; X0: in std_logic; X1: in std_logic; Y0: in std_logic; Y1: in std_logic;
         m0: out std_logic; m1: out std_logic); 
end MUX4_2; 

architecture Behavioral of MUX4_2 is
begin 
   m0 <= (X0 and sel) or (Y0 and not sel);
   m1 <= (X1 and sel) or (Y1 and not sel);
end Behavioral;

