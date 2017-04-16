
#include <sstream>

#define CAUSAL_FIR_FILTER_VHDL_HEAD \
"\n"\
"library IEEE; \n"\
"use IEEE.STD_LOGIC_1164.ALL; \n"\
"\n"\
"entity threesamplefilter is \n"\
"\tPort ( input : in  STD_LOGIC_VECTOR (7 downto 0); \n"\
"\t\tclock : in  STD_LOGIC; \n"\
"\t\toutput : out  STD_LOGIC_VECTOR (7 downto 0)); \n"\
"end threesamplefilter; \n"\
"\n"\
"architecture Behavioral of threesamplefilter is \n"\
"\n"\
"component module1 is \n"\
"\tPort ( input : in  STD_LOGIC_VECTOR (7 downto 0); \n"\
"\t\tterm : in  STD_LOGIC_VECTOR (7 downto 0); \n"\
"\t\thardcoded : in std_logic_vector (7 downto 0); \n"\
"\t\toutput : out  STD_LOGIC_VECTOR (7 downto 0)); \n"\
"end component; \n"\
"\n"\
"component module2 is \n"\
"\tPort ( input : in  STD_LOGIC_VECTOR (7 downto 0); \n"\
"\t\tterm : in  STD_LOGIC_VECTOR (7 downto 0); \n"\
"\t\tclock : in  STD_LOGIC; \n"\
"\t\thardcoded : in std_logic_vector (7 downto 0); \n"\
"\t\toutput : out  STD_LOGIC_VECTOR (7 downto 0); \n"\
"\t\tfout : out  STD_LOGIC_VECTOR (7 downto 0)); \n"\
"end component; \n"\
"\n"\
"component module3 is \n"\
"\tPort ( input : in  STD_LOGIC_VECTOR (7 downto 0); \n"\
"\t\tclock : in  STD_LOGIC; \n"\
"\t\thardcoded : in std_logic_vector (7 downto 0); \n"\
"\t\toutput : out  STD_LOGIC_VECTOR (7 downto 0)); \n"\
"end component; \n"\
"\n"


string CAUSAL_FIR_FILTER_VHDL_HARDCODED(int N, string VAL) {
    stringstream ss("");
    ss << "signal hardcoded_" << N << ": std_logic_vector(7 downto 0) := \"" << VAL << "\"; \n";
    return ss.str();
}


#define CAUSAL_FIR_FILTER_VHDL_M1_TERM \
"signal module1_term: std_logic_vector(7 downto 0); \n"


string CAUSAL_FIR_FILTER_VHDL_M2_SIGNALS(int N) {
    stringstream ss("");
    ss << "signal module2_" << N << "_todown, module2_" << N << "_fromdown : std_logic_vector(7 downto 0); \n";
    return ss.str();
}


#define CAUSAL_FIR_FILTER_VHDL_BEHAVIORAL_BEGIN \
"begin \n"


#define CAUSAL_FIR_FILTER_VHDL_M1_MAP \
"module1op: module1 PORT MAP(input, module1_term, hardcoded_0, output); \n"


#define CAUSAL_FIR_FILTER_VHDL_M2_1_MAP \
"module2op_1: module2 PORT MAP(input, module2_1_fromdown, clock, hardcoded_1, module1_term, module2_1_todown); \n"

string CAUSAL_FIR_FILTER_VHDL_M2_MAP(int N) {
    stringstream ss("");
    ss << "module2op_" << N << ": module2 PORT MAP(module2_" << N-1 << "_todown, module2_" << N << "_fromdown, clock, hardcoded_" << N << ", module2_" << N-1 << "_fromdown, module2_" << N << "_todown); \n";
    return ss.str();
}

string CAUSAL_FIR_FILTER_VHDL_M3_MAP(int N) {
    stringstream ss("");
    ss << "module3op: module3 PORT MAP(module2_" << N-1 << "_todown, clock, hardcoded_" << N << ", module2_" << N-1 << "_fromdown); \n";
    return ss.str();
}


#define CAUSAL_FIR_FILTER_VHDL_BEHAVIORAL_END \
"end Behavioral; \n"

