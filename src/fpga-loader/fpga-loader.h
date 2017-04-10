
class FpgaLoader {

private:
    static FpgaLoader *instance;
    FpgaLoader();

public:
    static FpgaLoader *getInstance();

    int load();

};