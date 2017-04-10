using namespace std;

class FpgaLoader {

private:
    static FpgaLoader *instance;
    FpgaLoader();

    static string vhdlPath;

public:
    static FpgaLoader *getInstance();

    string getVhdlPath();
    int load();

};