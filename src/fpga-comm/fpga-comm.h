
#define HIGH 1
#define LOW 0

namespace FPGA_Comm {
	
	int initialize();
	int finalize();
	
	void writeChar(char ch);
	char readChar();

	void setClock(int val);
	
}
