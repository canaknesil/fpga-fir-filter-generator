#include "fpga-causal-fir-filter.h"
#include <iostream>

using namespace std;

int main() {

    vector<char> input;
	input.push_back(10);
	input.push_back(20);
	input.push_back(30);
	input.push_back(20);
	input.push_back(10);

	vector<char> output = FpgaCausalFirFilter::filter(input);
	//cout << output.size() << endl;
	for (int i=0; i<output.size(); i++) {
        cout << (int) output[i] << endl;
    }

    return 0;
}
