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
//float x[N+1] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};   // input value (buffered)
//float y[N+1] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};   // output values (buffered)

/* ----- ELLIPTIC BILINEAR ----- */
//float x[N+1] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
//float y[N+1] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

/* ----- BUTTERWORTH IMPULSE INVARIANCE ----- */
float x[N+1] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
float y[N+1] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

//float B[N+1] = {0.000032863802443769357, 0, -0.00032863802443769348, 0, 0.0014788711099696207, 0, -0.003943656293252322, 0, 0.0069013985131915635, 0, -0.0082816782158298755, 0, 0.0069013985131915635, 0, -0.003943656293252322, 0, 0.0014788711099696207, 0, -0.00032863802443769348, 0, 0.000032863802443769357 };
//float A[N+1] = {1, -1.212901528380115, 4.950664125685889, -5.0449273177766081, 11.616607559733126, -10.07465586336729, 16.673316372673725, -12.335384078382013, 16.069403690973232, -10.083155019072567, 10.793925055457862, -5.6598986101190452, 5.0902631738685411, -2.1692586637441664, 1.6557680232271594, -0.54498340699296266, 0.35369587708057254, -0.081147312745992919, 0.044534960052331388, -0.0054395034379633566, 0.00249057233041466 };
float yn = 0.0;

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
 	yn = 0.0;
 	x[0] = CodecDataIn.Channel[LEFT];
 	yn += ((B[0]*x[0]));

 	for(i = 1; i <= N; i++)
 	{
 		yn += (B[i]*x[i]);
 		yn -= (A[i]*y[i]);
 	}

// 	for(i = 0; i <= N; i++)
// 		yn += (B[i]*x[i]);

// 	for(i = 1; i <= N; i++)
// 		yn -= (A[i]*y[i]);

 	y[0] = yn;
 	for(i = N; i > 0; i--)
 	{
 		x[i]=x[i-1];
 		y[i]=y[i-1];
 	}
// 	y[0] = yn * 500;

 	CodecDataOut.Channel[LEFT] = (Int16)yn;
 	CodecDataOut.Channel[RIGHT] = (Int16)yn;
// 	CodecDataOut.Channel[LEFT] = x[0];
// 	CodecDataOut.Channel[RIGHT] = x[0];

	WriteCodecData(CodecDataOut.UINT);		// send output data to  port

	return;
}

