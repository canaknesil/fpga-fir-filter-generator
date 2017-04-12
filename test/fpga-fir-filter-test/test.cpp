#include <iostream>
#include "fpga-causal-fir-filter.h"

using namespace std;

int main() {
	
	FpgaCausalFirFilter f;
	vector<char> fs = f.getFilter();

	for (int i=0; i<fs.size(); i++) {
		cout << (int) fs.at(i) << endl;
	}

	f.load();
	
	return 0;
}

