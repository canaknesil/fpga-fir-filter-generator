#include "fpga-program.h"
#include <vector>
#include <string>


using namespace std;


#define FIXED_POINT_SCALE 7
#define FIXED_POINT_SCALE_N (1 << FIXED_POINT_SCALE)



class FpgaCausalFirFilter : public FpgaProgram {

public:
    FpgaCausalFirFilter(); //initializes with kronecker delta as the filter. Filter can be set afterwords.
    FpgaCausalFirFilter(vector<float> filterSignal);

    void setFilter(vector<float> filterSignal);
    vector<float> getFilter();
    int getFilterLength();

    static vector<char> filter(const vector<char> &input);
    static vector<char> filter(const vector<char> &intput, int filterSize);

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