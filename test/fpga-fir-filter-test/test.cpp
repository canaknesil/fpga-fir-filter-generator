#include <iostream>
#include "fpga-causal-fir-filter.h"

using namespace std;

int main() {
	
	vector<char> filter;
	filter.push_back(2);
	filter.push_back(2);
	filter.push_back(2);
	filter.push_back(2);
	filter.push_back(2);
	FpgaCausalFirFilter f(filter);
	vector<char> fs = f.getFilter();

	for (int i=0; i<fs.size(); i++) {
		cout << (int) fs.at(i) << endl;
	}

	f.load();
	
	return 0;
}

