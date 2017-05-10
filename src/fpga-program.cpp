#include "fpga-program.h"
#include "fpga-loader/fpga-loader.h"
#include <iostream>
#include <unistd.h>


int FpgaProgram::load() {

    if (generateVhdl() != 0) {
        cout << "FpgaProgram::load(): VHDL generation failed." << endl;
        return -1;
    }

    if (loadVhdl() != 0) {
        cout << "FpgaProgram::load(): Loading VHDL to board failed." << endl;
        return -1;
    }

    return 0;

}


int FpgaProgram::loadVhdl() {

    if (FpgaLoader::getInstance()->load() != 0) {
        cout << "FpgaProgram::loadVhdl(): Loading VHDL to board failed." << endl;
        return -1;
    }

    return 0;

}


useconds_t FpgaProgram::delay = 100000; //will be replaced with the result of escilloscobe

void FpgaProgram::delay() {
    usleep(delayusec);
}