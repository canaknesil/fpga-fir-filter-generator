#include <iostream>
#include "fpga-loader.h"

using namespace std;



int main() {
	
	FpgaLoader *loader = FpgaLoader::getInstance();
	loader->load();
	
	return 0;
}

