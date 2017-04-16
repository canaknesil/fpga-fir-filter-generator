#include "fpga-causal-fir-filter.h"
#include "fpga-loader/fpga-loader.h"
#include "causal-fir-filter-vhdl.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <bitset>

using namespace std;


//from FpgaProgram superclass
int FpgaCausalFirFilter::generateVhdl() {
    
    string path = FpgaLoader::getInstance()->getVhdlPath();
    string vhdlCode = generateVhdlCode();

    ofstream vhdlFile;
    vhdlFile.open((path + "causalFirFilter.vhdl").c_str());
    vhdlFile << vhdlCode << endl;
    vhdlFile.close();

    return 0;
}



//public
FpgaCausalFirFilter::FpgaCausalFirFilter() {
    vector<char> impulse;
    impulse.push_back(1);
    this->setFilter(impulse);
}

FpgaCausalFirFilter::FpgaCausalFirFilter(vector<char> filterSignal) {
    this->setFilter(filterSignal);
}


void FpgaCausalFirFilter::setFilter(vector<char> filterSignal) {
    for (int i = filterSignal.size(); i<3; i++) {
        filterSignal.push_back(0);
    }
    this->FilterSignal8Bit = filterSignal;
}

vector<char> FpgaCausalFirFilter::getFilter() {
    return this->FilterSignal8Bit;
}

int FpgaCausalFirFilter::getFilterLength() {
    return FilterSignal8Bit.size();
}

vector<char> FpgaCausalFirFilter::filter(const vector<char> &input) {
    //TODO using fpga-comm.h
    cout << "FpgaCausalFirFilter::filter(): Has not been implemented yet." << endl;
    vector<char> output;
    return output;
}



//private

string FpgaCausalFirFilter::generateVhdlCode() {
    string vhdlCode = "";

    vhdlCode += CAUSAL_FIR_FILTER_VHDL_HEAD;

    int size = this->getFilterLength();
    vector<char> filter = this->getFilter();

    for (int i=0; i<size; i++) {
        vhdlCode += CAUSAL_FIR_FILTER_VHDL_HARDCODED(i, bitset<8>(filter.at(i)).to_string());
    }
    vhdlCode += "\n";

    vhdlCode += CAUSAL_FIR_FILTER_VHDL_M1_TERM;
    vhdlCode += "\n";

    for (int i=1; i < size-1; i++) {
        vhdlCode += CAUSAL_FIR_FILTER_VHDL_M2_SIGNALS(i);
    }
    vhdlCode += "\n";

    vhdlCode += CAUSAL_FIR_FILTER_VHDL_BEHAVIORAL_BEGIN;
    vhdlCode += "\n";

    vhdlCode += CAUSAL_FIR_FILTER_VHDL_M1_MAP;
    vhdlCode += CAUSAL_FIR_FILTER_VHDL_M2_1_MAP;

    for (int i=2; i < size-1; i++) {
        vhdlCode += CAUSAL_FIR_FILTER_VHDL_M2_MAP(i);
    }

    vhdlCode += CAUSAL_FIR_FILTER_VHDL_M3_MAP(size-1);

    vhdlCode += CAUSAL_FIR_FILTER_VHDL_BEHAVIORAL_END;


    return vhdlCode;
}