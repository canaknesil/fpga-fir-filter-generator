LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 

ENTITY FullAdder IS     
	PORT (A: IN std_logic; B: IN std_logic; Cin: IN std_logic; Sum: OUT std_logic; Cout: OUT std_logic);
END FullAdder; 

ARCHITECTURE FullAdder_struct OF FullAdder IS 

COMPONENT and_gate IS PORT (x, y: IN std_logic; z: OUT std_logic); 
END COMPONENT;

COMPONENT xor_gate IS PORT (x, y: IN std_logic; z: OUT std_logic); 
END COMPONENT; 

COMPONENT or_gate IS PORT (x, y: IN std_logic; z: OUT std_logic); 
END COMPONENT; 

SIGNAL XOR2_0_out, AND2_0_out, AND2_1_out, AND2_2_out, OR2_0_out: std_logic; 

BEGIN
    	XOR2_0: xor_gate PORT MAP(A, B, XOR2_0_out);     
	XOR2_1: xor_gate PORT MAP(XOR2_0_out, Cin, Sum);     
	AND2_0: and_gate PORT MAP(A, B, AND2_0_out);     
	AND2_1: and_gate PORT MAP(A, Cin, AND2_1_out);     
	AND2_2: and_gate PORT MAP(B, Cin, AND2_2_out);
    	OR2_0: or_gate PORT MAP(AND2_0_out, AND2_1_out, OR2_0_out); 
	OR2_1: or_gate PORT MAP(AND2_2_out, OR2_0_out, Cout);
END FullAdder_struct;