#include <iostream>
#include <unistd.h>
#include "fpga-comm.h"

using namespace FPGA_Comm;
using namespace std;

int ch;

void read_print() {

	char readCh = readChar();
	cout << (int) readCh << endl;
	usleep(200000);

}

int main() {
	
	initialize();

	while (true) {
		read_print();
	}

	return 0;
}

