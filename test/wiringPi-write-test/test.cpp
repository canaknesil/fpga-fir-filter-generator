#include <iostream>
#include <unistd.h>
#include <wiringPi.h>

#define PIN 3

int main() {

    if (wiringPiSetupGpio () == -1) return 1;

    for (int i=2; i<28; i++) {
        pinMode(i, OUTPUT);
    }

    while(1) {
        digitalWrite(PIN, 1);
        usleep(500000);
        digitalWrite(PIN, 0);
        usleep(500000);
    }


    return 0;

}
