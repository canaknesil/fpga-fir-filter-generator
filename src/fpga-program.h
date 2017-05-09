
#include <unistd.h>


class FpgaProgram {

public:
    int load();

protected:

    static useconds_t delay;

    virtual int generateVhdl() = 0;

private:
    int loadVhdl();

};
