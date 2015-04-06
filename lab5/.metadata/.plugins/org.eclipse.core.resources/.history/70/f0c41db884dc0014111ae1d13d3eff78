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

float section[nSections][3] = {{0.0f, 0.0f, 0.0f, 0.0f, 0.0f},
                               {0.0f, 0.0f, 0.0f, 0.0f, 0.0f},
                               {0.0f, 0.0f, 0.0f, 0.0f, 0.0f}};
float w[nSections][3] =  {{0.0f, 0.0f, 0.0f, 0.0f, 0.0f},
                          {0.0f, 0.0f, 0.0f, 0.0f, 0.0f},
                          {0.0f, 0.0f, 0.0f, 0.0f, 0.0f}};

int sDataBase = 0;
int workingData = 0;


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
    int sTemp;

 	if(CheckForOverrun())					// overrun error occurred (i.e. halted DSP)
		return;								// so serial port is reset to recover

  	CodecDataIn.UINT = ReadCodecData();		// get input data samples

    workingData = CodecDataIn.Channel[LEFT];

    sTemp = sDataBase - 1;
    sTemp--;
    if( sTemp < 0 )
        sTemp = 2;
    w[0][sDataBase] = workingData - SOS[0][4] * w[0][sTemp];

    sTemp--;
    if( sTemp < 0 )
        sTemp = 2;
    w[0][sDataBase] -= SOS[0][5] * w[0][sTemp];

    sTemp = sDataBase - 1;
    if( sTemp < 0 )
        sTemp = 2;
    section[0][sDataBase] = SOS[0][0] * w[0][sDataBase] + SOS[0][1] * w[0][sTemp];

    sTemp--;
    if( sTemp < 0 )
        sTemp = 2;
    section[0][sDataBase] += SOS[0][2] * w[0][sTemp];

    for( i = 1; i < nSections; i++)
    {
        sTemp = sDataBase - 1;
        if( sTemp < 0 )
            sTemp = 2;
        w[i][sDataBase] = section[i-1][sDataBase] - SOS[i][4] * w[i][sTemp];

        sTemp--;
        if( sTemp < 0 )
            sTemp = 2;
        w[i][sDataBase] -= SOS[i][5] * w[i][sTemp];

        sTemp = sDataBase - 1;
        if( sTemp < 0 )
            sTemp = 2;
        section[i][sDataBase] = SOS[i][0] * w[i][sDataBase] + SOS[i][1] * w[i][sTemp];

        sTemp--;
        if( sTemp < 0 )
            sTemp = 2;
        section[i][sDataBase] += SOS[i][2] * w[i][sTemp];
    }

 	CodecDataOut.Channel[LEFT] = section[nSections-1][sDataBase];

    sDataBase++;
    if( sDataBase > 2 )
        sDataBase = 0;

	WriteCodecData(CodecDataOut.UINT);		// send output data to  port

	return;
}

