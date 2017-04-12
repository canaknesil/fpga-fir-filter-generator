#include "fpga-program.h"
#include <vector>
#include <string>

using namespace std;

class FpgaCausalFirFilter : public FpgaProgram {

public:
    FpgaCausalFirFilter(); //initializes with kronecker delta as the filter. Filter can be set afterwords.
    FpgaCausalFirFilter(vector<char> filterSignal);

    void setFilter(vector<char> filterSignal);
    vector<char> getFilter();
    int getFilterLength();

    vector<char> filter(const vector<char> &input);

protected:
    int generateVhdl();

private:
    vector<char> FilterSignal8Bit; //to be hardcoded to the FPGA board.

    string generateVhdlCode();
    
};