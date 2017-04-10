#include <iostream>
#include "fpga-loader.h"

using namespace std;


FpgaLoader *FpgaLoader::instance = NULL;

FpgaLoader::FpgaLoader() {

}

FpgaLoader *FpgaLoader::getInstance() {
    if (instance == NULL) instance = new FpgaLoader();
    return instance;
}




int FpgaLoader::load() {
    cout << "Has not been implemented yet. Load manually." <<endl;
    return 0;
}