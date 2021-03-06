//loop_poll.c loop program using polling
#include "DSK6713_AIC23.h"	        //codec support
Uint32 fs=DSK6713_AIC23_FREQ_8KHZ;	//set sampling rate
#define DSK6713_AIC23_INPUT_MIC 0x0015
#define DSK6713_AIC23_INPUT_LINE 0x0011
Uint16 inputsource=DSK6713_AIC23_INPUT_LINE; // select input
short sample_data;

#define BUFSIZE 512 // size of the buffer
int buffer[BUFSIZE]; // buffer to hold recent samples
int buf_ptr = 0; // pointer into the buffer

void main()
{
  //short sample_data;
  comm_poll();	            //init DSK, codec, McBSP
  while(1)				    //infinite loop
  {
    sample_data = input_left_sample(); //input sample
    buffer[buf_ptr] = sample_data; //store sample in buffer
    if(++buf_ptr >= BUFSIZE) buf_ptr = 0; //check pointer
    output_left_sample(sample_data);   //output sample
  }
}
 
