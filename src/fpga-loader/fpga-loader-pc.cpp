#include <iostream>
#include <stdlib.h>
#include "fpga-loader.h"

using namespace std;


int FpgaLoader::load() {
    system("./loadFir.sh");
    return 0;
}

