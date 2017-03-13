
#define GPIO_IN     0
#define GPIO_OUT    1

#define HIGH    1
#define LOW     0

namespace GPIO {
extern "C" {

    int initialize();
    int finalize();

    void setDirection(int pin, int direction);
    void set(int pin, int bit);
    int get(int pin);

}
}

