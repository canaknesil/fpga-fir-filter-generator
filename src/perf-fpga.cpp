#include "fpga-causal-fir-filter.h"
#include "myfilter.h"
#include <iostream>

using namespace std;

#define SIZE 33
float *rawfilter = &filter33[0];

int main() {

    vector<char> thefilter;
    for (int i=0 i<SIZE; i++) {
        thefilter.push_back(floor(256 * rawfilter[i] + 0.5));
    }

    FpgaCausalFirFilter f(filter);

	if (f.load() == 0) cout << "FIR Filter is loaded successfully." << endl;
    else cout << "Failed to load FIR Filter." << endl;

    return 0;

}