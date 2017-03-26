#include "fpga-comm.h"

#include "gpio/gpio.h"
#include "gpio-map.h"



int in_bits[] = { IN_BIT0,
				 IN_BIT1,
				 IN_BIT2,
				 IN_BIT3,
				 IN_BIT4,
				 IN_BIT5,
				 IN_BIT6,
				 IN_BIT7 };

int out_bits[] = { OUT_BIT0,
				  OUT_BIT1,
				  OUT_BIT2,
				  OUT_BIT3,
				  OUT_BIT4,
				  OUT_BIT5,
				  OUT_BIT6,
				  OUT_BIT7 };



int FPGA_Comm::initialize() {
	
	if (GPIO::initialize() < 0) {
		return -1;
	}

	for (int i=0; i<8; i++) {
		GPIO::setDirection(in_bits[i], GPIO_IN);
		GPIO::setDirection(out_bits[i], GPIO_OUT);
	}
	
	return 0;
}

int FPGA_Comm::finalize() {
	return GPIO::finalize();
}



void FPGA_Comm::writeChar(char ch) {

	for (int i=0; i<8; i++) {

		GPIO::set(out_bits[i], (ch%2 == 0 ? LOW : HIGH) );
		ch >>= 1;

	}
	
}

char FPGA_Comm::readChar() {
	
	char ch = 0;
	
	for (int i=7; i>=0; i--) {
		ch <<= 1;
		if (GPIO::get(in_bits[i]) == HIGH) ch += 1;
	}
	
	return ch;
}

//works for linear systems only
unsigned int FPGA_Comm::writeReadInt(unsigned int n) {
	
	unsigned int output = 0;
	
	for (int i=3; i>=0; i--) {
		
		writeChar((n >> i*8) & 0xFF);
		
		output <<= 8;
		output += readChar();
		
	}
	
	return output;

}

void FPGA_Comm::writeOnes() {

	for (int i=0; i<8; i++) {
		GPIO::set(out_bits[i], HIGH);
	}

}













