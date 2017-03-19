//referenced from: http://elinux.org/RPi_GPIO_Code_Samples , https://www.cs.uaf.edu/2016/fall/cs301/lecture/11_09_raspberry_pi.html

#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#include "cgpio.h"


#define BLOCK_SIZE 4096



unsigned int *gpio;



int CGPIO_initialize() {
	
	int fdgpio = open("/dev/gpiomem", O_RDWR);
	if (fdgpio < 0) {
		printf("Error opening /dev/gpiomem\n");
		return -1;
	}
	
	gpio = (unsigned int *) mmap(0, BLOCK_SIZE, PROT_READ+PROT_WRITE, MAP_SHARED, fdgpio, 0);
	if (gpio == MAP_FAILED) {
		printf("mmap error %d\n", (int)gpio);
		return -1;
	}
	
	close(fdgpio);
	
	return 0;
	
}



int CGPIO_finalize() {
	
	if (munmap((void *) gpio, BLOCK_SIZE) < 0) {
		printf("GPIO memory unmap failed.\n");
		return -1;
	}
	return 0;
	
}



void CGPIO_setDirection(int pin, int direction) {
	
	if (pin < 2 || pin > 27) return;
	
	unsigned int *gpio_config;
	if (pin < 10) gpio_config = &gpio[0];
	else gpio_config = &gpio[1];
	
	*gpio_config &= (~(0b111)) << (3 * pin); //set the pin to 000 configuration which is also input cinfiguration.
	if (direction == GPIO_OUT) {
		*gpio_config += 0b001 << (3 * pin);
	}
	
}



void CGPIO_set(int pin, int bit) {
	
	if (pin < 2 || pin > 27) return;
	
	if (bit == HIGH) gpio[7] |= 1<<pin;
	else gpio[10] |= 1<<pin;
	
}





int CGPIO_get(int pin) {
	
	if (pin < 2 || pin > 27) return -1;
	
	if (gpio[13] & 1<<pin) return HIGH;
	else return LOW;
	
}






















