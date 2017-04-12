#include "fpga-causal-fir-filter.h"
#include "fpga-loader/fpga-loader.h"
#include "causal-fir-filter-vhdl.h"
#include <fstream>
#include <vector>

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
    FilterSignal8Bit.push_back(1);
}

FpgaCausalFirFilter::FpgaCausalFirFilter(vector<char> filterSignal) {
    this->FilterSignal8Bit = filterSignal;
}


void FpgaCausalFirFilter::setFilter(vector<char> filterSignal) {
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
    vector<char> output;
    return output;
}



//private

string FpgaCausalFirFilter::generateVhdlCode() {
    //TODO
    return CAUSAL_FIR_FILTER_VHDL(5);
}