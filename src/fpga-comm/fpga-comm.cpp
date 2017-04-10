#include "fpga-comm.h"
#include "gpio-map.h"
#include <wiringPi.h>
#include <iostream>



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
	
	if (wiringPiSetupGpio () == -1) {
		cout << "FPGA_Comm::initialize(): wiringPi setup failed." << endl;
		return -1;
	}

	for (int i=0; i<8; i++) {
		pinMode(out_bits[i], OUTPUT);
		pinMode(in_bits[i], INPUT);
	}
	
	return 0;
}

int FPGA_Comm::finalize() {
	return 0;
}



void FPGA_Comm::writeChar(char ch) {

	for (int i=0; i<8; i++) {

		digitalWrite(out_bits[i], (ch%2 == 0 ? LOW : HIGH));
		ch >>= 1;

	}
	
}

char FPGA_Comm::readChar() {
	
	char ch = 0;
	
	for (int i=7; i>=0; i--) {
		ch <<= 1;
		if (digitalRead(in_bits[i]) == HIGH) ch += 1;
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












