#include <iostream>
#include "fpga-loader.h"

using namespace std;



int main() {
	
	FpgaLoader *loader = FpgaLoader::getInstance();
	loader->load();
	cout << loader->getVhdlPath();
	
	return 0;
}

