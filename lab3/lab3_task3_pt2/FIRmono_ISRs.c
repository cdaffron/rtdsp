// Welch, Wright, & Morrow, 
// Real-time Digital Signal Processing, 2011

///////////////////////////////////////////////////////////////////////
// Filename: ISRs.c
//
// Synopsis: Interrupt service routine for codec data transmit/receive
//
///////////////////////////////////////////////////////////////////////

#include "DSP_Config.h" 
#include "coeff.h"	// load the filter coefficients, B[n] ... extern
  
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
float xLeft[N+1]; //, *pLeft = xLeft;
Int32 i;
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
	float output; //, *p;
	int indLeft, indRight;

 	if(CheckForOverrun())					// overrun error occurred (i.e. halted DSP)
		return;								// so serial port is reset to recover

  	CodecDataIn.UINT = ReadCodecData();		// get input data samples
	
	/* I added my mono FIR filter routine here */
  	xLeft[sampleInd] = CodecDataIn.Channel[LEFT];

	output = 0;								// set up for LEFT channel
	indLeft = sampleInd;
	indRight = sampleInd + 1;
	if(++sampleInd > N)
		sampleInd = 0;
	if(indRight > N)
		indRight = 0;
	for (i = 0; i < (N+1)/2; i++) {				// do LEFT channel FIR
			output += ( ( xLeft[indLeft--] * B[i] ) + ( xLeft[indRight++] * B[i] ) );
			if(indLeft < 0)
				indLeft = N;
			if(indRight > N)
				indRight = 0;
	}

	if( ( N % 2 ) == 0 )
	{
		output += ( xLeft[ indLeft-- ] * B[ ( N/2 )] );
	}

	CodecDataOut.Channel[LEFT]  = output; // store filtered value		
	CodecDataOut.Channel[RIGHT] = output; // store filtered value	
	/* end of my mono FIR filter routine */	

	WriteCodecData(CodecDataOut.UINT);		// send output data to  port
}

