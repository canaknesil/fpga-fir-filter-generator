#include <iostream>
#include "fpga-comm.h"

using namespace FPGA_Comm;

int main() {
	
	initialize();
	writeChar(-1);
	while (true);
	
	return 0;
}

