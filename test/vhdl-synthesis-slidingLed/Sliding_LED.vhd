----------------------------------------------------------------------------------
-- Company: Koç University
-- Engineer: Altynbek Isabekov
-- 
-- Create Date:    11:54:24 10/10/2016 
-- Design Name: 
-- Module Name:    Sliding_LED - Behavioral 
-- Project Name: 
-- Target Devices: XC3S50A VQ100
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

entity Sliding_LED is
	 Generic (N : INTEGER:=50*10**6); -- 50*10^6 Hz Clock				 
    Port (MCLK : in  STD_LOGIC;
          LEDS : out  STD_LOGIC_VECTOR (9 downto 0));
end Sliding_LED;

architecture Behavioral of Sliding_LED is
signal CLK_DIV : STD_LOGIC;
signal State: STD_LOGIC_VECTOR(9 downto 0):="0000000001";

begin
-- Transfer state vector into LEDS
LEDS <= State;

-- Clock divider
process(MCLK)
variable Counter : INTEGER range 0 to N;
begin	
		if rising_edge(MCLK) then
			Counter := Counter + 1;
			 if (Counter = N/5-1) then 
					Counter := 0;
					CLK_DIV <= not CLK_DIV;				
			 end if;
		end if;
end process;

-- LED shifter
process(CLK_DIV)
begin
		if rising_edge(CLK_DIV) then
			State <= (State(0) & State(9 downto 1));
		end if;	
end process;
end Behavioral;