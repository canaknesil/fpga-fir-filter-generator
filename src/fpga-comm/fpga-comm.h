
#define HIGH 1
#define LOW 0

#define MS4B 1
#define LS4B 0

namespace FPGA_Comm {
	
	int initialize();
	int finalize();
	
	void writeChar(char ch); //only writes loast significant 4 bits
	char readChar(); ////only reads loast significant 4 bits

	void setClock(int val);

	void writeMux(int val);
	void readMux(int val);
	
}
