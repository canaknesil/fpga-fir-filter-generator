
#include <iostream>
#include <unistd.h>

#include "gpio.h"

using namespace std;

int main() {

	if (GPIO::initialize() < 0) {
		cout << "can't initialize GPIO" << endl;
		return -1;
	}

	cout << "Debug: initialized" <<endl;
	GPIO::setDirection(2, GPIO_OUT);
	cout << "Debug: set direction" <<endl;
	while (1) {
		sleep(1);
		GPIO::set(2, LOW);
		cout << "Debug: set low" <<endl;
		sleep(1);
		GPIO::set(2, HIGH);
		cout << "Debug: set high" <<endl;
	}


	return 0;
}
