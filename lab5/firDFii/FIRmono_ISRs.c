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
float workingData[3] = {0.0f, 0.0f, 0.0f};
float section[nSections][3] = { {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 },  {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, {0.0, 0.0, 0.0 }, };

int wDataBase = 0;
int wDataPtr = 0;
int sDataBase = 0;
int sDataPtr = 0;
int sTemp;
Int32 i;


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

 	if(CheckForOverrun())					// overrun error occurred (i.e. halted DSP)
		return;								// so serial port is reset to recover

  	CodecDataIn.UINT = ReadCodecData();		// get input data samples
	
    workingData[wDataBase] = CodecDataIn.Channel[LEFT];
    wDataPtr = wDataBase;
    sDataPtr = sDataBase;

    section[0][sDataPtr] = SOS[0][0] * workingData[wDataPtr];
    wDataPtr = wDataPtr - 1;
    if( wDataPtr < 0 )
        wDataPtr = 2;

    section[0][sDataPtr] += SOS[0][1] * workingData[wDataPtr];
    wDataPtr--;
    if( wDataPtr < 0 )
        wDataPtr = 2;

    section[0][sDataPtr] += SOS[0][2] * workingData[wDataPtr];
    
    for( i = 1; i < nSections; i++ )
    {
        sTemp = sDataPtr;
        section[i][sDataPtr] = SOS[i][0] * section[i - 1][sDataPtr];
        sTemp--;
        if( sTemp < 0 )
            sTemp = 2;

        section[i][sDataPtr] += SOS[i][1] * section[i - 1][sTemp];
        sTemp--;
        if( sTemp < 0 )
            sTemp = 2;

        section[i][sDataPtr] += SOS[i][2] * section[i - 1][sTemp];
    }

	CodecDataOut.Channel[LEFT]  = section[nSections - 1][sDataPtr] * G; // store filtered value

    sDataBase++;
    if( sDataBase > 2 )
        sDataBase = 0;

    wDataBase++;
    if( wDataBase > 2 )
        wDataBase = 0;

	WriteCodecData(CodecDataOut.UINT);		// send output data to  port
}

