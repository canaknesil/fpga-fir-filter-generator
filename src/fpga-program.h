
class FpgaProgram {

public:
    int load();

protected:
    int generateVhdl() = 0;

private:
    int loadVhdl();

};
