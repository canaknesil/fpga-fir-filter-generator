
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
		term : in  STD_LOGIC_VECTOR (15 downto 0); 
		hardcoded : in std_logic_vector (7 downto 0); 
		output : out  STD_LOGIC_VECTOR (7 downto 0)); 
end component; 

component module2 is 
	Port ( input : in  STD_LOGIC_VECTOR (7 downto 0); 
		term : in  STD_LOGIC_VECTOR (15 downto 0); 
		clock : in  STD_LOGIC; 
		hardcoded : in std_logic_vector (7 downto 0); 
		output : out  STD_LOGIC_VECTOR (15 downto 0); 
		fout : out  STD_LOGIC_VECTOR (7 downto 0)); 
end component; 

component module3 is 
	Port ( input : in  STD_LOGIC_VECTOR (7 downto 0); 
		clock : in  STD_LOGIC; 
		hardcoded : in std_logic_vector (7 downto 0); 
		output : out  STD_LOGIC_VECTOR (15 downto 0)); 
end component; 

signal hardcoded_0: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_1: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_2: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_3: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_4: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_5: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_6: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_7: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_8: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_9: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_10: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_11: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_12: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_13: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_14: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_15: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_16: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_17: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_18: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_19: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_20: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_21: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_22: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_23: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_24: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_25: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_26: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_27: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_28: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_29: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_30: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_31: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_32: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_33: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_34: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_35: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_36: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_37: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_38: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_39: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_40: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_41: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_42: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_43: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_44: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_45: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_46: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_47: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_48: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_49: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_50: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_51: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_52: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_53: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_54: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_55: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_56: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_57: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_58: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_59: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_60: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_61: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_62: std_logic_vector(7 downto 0) := "00100000"; 
signal hardcoded_63: std_logic_vector(7 downto 0) := "00100000"; 

signal module1_term: std_logic_vector(15 downto 0); 

signal module2_1_todown : std_logic_vector(7 downto 0); 
signal module2_1_fromdown : std_logic_vector(15 downto 0); 
signal module2_2_todown : std_logic_vector(7 downto 0); 
signal module2_2_fromdown : std_logic_vector(15 downto 0); 
signal module2_3_todown : std_logic_vector(7 downto 0); 
signal module2_3_fromdown : std_logic_vector(15 downto 0); 
signal module2_4_todown : std_logic_vector(7 downto 0); 
signal module2_4_fromdown : std_logic_vector(15 downto 0); 
signal module2_5_todown : std_logic_vector(7 downto 0); 
signal module2_5_fromdown : std_logic_vector(15 downto 0); 
signal module2_6_todown : std_logic_vector(7 downto 0); 
signal module2_6_fromdown : std_logic_vector(15 downto 0); 
signal module2_7_todown : std_logic_vector(7 downto 0); 
signal module2_7_fromdown : std_logic_vector(15 downto 0); 
signal module2_8_todown : std_logic_vector(7 downto 0); 
signal module2_8_fromdown : std_logic_vector(15 downto 0); 
signal module2_9_todown : std_logic_vector(7 downto 0); 
signal module2_9_fromdown : std_logic_vector(15 downto 0); 
signal module2_10_todown : std_logic_vector(7 downto 0); 
signal module2_10_fromdown : std_logic_vector(15 downto 0); 
signal module2_11_todown : std_logic_vector(7 downto 0); 
signal module2_11_fromdown : std_logic_vector(15 downto 0); 
signal module2_12_todown : std_logic_vector(7 downto 0); 
signal module2_12_fromdown : std_logic_vector(15 downto 0); 
signal module2_13_todown : std_logic_vector(7 downto 0); 
signal module2_13_fromdown : std_logic_vector(15 downto 0); 
signal module2_14_todown : std_logic_vector(7 downto 0); 
signal module2_14_fromdown : std_logic_vector(15 downto 0); 
signal module2_15_todown : std_logic_vector(7 downto 0); 
signal module2_15_fromdown : std_logic_vector(15 downto 0); 
signal module2_16_todown : std_logic_vector(7 downto 0); 
signal module2_16_fromdown : std_logic_vector(15 downto 0); 
signal module2_17_todown : std_logic_vector(7 downto 0); 
signal module2_17_fromdown : std_logic_vector(15 downto 0); 
signal module2_18_todown : std_logic_vector(7 downto 0); 
signal module2_18_fromdown : std_logic_vector(15 downto 0); 
signal module2_19_todown : std_logic_vector(7 downto 0); 
signal module2_19_fromdown : std_logic_vector(15 downto 0); 
signal module2_20_todown : std_logic_vector(7 downto 0); 
signal module2_20_fromdown : std_logic_vector(15 downto 0); 
signal module2_21_todown : std_logic_vector(7 downto 0); 
signal module2_21_fromdown : std_logic_vector(15 downto 0); 
signal module2_22_todown : std_logic_vector(7 downto 0); 
signal module2_22_fromdown : std_logic_vector(15 downto 0); 
signal module2_23_todown : std_logic_vector(7 downto 0); 
signal module2_23_fromdown : std_logic_vector(15 downto 0); 
signal module2_24_todown : std_logic_vector(7 downto 0); 
signal module2_24_fromdown : std_logic_vector(15 downto 0); 
signal module2_25_todown : std_logic_vector(7 downto 0); 
signal module2_25_fromdown : std_logic_vector(15 downto 0); 
signal module2_26_todown : std_logic_vector(7 downto 0); 
signal module2_26_fromdown : std_logic_vector(15 downto 0); 
signal module2_27_todown : std_logic_vector(7 downto 0); 
signal module2_27_fromdown : std_logic_vector(15 downto 0); 
signal module2_28_todown : std_logic_vector(7 downto 0); 
signal module2_28_fromdown : std_logic_vector(15 downto 0); 
signal module2_29_todown : std_logic_vector(7 downto 0); 
signal module2_29_fromdown : std_logic_vector(15 downto 0); 
signal module2_30_todown : std_logic_vector(7 downto 0); 
signal module2_30_fromdown : std_logic_vector(15 downto 0); 
signal module2_31_todown : std_logic_vector(7 downto 0); 
signal module2_31_fromdown : std_logic_vector(15 downto 0); 
signal module2_32_todown : std_logic_vector(7 downto 0); 
signal module2_32_fromdown : std_logic_vector(15 downto 0); 
signal module2_33_todown : std_logic_vector(7 downto 0); 
signal module2_33_fromdown : std_logic_vector(15 downto 0); 
signal module2_34_todown : std_logic_vector(7 downto 0); 
signal module2_34_fromdown : std_logic_vector(15 downto 0); 
signal module2_35_todown : std_logic_vector(7 downto 0); 
signal module2_35_fromdown : std_logic_vector(15 downto 0); 
signal module2_36_todown : std_logic_vector(7 downto 0); 
signal module2_36_fromdown : std_logic_vector(15 downto 0); 
signal module2_37_todown : std_logic_vector(7 downto 0); 
signal module2_37_fromdown : std_logic_vector(15 downto 0); 
signal module2_38_todown : std_logic_vector(7 downto 0); 
signal module2_38_fromdown : std_logic_vector(15 downto 0); 
signal module2_39_todown : std_logic_vector(7 downto 0); 
signal module2_39_fromdown : std_logic_vector(15 downto 0); 
signal module2_40_todown : std_logic_vector(7 downto 0); 
signal module2_40_fromdown : std_logic_vector(15 downto 0); 
signal module2_41_todown : std_logic_vector(7 downto 0); 
signal module2_41_fromdown : std_logic_vector(15 downto 0); 
signal module2_42_todown : std_logic_vector(7 downto 0); 
signal module2_42_fromdown : std_logic_vector(15 downto 0); 
signal module2_43_todown : std_logic_vector(7 downto 0); 
signal module2_43_fromdown : std_logic_vector(15 downto 0); 
signal module2_44_todown : std_logic_vector(7 downto 0); 
signal module2_44_fromdown : std_logic_vector(15 downto 0); 
signal module2_45_todown : std_logic_vector(7 downto 0); 
signal module2_45_fromdown : std_logic_vector(15 downto 0); 
signal module2_46_todown : std_logic_vector(7 downto 0); 
signal module2_46_fromdown : std_logic_vector(15 downto 0); 
signal module2_47_todown : std_logic_vector(7 downto 0); 
signal module2_47_fromdown : std_logic_vector(15 downto 0); 
signal module2_48_todown : std_logic_vector(7 downto 0); 
signal module2_48_fromdown : std_logic_vector(15 downto 0); 
signal module2_49_todown : std_logic_vector(7 downto 0); 
signal module2_49_fromdown : std_logic_vector(15 downto 0); 
signal module2_50_todown : std_logic_vector(7 downto 0); 
signal module2_50_fromdown : std_logic_vector(15 downto 0); 
signal module2_51_todown : std_logic_vector(7 downto 0); 
signal module2_51_fromdown : std_logic_vector(15 downto 0); 
signal module2_52_todown : std_logic_vector(7 downto 0); 
signal module2_52_fromdown : std_logic_vector(15 downto 0); 
signal module2_53_todown : std_logic_vector(7 downto 0); 
signal module2_53_fromdown : std_logic_vector(15 downto 0); 
signal module2_54_todown : std_logic_vector(7 downto 0); 
signal module2_54_fromdown : std_logic_vector(15 downto 0); 
signal module2_55_todown : std_logic_vector(7 downto 0); 
signal module2_55_fromdown : std_logic_vector(15 downto 0); 
signal module2_56_todown : std_logic_vector(7 downto 0); 
signal module2_56_fromdown : std_logic_vector(15 downto 0); 
signal module2_57_todown : std_logic_vector(7 downto 0); 
signal module2_57_fromdown : std_logic_vector(15 downto 0); 
signal module2_58_todown : std_logic_vector(7 downto 0); 
signal module2_58_fromdown : std_logic_vector(15 downto 0); 
signal module2_59_todown : std_logic_vector(7 downto 0); 
signal module2_59_fromdown : std_logic_vector(15 downto 0); 
signal module2_60_todown : std_logic_vector(7 downto 0); 
signal module2_60_fromdown : std_logic_vector(15 downto 0); 
signal module2_61_todown : std_logic_vector(7 downto 0); 
signal module2_61_fromdown : std_logic_vector(15 downto 0); 
signal module2_62_todown : std_logic_vector(7 downto 0); 
signal module2_62_fromdown : std_logic_vector(15 downto 0); 

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
module2op_31: module2 PORT MAP(module2_30_todown, module2_31_fromdown, clock, hardcoded_31, module2_30_fromdown, module2_31_todown); 
module2op_32: module2 PORT MAP(module2_31_todown, module2_32_fromdown, clock, hardcoded_32, module2_31_fromdown, module2_32_todown); 
module2op_33: module2 PORT MAP(module2_32_todown, module2_33_fromdown, clock, hardcoded_33, module2_32_fromdown, module2_33_todown); 
module2op_34: module2 PORT MAP(module2_33_todown, module2_34_fromdown, clock, hardcoded_34, module2_33_fromdown, module2_34_todown); 
module2op_35: module2 PORT MAP(module2_34_todown, module2_35_fromdown, clock, hardcoded_35, module2_34_fromdown, module2_35_todown); 
module2op_36: module2 PORT MAP(module2_35_todown, module2_36_fromdown, clock, hardcoded_36, module2_35_fromdown, module2_36_todown); 
module2op_37: module2 PORT MAP(module2_36_todown, module2_37_fromdown, clock, hardcoded_37, module2_36_fromdown, module2_37_todown); 
module2op_38: module2 PORT MAP(module2_37_todown, module2_38_fromdown, clock, hardcoded_38, module2_37_fromdown, module2_38_todown); 
module2op_39: module2 PORT MAP(module2_38_todown, module2_39_fromdown, clock, hardcoded_39, module2_38_fromdown, module2_39_todown); 
module2op_40: module2 PORT MAP(module2_39_todown, module2_40_fromdown, clock, hardcoded_40, module2_39_fromdown, module2_40_todown); 
module2op_41: module2 PORT MAP(module2_40_todown, module2_41_fromdown, clock, hardcoded_41, module2_40_fromdown, module2_41_todown); 
module2op_42: module2 PORT MAP(module2_41_todown, module2_42_fromdown, clock, hardcoded_42, module2_41_fromdown, module2_42_todown); 
module2op_43: module2 PORT MAP(module2_42_todown, module2_43_fromdown, clock, hardcoded_43, module2_42_fromdown, module2_43_todown); 
module2op_44: module2 PORT MAP(module2_43_todown, module2_44_fromdown, clock, hardcoded_44, module2_43_fromdown, module2_44_todown); 
module2op_45: module2 PORT MAP(module2_44_todown, module2_45_fromdown, clock, hardcoded_45, module2_44_fromdown, module2_45_todown); 
module2op_46: module2 PORT MAP(module2_45_todown, module2_46_fromdown, clock, hardcoded_46, module2_45_fromdown, module2_46_todown); 
module2op_47: module2 PORT MAP(module2_46_todown, module2_47_fromdown, clock, hardcoded_47, module2_46_fromdown, module2_47_todown); 
module2op_48: module2 PORT MAP(module2_47_todown, module2_48_fromdown, clock, hardcoded_48, module2_47_fromdown, module2_48_todown); 
module2op_49: module2 PORT MAP(module2_48_todown, module2_49_fromdown, clock, hardcoded_49, module2_48_fromdown, module2_49_todown); 
module2op_50: module2 PORT MAP(module2_49_todown, module2_50_fromdown, clock, hardcoded_50, module2_49_fromdown, module2_50_todown); 
module2op_51: module2 PORT MAP(module2_50_todown, module2_51_fromdown, clock, hardcoded_51, module2_50_fromdown, module2_51_todown); 
module2op_52: module2 PORT MAP(module2_51_todown, module2_52_fromdown, clock, hardcoded_52, module2_51_fromdown, module2_52_todown); 
module2op_53: module2 PORT MAP(module2_52_todown, module2_53_fromdown, clock, hardcoded_53, module2_52_fromdown, module2_53_todown); 
module2op_54: module2 PORT MAP(module2_53_todown, module2_54_fromdown, clock, hardcoded_54, module2_53_fromdown, module2_54_todown); 
module2op_55: module2 PORT MAP(module2_54_todown, module2_55_fromdown, clock, hardcoded_55, module2_54_fromdown, module2_55_todown); 
module2op_56: module2 PORT MAP(module2_55_todown, module2_56_fromdown, clock, hardcoded_56, module2_55_fromdown, module2_56_todown); 
module2op_57: module2 PORT MAP(module2_56_todown, module2_57_fromdown, clock, hardcoded_57, module2_56_fromdown, module2_57_todown); 
module2op_58: module2 PORT MAP(module2_57_todown, module2_58_fromdown, clock, hardcoded_58, module2_57_fromdown, module2_58_todown); 
module2op_59: module2 PORT MAP(module2_58_todown, module2_59_fromdown, clock, hardcoded_59, module2_58_fromdown, module2_59_todown); 
module2op_60: module2 PORT MAP(module2_59_todown, module2_60_fromdown, clock, hardcoded_60, module2_59_fromdown, module2_60_todown); 
module2op_61: module2 PORT MAP(module2_60_todown, module2_61_fromdown, clock, hardcoded_61, module2_60_fromdown, module2_61_todown); 
module2op_62: module2 PORT MAP(module2_61_todown, module2_62_fromdown, clock, hardcoded_62, module2_61_fromdown, module2_62_todown); 
module3op: module3 PORT MAP(module2_62_todown, clock, hardcoded_63, module2_62_fromdown); 
end Behavioral; 

