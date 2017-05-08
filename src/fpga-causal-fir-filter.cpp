#include "fpga-causal-fir-filter.h"
#include "fpga-loader/fpga-loader.h"
#include "causal-fir-filter-vhdl.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <bitset>
#include <cmath>


using namespace std;


//from FpgaProgram superclass
int FpgaCausalFirFilter::generateVhdl() {
    
    string path = FpgaLoader::getInstance()->getVhdlPath();
    string vhdlCode = generateVhdlCode();

    ofstream vhdlFile;
    vhdlFile.open((path + "causalFirFilter.vhd").c_str());
    vhdlFile << vhdlCode << endl;
    vhdlFile.close();

    return 0;
}



//public
FpgaCausalFirFilter::FpgaCausalFirFilter() {
    vector<float> impulse;
    impulse.push_back(1);
    this->setFilter(impulse);
}

FpgaCausalFirFilter::FpgaCausalFirFilter(vector<float> filterSignal) {
    this->setFilter(filterSignal);
}


void FpgaCausalFirFilter::setFilter(vector<float> filterSignal) {

    vector<char> fixedFilterSig;
    int size = filterSignal.size();

    for (int i=0; i<size; i++) {
        fixedFilterSig.push_back(convertToFixed(filterSignal[i]));
    }

    //if filter size is smaller than 3, fill with zeros
    for (int i = size; i<3; i++) {
        fixedFilterSig[i] = 0;
    }

    this->setFilter(fixedFilterSig);

}

//private
void FpgaCausalFirFilter::setFilter(vector<char> filterSignal) {
    this->filterSignal8Bit = filterSignal;
}

vector<float> FpgaCausalFirFilter::getFilter() {
    vector<float> result;
    for (int i=0; i<getFilterLength(); i++) {
        result.push_back(convertFromFixed(this->filterSignal8Bit[i]));
    }
    return result;
}

vector<char> FpgaCausalFirFilter::getFilter8Bit() {
    return this->filterSignal8Bit;
}

int FpgaCausalFirFilter::getFilterLength() {
    return filterSignal8Bit.size();
}



char FpgaCausalFirFilter::convertToFixed(float f) {
    char ch = (char) floor(f * FIXED_POINT_SCALE_N + 0.5);
    //cout << f << endl;
    return ch;
}

float FpgaCausalFirFilter::convertFromFixed(char ch) {
    float f = ((float) ch) / FIXED_POINT_SCALE_N;
    //cout << f << endl;
    return f;
}



//private
string FpgaCausalFirFilter::generateVhdlCode() {
    string vhdlCode = "";

    vhdlCode += CAUSAL_FIR_FILTER_VHDL_HEAD;

    int size = this->getFilterLength();
    vector<char> filter = this->getFilter8Bit();

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