#include "fpga-causal-fir-filter.h"
#include "filters.h"
#include <iostream>
#include <cmath>

using namespace std;

#define SIZE 33
float *rawfilter = &filter33[0];

int main() {

    vector<float> thefilter;
    for (int i=0; i<SIZE; i++) {
        thefilter.push_back(rawfilter[i]);
    }

    FpgaCausalFirFilter f(thefilter);

	if (f.load() == 0) cout << "FIR Filter is loaded successfully." << endl;
    else cout << "Failed to load FIR Filter." << endl;

    return 0;

}

/*
int main() {

    vector<float> filter;
	//filter.push_back(0.2);
	//filter.push_back(0.2);
	//filter.push_back(0.2);
	//filter.push_back(0.2);
	//filter.push_back(0.2);

	for (int i=0; i<64; i++) {
		filter.push_back(0.25);
	}

	FpgaCausalFirFilter f(filter);

	if (f.load() == 0) cout << "FIR Filter is loaded successfully." << endl;
    else cout << "Failed to load FIR Filter." << endl;

    return 0;
}
*/



