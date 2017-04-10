#include "fpga-program.h"

class FpgaCausalFirFilter : public FpgaProgram {

public:
    FpgaCausalFirFilter(); //initializes with kronecker delta as the filter. Filter can be set afterwords.
    FpgaCausalFirFilter(char *filterSignal, int filterLength);

    void setFilter(char *filterSignal, int filterLength);
    void getFilter(char *filterSignal, int *filterLength);

    void filter(char *input, int inputLength, char *output);

private:
    char *8BitFilterSignal; //to be hardcoded to the FPGA board.
    int filterLength;
    

};