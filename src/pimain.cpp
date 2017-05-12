#include "fpga-causal-fir-filter.h"
#include <iostream>
#include <ctime>
#include <fstream>

using namespace std;

#define INSIZE 10000

#define PATH "../resources/soundfiles/piano.wav"
#define DEST "../resources/soundfiles/filteredpiano.wav"


char ChunkID[4], Format[4], Subchunk1ID[4],Subchunk2ID[4];
int ChunkSize,Subchunk1Size, SampleRate, ByteRate,Subchunk2Size;
short AudioFormat, NumChannels, BlockAlign, BitsPerSample;
short *Data;

void readwav();
void writewav();


int main() {
//cout << 1 << endl;
        //readwav();
//cout << 2 << endl;
        vector<char> input;
        for (int i=0; i<INSIZE; i++) {
                input.push_back(5);
        }
//cout << 3 << endl;
        clock_t begin = clock();
        vector<char> output = FpgaCausalFirFilter::filter(input);
        clock_t end = clock();
        double elapsed_secs = double(end - begin) / CLOCKS_PER_SEC;

	for (int i=0; i<INSIZE; i++) cout << (int) output[i] << endl;

        cout << "Filtering time (secs): " << elapsed_secs << endl;
//cout << 4 << endl;
        //writewav();
//cout << 5 << endl;
        return 0;
}




void readwav() {
	// Read the wave file
	FILE *fhandle=fopen(PATH,"rb");
cout << "q" << endl;
	fread(ChunkID,1,4,fhandle);
cout << "e" << endl;
	fread(&ChunkSize,4,1,fhandle);
	fread(Format,1,4,fhandle);
	fread(Subchunk1ID,1,4,fhandle);
	fread(&Subchunk1Size,4,1,fhandle);
	fread(&AudioFormat,2,1,fhandle);
	fread(&NumChannels,2,1,fhandle);
	fread(&SampleRate,4,1,fhandle);
	fread(&ByteRate,4,1,fhandle);
	fread(&BlockAlign,2,1,fhandle);
	fread(&BitsPerSample,2,1,fhandle);
	fread(&Subchunk2ID,1,4,fhandle);
	fread(&Subchunk2Size,4,1,fhandle);
cout << "w" << endl;
	Data=new short [Subchunk2Size/(BitsPerSample/8)]; // Create an element for every sample
	fread(Data,BitsPerSample/8,Subchunk2Size/(BitsPerSample/8),fhandle); // Reading raw audio data
	fclose(fhandle);
}

void writewav() {
	// Write the same file
	FILE *fhandle=fopen(DEST,"wb");
	fwrite(ChunkID,1,4,fhandle);
	fwrite(&ChunkSize,4,1,fhandle);
	fwrite(Format,1,4,fhandle);
	fwrite(Subchunk1ID,1,4,fhandle);
	fwrite(&Subchunk1Size,4,1,fhandle);
	fwrite(&AudioFormat,2,1,fhandle);
	fwrite(&NumChannels,2,1,fhandle);
	fwrite(&SampleRate,4,1,fhandle);
	fwrite(&ByteRate,4,1,fhandle);
	fwrite(&BlockAlign,2,1,fhandle);
	fwrite(&BitsPerSample,2,1,fhandle);
	fwrite(&Subchunk2ID,1,4,fhandle);
	fwrite(&Subchunk2Size,4,1,fhandle);
	fwrite(Data,BitsPerSample/8,Subchunk2Size/(BitsPerSample/8),fhandle);

	fclose(fhandle);
}



/*
int main() {

    vector<char> input;
	input.push_back(0);
	input.push_back(0);
	input.push_back(0);
	input.push_back(0);
	input.push_back(0);
	input.push_back(100);
	input.push_back(150);
	input.push_back(200);
	input.push_back(150);
	input.push_back(100);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);
	input.push_back(100);
        input.push_back(150);
        input.push_back(200);
        input.push_back(150);
        input.push_back(100);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);
        input.push_back(0);


	vector<char> output = FpgaCausalFirFilter::filter(input);
	//cout << output.size() << endl;
	for (int i=0; i<output.size(); i++) {
        cout << (int) output[i] << endl;
    }

    return 0;
}
*/



