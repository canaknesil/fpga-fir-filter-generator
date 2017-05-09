#include "fpga-causal-fir-filter.h"
#include <iostream>

using namespace std;

int main() {

    vector<float> input;
	input.push_back(10);
	input.push_back(20);
	input.push_back(30);
	input.push_back(20);
	input.push_back(10);

	vector<float> output = FpgaCausalFirFilter::filter(input);

	for (int i=0; i<<output.size(); i++) {
        cout << output[i]; << endl;
    }

    return 0;
}
