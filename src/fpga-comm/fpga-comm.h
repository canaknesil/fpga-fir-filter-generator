
namespace FPGA_Comm {
	
	int initialize();
	int finalize();
	
	void writeChar(char ch);
	char readChar();
	
	unsigned int writeReadInt(unsigned int n); //works for linear systems only
	
}