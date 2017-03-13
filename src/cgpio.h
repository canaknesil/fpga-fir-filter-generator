extern "C" {

#define GPIO_IN     0
#define GPIO_OUT    1

#define HIGH    1
#define LOW     0

int CGPIO_initialize();
int CGPIO_finalize();

void CGPIO_setDirection(int pin, int direction);
void CGPIO_set(int pin, int bit);
int CGPIO_get(int pin);

}