// Welch, Wright, & Morrow, 
// Real-time Digital Signal Processing, 2011

///////////////////////////////////////////////////////////////////////
// Filename: ISRs.c
//
// Synopsis: Interrupt service routine for codec data transmit/receive
//
///////////////////////////////////////////////////////////////////////

#include "DSP_Config.h" 
#include "coeff.h"
  
// Data is received as 2 16-bit words (left/right) packed into one
// 32-bit word.  The union allows the data to be accessed as a single 
// entity when transferring to and from the serial port, but still be 
// able to manipulate the left and right channels independently.

#define LEFT  0
#define RIGHT 1

volatile union {
	Uint32 UINT;
	Int16 Channel[2];
} CodecDataIn, CodecDataOut;


/* add any global variables here */
//#define N 20		// IIR filter order

/* ----- BUTTERWORTH BILINEAR ----- */
float x[N+1] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};   // input value (buffered)
float y[N+1] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};   // output values (buffered)

/* ----- ELLIPTIC BILINEAR ----- */
//float x[N+1] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
//float y[N+1] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

float yn;
int sampleInd = 0;

interrupt void Codec_ISR()
///////////////////////////////////////////////////////////////////////
// Purpose:   Codec interface interrupt service routine  
//
// Input:     None
//
// Returns:   Nothing
//
// Calls:     CheckForOverrun, ReadCodecData, WriteCodecData
//
// Notes:     None
///////////////////////////////////////////////////////////////////////
{                    
	/* add any local variables here */


 	if(CheckForOverrun())					// overrun error occurred (i.e. halted DSP)
		return;								// so serial port is reset to recover

  	CodecDataIn.UINT = ReadCodecData();		// get input data samples

 	int i;
 	int indLeft;

 	yn = 0.0f;
 	indLeft = sampleInd - 1;

    if( indLeft < 0 )
        indLeft = N;

 	x[sampleInd] = CodecDataIn.Channel[LEFT];

// 	if(++sampleInd > N)
// 		sampleInd = 0;

	// yn += (B[0]*x[indLeft]);
 	yn += (B[0]*x[sampleInd]);
// 	if(++indLeft > N)
// 		indLeft = 0;

 	for(i = 1; i <= N; i++)
 	{
		yn += ((B[i]*x[indLeft]) - (A[i]*y[indLeft]));
 		// yn += ((B[i]*x[(sampleInd+i)%(N+1)]));
	    // yn -= ((A[i]*y[(sampleInd+i)%(N+1)]));
		if(--indLeft < 0)
			indLeft = N;
 	}
// 	for(i = N; i > 0; i--)
// 	{
// 		x[i]=x[i-1];
// 		y[i]=y[i-1];
// 	}

 	y[sampleInd] = yn;

 	if(++sampleInd > N)
 		sampleInd = 0;

// 	y[sampleInd] = yn;

 	CodecDataOut.Channel[LEFT] = yn;
 	CodecDataOut.Channel[RIGHT] = yn;

	WriteCodecData(CodecDataOut.UINT);		// send output data to  port

	return;
}

