#include <iostream>
#include "fpga-causal-fir-filter.h"

using namespace std;

int main() {
	
	vector<float> filter;
	filter.push_back(0.2);
	filter.push_back(0.2);
	filter.push_back(0.2);
	filter.push_back(0.2);
	filter.push_back(0.2);
	FpgaCausalFirFilter f(filter);
	vector<float> fs = f.getFilter();

	for (int i=0; i<fs.size(); i++) {
		cout << fs[i] << endl;
	}

	f.load();
	
	return 0;
}

