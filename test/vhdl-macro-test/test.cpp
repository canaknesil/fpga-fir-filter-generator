#include <iostream>
#include "causal-fir-filter-vhdl.h"

using namespace std;



int main() {
	
	cout << CAUSAL_FIR_FILTER_VHDL(1, 1, 1, 3, 4, 2, 2, 1) << endl;
	return 0;
}

