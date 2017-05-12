#include "fpga-causal-fir-filter.h"
#include <iostream>
#include <ctime>
#include <fstream>

using namespace std;

#define INSIZE 10000


int main() {
        vector<char> input;
        for (int i=0; i<INSIZE; i++) {
                input.push_back(5);
        }

        clock_t begin = clock();
        vector<char> output = FpgaCausalFirFilter::filter(input);
        clock_t end = clock();
        double elapsed_secs = double(end - begin) / CLOCKS_PER_SEC;

	for (int i=0; i<INSIZE; i++) cout << (int) output[i] << endl;

        cout << "Filtering time (secs): " << elapsed_secs << endl;

        return 0;
}




/*
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
*/



