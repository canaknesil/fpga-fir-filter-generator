
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

signal hardcoded_0: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_1: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_2: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_3: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_4: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_5: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_6: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_7: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_8: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_9: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_10: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_11: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_12: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_13: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_14: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_15: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_16: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_17: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_18: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_19: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_20: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_21: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_22: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_23: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_24: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_25: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_26: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_27: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_28: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_29: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_30: std_logic_vector(7 downto 0) := "00000001"; 
signal hardcoded_31: std_logic_vector(7 downto 0) := "00000001"; 

signal module1_term: std_logic_vector(7 downto 0); 

signal module2_1_todown, module2_1_fromdown : std_logic_vector(7 downto 0); 
signal module2_2_todown, module2_2_fromdown : std_logic_vector(7 downto 0); 
signal module2_3_todown, module2_3_fromdown : std_logic_vector(7 downto 0); 
signal module2_4_todown, module2_4_fromdown : std_logic_vector(7 downto 0); 
signal module2_5_todown, module2_5_fromdown : std_logic_vector(7 downto 0); 
signal module2_6_todown, module2_6_fromdown : std_logic_vector(7 downto 0); 
signal module2_7_todown, module2_7_fromdown : std_logic_vector(7 downto 0); 
signal module2_8_todown, module2_8_fromdown : std_logic_vector(7 downto 0); 
signal module2_9_todown, module2_9_fromdown : std_logic_vector(7 downto 0); 
signal module2_10_todown, module2_10_fromdown : std_logic_vector(7 downto 0); 
signal module2_11_todown, module2_11_fromdown : std_logic_vector(7 downto 0); 
signal module2_12_todown, module2_12_fromdown : std_logic_vector(7 downto 0); 
signal module2_13_todown, module2_13_fromdown : std_logic_vector(7 downto 0); 
signal module2_14_todown, module2_14_fromdown : std_logic_vector(7 downto 0); 
signal module2_15_todown, module2_15_fromdown : std_logic_vector(7 downto 0); 
signal module2_16_todown, module2_16_fromdown : std_logic_vector(7 downto 0); 
signal module2_17_todown, module2_17_fromdown : std_logic_vector(7 downto 0); 
signal module2_18_todown, module2_18_fromdown : std_logic_vector(7 downto 0); 
signal module2_19_todown, module2_19_fromdown : std_logic_vector(7 downto 0); 
signal module2_20_todown, module2_20_fromdown : std_logic_vector(7 downto 0); 
signal module2_21_todown, module2_21_fromdown : std_logic_vector(7 downto 0); 
signal module2_22_todown, module2_22_fromdown : std_logic_vector(7 downto 0); 
signal module2_23_todown, module2_23_fromdown : std_logic_vector(7 downto 0); 
signal module2_24_todown, module2_24_fromdown : std_logic_vector(7 downto 0); 
signal module2_25_todown, module2_25_fromdown : std_logic_vector(7 downto 0); 
signal module2_26_todown, module2_26_fromdown : std_logic_vector(7 downto 0); 
signal module2_27_todown, module2_27_fromdown : std_logic_vector(7 downto 0); 
signal module2_28_todown, module2_28_fromdown : std_logic_vector(7 downto 0); 
signal module2_29_todown, module2_29_fromdown : std_logic_vector(7 downto 0); 
signal module2_30_todown, module2_30_fromdown : std_logic_vector(7 downto 0); 

begin 

module1op: module1 PORT MAP(input, module1_term, hardcoded_0, output); 
module2op_1: module2 PORT MAP(input, module2_1_fromdown, clock, hardcoded_1, module1_term, module2_1_todown); 
module2op_2: module2 PORT MAP(module2_1_todown, module2_2_fromdown, clock, hardcoded_2, module2_1_fromdown, module2_2_todown); 
module2op_3: module2 PORT MAP(module2_2_todown, module2_3_fromdown, clock, hardcoded_3, module2_2_fromdown, module2_3_todown); 
module2op_4: module2 PORT MAP(module2_3_todown, module2_4_fromdown, clock, hardcoded_4, module2_3_fromdown, module2_4_todown); 
module2op_5: module2 PORT MAP(module2_4_todown, module2_5_fromdown, clock, hardcoded_5, module2_4_fromdown, module2_5_todown); 
module2op_6: module2 PORT MAP(module2_5_todown, module2_6_fromdown, clock, hardcoded_6, module2_5_fromdown, module2_6_todown); 
module2op_7: module2 PORT MAP(module2_6_todown, module2_7_fromdown, clock, hardcoded_7, module2_6_fromdown, module2_7_todown); 
module2op_8: module2 PORT MAP(module2_7_todown, module2_8_fromdown, clock, hardcoded_8, module2_7_fromdown, module2_8_todown); 
module2op_9: module2 PORT MAP(module2_8_todown, module2_9_fromdown, clock, hardcoded_9, module2_8_fromdown, module2_9_todown); 
module2op_10: module2 PORT MAP(module2_9_todown, module2_10_fromdown, clock, hardcoded_10, module2_9_fromdown, module2_10_todown); 
module2op_11: module2 PORT MAP(module2_10_todown, module2_11_fromdown, clock, hardcoded_11, module2_10_fromdown, module2_11_todown); 
module2op_12: module2 PORT MAP(module2_11_todown, module2_12_fromdown, clock, hardcoded_12, module2_11_fromdown, module2_12_todown); 
module2op_13: module2 PORT MAP(module2_12_todown, module2_13_fromdown, clock, hardcoded_13, module2_12_fromdown, module2_13_todown); 
module2op_14: module2 PORT MAP(module2_13_todown, module2_14_fromdown, clock, hardcoded_14, module2_13_fromdown, module2_14_todown); 
module2op_15: module2 PORT MAP(module2_14_todown, module2_15_fromdown, clock, hardcoded_15, module2_14_fromdown, module2_15_todown); 
module2op_16: module2 PORT MAP(module2_15_todown, module2_16_fromdown, clock, hardcoded_16, module2_15_fromdown, module2_16_todown); 
module2op_17: module2 PORT MAP(module2_16_todown, module2_17_fromdown, clock, hardcoded_17, module2_16_fromdown, module2_17_todown); 
module2op_18: module2 PORT MAP(module2_17_todown, module2_18_fromdown, clock, hardcoded_18, module2_17_fromdown, module2_18_todown); 
module2op_19: module2 PORT MAP(module2_18_todown, module2_19_fromdown, clock, hardcoded_19, module2_18_fromdown, module2_19_todown); 
module2op_20: module2 PORT MAP(module2_19_todown, module2_20_fromdown, clock, hardcoded_20, module2_19_fromdown, module2_20_todown); 
module2op_21: module2 PORT MAP(module2_20_todown, module2_21_fromdown, clock, hardcoded_21, module2_20_fromdown, module2_21_todown); 
module2op_22: module2 PORT MAP(module2_21_todown, module2_22_fromdown, clock, hardcoded_22, module2_21_fromdown, module2_22_todown); 
module2op_23: module2 PORT MAP(module2_22_todown, module2_23_fromdown, clock, hardcoded_23, module2_22_fromdown, module2_23_todown); 
module2op_24: module2 PORT MAP(module2_23_todown, module2_24_fromdown, clock, hardcoded_24, module2_23_fromdown, module2_24_todown); 
module2op_25: module2 PORT MAP(module2_24_todown, module2_25_fromdown, clock, hardcoded_25, module2_24_fromdown, module2_25_todown); 
module2op_26: module2 PORT MAP(module2_25_todown, module2_26_fromdown, clock, hardcoded_26, module2_25_fromdown, module2_26_todown); 
module2op_27: module2 PORT MAP(module2_26_todown, module2_27_fromdown, clock, hardcoded_27, module2_26_fromdown, module2_27_todown); 
module2op_28: module2 PORT MAP(module2_27_todown, module2_28_fromdown, clock, hardcoded_28, module2_27_fromdown, module2_28_todown); 
module2op_29: module2 PORT MAP(module2_28_todown, module2_29_fromdown, clock, hardcoded_29, module2_28_fromdown, module2_29_todown); 
module2op_30: module2 PORT MAP(module2_29_todown, module2_30_fromdown, clock, hardcoded_30, module2_29_fromdown, module2_30_todown); 
module3op: module3 PORT MAP(module2_30_todown, clock, hardcoded_31, module2_30_fromdown); 
end Behavioral; 

