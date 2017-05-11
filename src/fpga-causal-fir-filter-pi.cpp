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
    
    //write 8 bits
    writeChar(ch);
    delay();

   //run the clock for fpga
    setClock(HIGH);
    delay();
    setClock(LOW);
    delay();

    //read least significant 4 bits
    char readCh = 0;

    readMux(LS4B);
    delay();
    readCh = readChar();

    //read most significant 4 bits
    readCh <<= 4;
    readMux(MS4B);
    delay();
    readCh += readChar();
    
    return readCh;

}
