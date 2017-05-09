#include "fpga-causal-fir-filter.h"
#include "fpga-loader/fpga-loader.h"
#include "fpga-comm/fpga-comm.h"
#include <vector>
#include <cmath>
#include <iostream>

using namespace FPGA_Comm;
using namespace std;



vector<char> FpgaCausalFirFilter::filter(const vector<char> &input) {
    
    return filter(input, 0);

}



vector<char> FpgaCausalFirFilter::filter(const vector<char> &input, int filterSize) {
    
    vector<char> output;
    
    if (initialize() != 0) {
        cout << "FpgaCausalFirFilter::filter(): failed to initialize wiringPi" << endl;
        return output;
    }

    int inputLength = input.size();
    int outputLength = inputLength + filterSize - 1;


    for (int i=0; i<inputLength; i++) {
        output.push_back(filterChar(input[i]));
    }

    for (int i=inputLength; i<outputLength; i++) {
        output.push_back(filterChar(0));
    }
    
    return output;
}



char FpgaCausalFirFilter::filterChar(char ch) {
    
    writeChar(ch);
    usleep(delay);

    setClock(HIGH);
    usleep(delay);

    setClock(LOW);
    usleep(delay);
    
    return readChar();

}
