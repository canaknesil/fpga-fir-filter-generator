#include "fpga-comm.h"

#include "gpio/gpio.h"
#include "fpga-map.h"



#define IN_BIT(n) IN_PIN##n
#define OUT_BIT(n) OUT_PIN##n



int initialize() {
	
	if (GPIO::initialize() < 0) {
		return -1;
	}
	
	for (int i=0; i<8; i++) {
		GPIO::setDirection(IN_BIT(i), GPIO_IN);
		GPIO::setDirection(OUT_BIT(i), GPIO_OUT);
	}
	
	return 0;
	
}

int finalize() {
	return GPIO::finalize();
}



void writeChar(char ch) {
	
	for (int i=0; i<8; i++) {
		if (ch % 2 == 0) GPIO::set(OUT_BIT(i), LOW);
		elseGPIO::set(OUT_BIT(i), HIGH);
		
		ch <<= 1;
	}
	
}

char readChar() {
	
	char ch = 0;
	
	for (int i=0; i<8; i++) {
		ch <<= 1;
		if (GPIO::get(IN_BIT(i)) == HIGH) ch += 1;
	}
	
	return ch;
}

//works for linear systems only
unsigned int writeReadInt(unsigned int n) {
	
	unsigned int output = 0;
	
	for (int i=3 i>=0; i--) {
		
		writeChar((n >> i*8) & 0xFF);
		
		output <<= 8;
		output += readChar();
		
	}
	
	return output;

}















