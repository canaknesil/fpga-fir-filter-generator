#include <iostream>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
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
    system("./loadFir.sh");
    return 0;
}

//private
string FpgaLoader::vhdlPath = "../vhdl-build/"; //current directory


