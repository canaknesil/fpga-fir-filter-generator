
#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

int main() {
    
    int fdgpio = open("/dev/gpiomem", O_RDWR);
    if (fdgpio < 0) {
        printf("Error opening /dev/gpiomem\n");
        return -1;
    }

    unsigned int *gpio = (unsigned int *) mmap(0, 4096, PROT_READ+PROT_WRITE, MAP_SHARED, fdgpio, 0);

	
	gpio[0] = 0b001000000;
    gpio[7] = 0;
	
	while (1) {
		sleep(1);
		gpio[7] = 1<<2;
		sleep(1);
		gpio[10] = 1<<2;
	}


    return 0;
}