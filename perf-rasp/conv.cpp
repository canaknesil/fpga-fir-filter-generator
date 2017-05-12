#include <iostream>
#include <ctime>

#define INSIZE 10000
#define FSIZE 4097

using namespace std;


void convolve(const char Signal[/* SignalLen */], size_t SignalLen,
              const char Kernel[/* KernelLen */], size_t KernelLen,
              char Result[/* SignalLen + KernelLen - 1 */]);



int main() {


	char signal[INSIZE];
	for (int i=0; i<INSIZE; i++) signal[i] = 5;
  	char kernel[FSIZE];
	for (int i=0; i<FSIZE; i++) kernel[i] = 5;

  char result[INSIZE + FSIZE - 1];

clock_t begin = clock();
	
  convolve(signal, INSIZE,
           kernel, FSIZE,
           result);
	
clock_t end = clock();
double elapsed_secs = double(end - begin) / CLOCKS_PER_SEC;

	for (int i=0; i<INSIZE+FSIZE-1; i++) cout << (int) result[i] << endl;

        cout << "Filtering time (secs): " << elapsed_secs << endl;


	return 0;
}




void convolve(const char Signal[/* SignalLen */], size_t SignalLen,
              const char Kernel[/* KernelLen */], size_t KernelLen,
              char Result[/* SignalLen + KernelLen - 1 */])
{
  size_t n;

  for (n = 0; n < SignalLen + KernelLen - 1; n++)
  {
    size_t kmin, kmax, k;

    Result[n] = 0;

    kmin = (n >= KernelLen - 1) ? n - (KernelLen - 1) : 0;
    kmax = (n < SignalLen - 1) ? n : SignalLen - 1;

    for (k = kmin; k <= kmax; k++)
    {
      Result[n] += Signal[k] * Kernel[n - k];
    }
  }
}
