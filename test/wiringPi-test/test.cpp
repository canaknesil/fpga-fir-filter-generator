#include <iostream>
#include <wiringPi.h>

int main() {

    if (wiringPiSetup () == -1) return 1;

    for (int i=2; i<28; i++) {
        pinMode(i, OUTPUT);
        digitalWrite(i, 1);
    }

    while(1);


    return 0;

}