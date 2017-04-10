#include "fpga-loader/fpga-loader.h"
#include <iostream>


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

    if (FpgaLoader.getInstance()->load() != 0) {
        cout << "FpgaProgram::loadVhdl(): Loading VHDL to board failed." << endl;
        return -1;
    }

    return 0;

}