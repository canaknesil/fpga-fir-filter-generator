#include "fpga-program.h"
#include <vector>
#include <string>


using namespace std;


class FpgaCausalFirFilter : public FpgaProgram {

public:
    FpgaCausalFirFilter(); //initializes with kronecker delta as the filter. Filter can be set afterwords.
    FpgaCausalFirFilter(vector<float> filterSignal);

    void setFilter(vector<float> filterSignal);
    vector<float> getFilter();
    int getFilterLength();

    vector<char> filter(const vector<char> &input);

protected:
    int generateVhdl();

private:
    vector<char> filterSignal8Bit; //to be hardcoded to the FPGA board.
    
    void setFilter(vector<char> filterSignal);
    vector<char> getFilter8Bit();

    string generateVhdlCode();

    char convertToFixed(float f);
    float convertFromFixed(char ch);
    
};