
class FpgaProgram {

public:
    int load();

protected:
    virtual int generateVhdl() = 0;

private:
    int loadVhdl();

};
