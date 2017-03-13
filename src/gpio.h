
#include "cgpio.h"

#define GPIO_IN     0
#define GPIO_OUT    1

#define HIGH    1
#define LOW     0

namespace GPIO {

	int initialize() {return CGPIO_initialize();}
	int finalize() {return CGPIO_finalize();}

	void setDirection(int pin, int direction) {
		CGPIO_setDirection(pin, direction);
	}
	
	void set(int pin, int bit) {
		CGPIO_set(pin, bit);
	}
	
	int get(int pin) {
		return CGPIO_get(pin);
	}

}

