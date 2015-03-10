//sinedtmf_intr.c DTMF tone generation using lookup table
#include "DSK6713_AIC23.h"	          // codec support
#include "stdio.h"
Uint32 fs = DSK6713_AIC23_FREQ_16KHZ;	    //set sampling rate
#define DSK6713_AIC23_INPUT_MIC 0x0015
#define DSK6713_AIC23_INPUT_LINE 0x0011
Uint16 inputsource = DSK6713_AIC23_INPUT_MIC; // select input
#include <math.h>
#define PI 3.14159265358979

#define TABLESIZE 512        // size of look up table
#define SAMPLING_FREQ 16000
#define STEP_770 (float)(770 * TABLESIZE)/SAMPLING_FREQ
#define STEP_1336 (float)(1336 * TABLESIZE)/SAMPLING_FREQ
#define STEP_697 (float)(697 * TABLESIZE)/SAMPLING_FREQ
#define STEP_852 (float)(852 * TABLESIZE)/SAMPLING_FREQ
#define STEP_941 (float)(941 * TABLESIZE)/SAMPLING_FREQ
#define STEP_1209 (float)(1209 * TABLESIZE)/SAMPLING_FREQ
#define STEP_1477 (float)(1477 * TABLESIZE)/SAMPLING_FREQ
#define STEP_1633 (float)(1633 * TABLESIZE)/SAMPLING_FREQ

short sine_table[TABLESIZE];
float loopindexlow = 0.0;   	    // look up table index
float loopindexhigh = 0.0;
short i;

int inLoop = 0;
int toneCounter = 0;
int startCounter = 0;
int dip0state = 1;
int dip1state = 1;
int dip2state = 1;
int dip3state = 1;

#define LEFT  0
#define RIGHT 1
union { Uint32 uint; short channel[2]; } AIC23_data;

interrupt void c_int11()    //interrupt service routine
{
  // set left channel data
  AIC23_data.channel[LEFT] = sine_table[(short)loopindexlow];
  // set right channel data
  AIC23_data.channel[RIGHT] = sine_table[(short)loopindexhigh];
  output_sample(AIC23_data.uint); // output data to separate channels
  loopindexlow += STEP_697;
  if (loopindexlow > (float)TABLESIZE)
  loopindexlow -= (float)TABLESIZE;
  loopindexhigh += STEP_1477;
  if (loopindexhigh > (float)TABLESIZE)
  loopindexhigh -= (float)TABLESIZE;
  return;					//return from interrupt
}

void main()
{
  comm_intr();              // initialise DSK
  printf("Hello\n");
  for (i = 0; i< TABLESIZE; i++)
    sine_table[i] = (short)(10000.0*sin(2 * PI*i / TABLESIZE));
  while (1);
}
