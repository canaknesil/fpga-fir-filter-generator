----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:32:49 05/11/2017 
-- Design Name: 
-- Module Name:    MUX8_4 - Behavioral 
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

entity MUX8_4 is
    PORT( sel: in std_logic;
          X, Y: in std_logic_vector(3 downto 0);
          m: out std_logic_vector(3 downto 0));
end MUX8_4;


architecture Behavioral of MUX8_4 is

    component MUX4_2 is
        PORT( sel, X0, X1, Y0, Y1: in std_logic;
              m0, m1: out std_logic);
    end component;
    
begin
    mux4_2_inst0 : MUX4_2
    PORT MAP( sel => sel, X0 => X(0), X1 => X(1), Y0 => Y(0), Y1 => Y(1),
              m0 => m(0), m1 => m(1));
              
    mux4_2_inst1 : MUX4_2
    PORT MAP( sel => sel, X0 => X(2), X1 => X(3), Y0 => Y(2), Y1 => Y(3),
              m0 => m(2), m1 => m(3));         
end Behavioral;

