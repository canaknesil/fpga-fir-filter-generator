#include <iostream>
#include <unistd.h>
#include <wiringPi.h>

using namespace std;

void read_n_display() {
    
    for (int i=2; i<28; i++) {
        usleep(1000);
        cout << "pin " << i << ": " << (digitalRead(i) == HIGH ? "HIGH" : "LOW") << endl;
    }
    cout << endl;

}

int main() {

    if (wiringPiSetupGpio () == -1) return 1;

    for (int i=2; i<28; i++) {
        pinMode(i, INPUT);
    }

    while(1) {
        read_n_display();
        usleep(100000);
    }


    return 0;

}