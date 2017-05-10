#include "fpga-comm.h"
#include "gpio-map.h"
#include <wiringPi.h>
#include <iostream>

using namespace std;



int in_bits[] = {IN_BIT0,
				 IN_BIT1,
				 IN_BIT2,
				 IN_BIT3};

int out_bits[] = {OUT_BIT0,
				  OUT_BIT1,
				  OUT_BIT2,
				  OUT_BIT3};



int FPGA_Comm::initialize() {
	
	if (wiringPiSetupGpio () == -1) {
		cout << "FPGA_Comm::initialize(): wiringPi setup failed." << endl;
		return -1;
	}

	for (int i=0; i<4; i++) {
		pinMode(out_bits[i], OUTPUT);
		pinMode(in_bits[i], INPUT);
	}

	pinMode(CLOCK_BIT, OUTPUT);
	pinMode(WRITE_MUX, OUTPUT);
	pinMode(READ_MUX, OUTPUT);
	
	return 0;
}

int FPGA_Comm::finalize() {
	return 0;
}



void FPGA_Comm::writeChar(char ch) {

	for (int i=0; i<4; i++) {

		digitalWrite(out_bits[i], (ch%2 == 0 ? LOW : HIGH));
		ch >>= 1;

	}
	
}

char FPGA_Comm::readChar() {
	
	char ch = 0;
	
	for (int i=3; i>=0; i--) {
		ch <<= 1;
		if (digitalRead(in_bits[i]) == HIGH) ch += 1;
	}
	
	return ch;
}


void FPGA_Comm::setClock(int val) {
	digitalWrite(CLOCK_BIT, (val==1 ? HIGH : LOW) );
}


void FPGA::Comm::writeMux(int val) {
	digitalWrite(WRITE_MUX, (val == MS4B ? HIGH : LOW) );
}


void FPGA::Comm::readMux(int val) {
	digitalWrite(READ_MUX, (val == MS4B ? HIGH : LOW) );
}




