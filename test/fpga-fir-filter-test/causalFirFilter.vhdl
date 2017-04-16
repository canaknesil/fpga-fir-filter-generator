
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

entity threesamplefilter is 
	Port ( input : in  STD_LOGIC_VECTOR (7 downto 0); 
		clock : in  STD_LOGIC; 
		output : out  STD_LOGIC_VECTOR (7 downto 0)); 
end threesamplefilter; 

architecture Behavioral of threesamplefilter is 

component module1 is 
	Port ( input : in  STD_LOGIC_VECTOR (7 downto 0); 
		term : in  STD_LOGIC_VECTOR (7 downto 0); 
		hardcoded : in std_logic_vector (7 downto 0); 
		output : out  STD_LOGIC_VECTOR (7 downto 0)); 
end component; 

component module2 is 
	Port ( input : in  STD_LOGIC_VECTOR (7 downto 0); 
		term : in  STD_LOGIC_VECTOR (7 downto 0); 
		clock : in  STD_LOGIC; 
		hardcoded : in std_logic_vector (7 downto 0); 
		output : out  STD_LOGIC_VECTOR (7 downto 0); 
		fout : out  STD_LOGIC_VECTOR (7 downto 0)); 
end component; 

component module3 is 
	Port ( input : in  STD_LOGIC_VECTOR (7 downto 0); 
		clock : in  STD_LOGIC; 
		hardcoded : in std_logic_vector (7 downto 0); 
		output : out  STD_LOGIC_VECTOR (7 downto 0)); 
end component; 

signal hardcoded_0: std_logic_vector(7 downto 0) := "00000010"; 
signal hardcoded_1: std_logic_vector(7 downto 0) := "00000010"; 
signal hardcoded_2: std_logic_vector(7 downto 0) := "00000010"; 
signal hardcoded_3: std_logic_vector(7 downto 0) := "00000010"; 
signal hardcoded_4: std_logic_vector(7 downto 0) := "00000010"; 

signal module1_term: std_logic_vector(7 downto 0); 

signal module2_1_todown, module2_1_fromdown : std_logic_vector(7 downto 0); 
signal module2_2_todown, module2_2_fromdown : std_logic_vector(7 downto 0); 
signal module2_3_todown, module2_3_fromdown : std_logic_vector(7 downto 0); 

begin 

module1op: module1 PORT MAP(input, module1_term, hardcoded_0, output); 
module2op_1: module2 PORT MAP(input, module2_1_fromdown, clock, hardcoded_1, module1_term, module2_1_todown); 
module2op_2: module2 PORT MAP(module2_1_todown, module2_2_fromdown, clock, hardcoded_2, module2_1_fromdown, module2_2_todown); 
module2op_3: module2 PORT MAP(module2_2_todown, module2_3_fromdown, clock, hardcoded_3, module2_2_fromdown, module2_3_todown); 
module3op: module3 PORT MAP(module2_3_todown, clock, hardcoded_4, module2_3_fromdown); 
end Behavioral; 

