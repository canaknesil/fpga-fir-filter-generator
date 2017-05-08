#include "fpga-causal-fir-filter.h"
#include <iostream>

using namespace std;

int main() {

    vector<float> filter;
	filter.push_back(0.2);
	filter.push_back(0.2);
	filter.push_back(0.2);
	filter.push_back(0.2);
	filter.push_back(0.2);

	FpgaCausalFirFilter f(filter);

	if (f.load() == 0) cout << "FIR Filter is loaded successfully." << endl;
    else cout << "Failed to load FIR Filter." << endl;

    return 0;
}