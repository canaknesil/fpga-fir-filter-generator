#include <iostream>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include "fpga-loader.h"

using namespace std;

//Related to singleton pattern
FpgaLoader *FpgaLoader::instance = NULL;

FpgaLoader::FpgaLoader() {

}

FpgaLoader *FpgaLoader::getInstance() {
    if (instance == NULL) instance = new FpgaLoader();
    return instance;
}

//public
string FpgaLoader::getVhdlPath() {
    return vhdlPath;
}

int FpgaLoader::load() {
    cout << "FpgaLoader::load(): Has not been implemented yet. Load manually." << endl;
    return 0;
}

//private
string FpgaLoader::vhdlPath = ""; //current directory


