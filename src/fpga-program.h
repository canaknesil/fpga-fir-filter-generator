
#include <unistd.h>


class FpgaProgram {

public:
    int load();

protected:
    virtual int generateVhdl() = 0;

    static void delay();

private:
    int loadVhdl();

    static useconds_t delayusec;

};
