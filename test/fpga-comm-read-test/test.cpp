#include <iostream>
#include "fpga-comm.h"

using namespace FPGA_Comm;
using namespace std;

int ch;

void write_read_print() {

	int ch;
	cout << "Write: ";
	cin >> ch;

	writeChar(ch);
	char readCh = readChar();
	cout << "Read: " << (int) readCh << endl;

}

int main() {
	
	initialize();

	while (true) {
		write_read_print();
	}

	return 0;
}

