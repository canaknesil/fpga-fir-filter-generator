#include "fpga-causal-fir-filter.h"
#include <iostream>

using namespace std;

int main() {

    vector<char> input;
	input.push_back(0);
	input.push_back(0);
	input.push_back(0);
	input.push_back(0);
	input.push_back(0);
	input.push_back(100);
	input.push_back(150);
	input.push_back(200);
	input.push_back(150);
	input.push_back(100);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);
	input.push_back(100);
        input.push_back(150);
        input.push_back(200);
        input.push_back(150);
        input.push_back(100);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);


	vector<char> output = FpgaCausalFirFilter::filter(input);
	//cout << output.size() << endl;
	for (int i=0; i<output.size(); i++) {
        cout << (int) output[i] << endl;
    }

    return 0;
}
