// Welch, Wright, & Morrow, 
// Real-time Digital Signal Processing, 2011

///////////////////////////////////////////////////////////////////////
// Filename: ISRs.c
//
// Synopsis: Interrupt service routines for EDMA
//
///////////////////////////////////////////////////////////////////////

#include "DSP_Config.h" 
#include "math.h"
#include "frames.h"  
#include "coeff.h"      // load the filter coefficients, B[n] ... extern
#include "fft.h"
  
// frame buffer declarations
#define BUFFER_COUNT		965   // buffer length in McBSP samples (L+R)
#define BUFFER_LENGTH   	BUFFER_COUNT*2 // two shorts read from McBSP each time  
#define NUM_BUFFERS     	3     // don't change this!
#define N					1024

#pragma DATA_SECTION (buffer, "CE0"); // allocate buffers in SDRAM 
Int16 buffer[NUM_BUFFERS][BUFFER_LENGTH];
// there are 3 buffers in use at all times, one being filled from the McBSP,
// one being operated on, and one being emptied to the McBSP
// ready_index --> buffer ready for processing
volatile Int16 buffer_ready = 0, over_run = 0, ready_index = 0;

COMPLEX x[N], W[N], NW[N];
COMPLEX coeffs[N];
COMPLEX mult_result[N];
float saved[N - BUFFER_COUNT];
float y[N];
float B_pad[N];

void EDMA_Init()
////////////////////////////////////////////////////////////////////////
// Purpose:   Configure EDMA controller to perform all McBSP servicing. 
//            EDMA is setup so buffer[2] is outbound to McBSP, buffer[0] is 
//            available for processing, and buffer[1] is being loaded.
//            Conditional statement ensure that the correct EDMA events are
//            used based on the McBSP that is being used.
//            Both the EDMA transmit and receive events are set to automatically
//            reload upon completion, cycling through the 3 buffers. 
//            The EDMA completion interrupt occurs when a buffer has been filled
//            by the EDMA from the McBSP.
//            The EDMA interrupt service routine updates the ready buffer index, 
//            and sets the buffer ready flag which is being polled by the main 
//            program loop
//
// Input:     None
//
// Returns:   Nothing
//
// Calls:     Nothing
//
// Notes:     None
///////////////////////////////////////////////////////////////////////
{
	EDMA_params* param;

	// McBSP tx event params
	param = (EDMA_params*)(EVENTE_PARAMS);
	param->options = 0x211E0002;
	param->source = (unsigned int)(&buffer[2][0]);
	param->count = (0 << 16) + (BUFFER_COUNT);
	param->dest = 0x34000000;
	param->reload_link = (BUFFER_COUNT << 16) + (EVENTN_PARAMS & 0xFFFF);
	
	// set up first tx link param
	param = (EDMA_params*)EVENTN_PARAMS;
	param->options = 0x211E0002;
	param->source = (unsigned int)(&buffer[0][0]);
	param->count = (0 << 16) + (BUFFER_COUNT);
	param->dest = 0x34000000;
	param->reload_link = (BUFFER_COUNT << 16) + (EVENTO_PARAMS & 0xFFFF);
	
	// set up second tx link param
	param = (EDMA_params*)EVENTO_PARAMS;
	param->options = 0x211E0002;
	param->source = (unsigned int)(&buffer[1][0]);
	param->count = (0 << 16) + (BUFFER_COUNT);
	param->dest = 0x34000000;
	param->reload_link = (BUFFER_COUNT << 16) + (EVENTP_PARAMS & 0xFFFF);
	
	// set up third tx link param
	param = (EDMA_params*)EVENTP_PARAMS;
	param->options = 0x211E0002;
	param->source = (unsigned int)(&buffer[2][0]);
	param->count = (0 << 16) + (BUFFER_COUNT);
	param->dest = 0x34000000;
	param->reload_link = (BUFFER_COUNT << 16) + (EVENTN_PARAMS & 0xFFFF);
	
	
	// McBSP rx event params
	param = (EDMA_params*)(EVENTF_PARAMS);
	param->options = 0x203F0002;
	param->source = 0x34000000;
	param->count = (0 << 16) + (BUFFER_COUNT);
	param->dest = (unsigned int)(&buffer[1][0]);
	param->reload_link = (BUFFER_COUNT << 16) + (EVENTQ_PARAMS & 0xFFFF);
	
	// set up first rx link param
	param = (EDMA_params*)EVENTQ_PARAMS;
	param->options = 0x203F0002;
	param->source = 0x34000000;
	param->count = (0 << 16) + (BUFFER_COUNT);
	param->dest = (unsigned int)(&buffer[2][0]);
	param->reload_link = (BUFFER_COUNT << 16) + (EVENTR_PARAMS & 0xFFFF);
	
	// set up second rx link param
	param = (EDMA_params*)EVENTR_PARAMS;
	param->options = 0x203F0002;
	param->source = 0x34000000;
	param->count = (0 << 16) + (BUFFER_COUNT);
	param->dest = (unsigned int)(&buffer[0][0]);
	param->reload_link = (BUFFER_COUNT << 16) + (EVENTS_PARAMS & 0xFFFF);
	
	// set up third rx link param
	param = (EDMA_params*)EVENTS_PARAMS;
	param->options = 0x203F0002;
	param->source = 0x34000000;
	param->count = (0 << 16) + (BUFFER_COUNT);
	param->dest = (unsigned int)(&buffer[1][0]);
	param->reload_link = (BUFFER_COUNT << 16) + (EVENTQ_PARAMS & 0xFFFF);
	
	*(unsigned volatile int *)ECR = 0xf000;	// clear all McBSP events
	*(unsigned volatile int *)EER = 0xC000;
	*(unsigned volatile int *)CIER = 0x8000; // interrupt on rx reload only
}

void ZeroBuffers() 
////////////////////////////////////////////////////////////////////////
// Purpose:   Sets all buffer locations to 0 
//
// Input:     None
//
// Returns:   Nothing
//
// Calls:     Nothing
//
// Notes:     None
///////////////////////////////////////////////////////////////////////
{
    Int32 i = BUFFER_COUNT * NUM_BUFFERS;
    Int32 *p = (Int32 *)buffer;

    while(i--)
        *p++ = 0;

    init_W(N, W);
    init_W_neg(N, WN);

    padToN(B, N_coeff + 1);

    for(i = 0; i < N; i++)
    {
    	coeffs[i].real = B_pad[i];
    	coeffs[i].imag = 0.0f;
    }

    for(i = 0; i < (N - BUFFER_COUNT); i++) {
    	saved[i] = 0;
    }

    fft_c(N, coeffs, W);
}

void ProcessBuffer()
///////////////////////////////////////////////////////////////////////
// Purpose:   Processes the data in buffer[ready_index] and stores
//            the results back into the buffer 
//            Data is packed into the buffer, alternating right/left
//              Be careful of the order of packing
//
// Input:     None
//
// Returns:   Nothing
//
// Calls:     Nothing
//
// Notes:     None
///////////////////////////////////////////////////////////////////////
{   
    Int16 *pBuf = buffer[ready_index];
    Int32 i;
    // extra buffer room for convolution "edge effects"
    // N is filter order from coeff.h
    static float Left[BUFFER_COUNT+N]={0}, Right[BUFFER_COUNT+N]={0};
    float *pL = Left, *pR = Right;
    float yLeft, yRight;
    Int32 i, j, k;
    
    // offset pointers to start filling after N elements
    pR += N;
    pL += N;

    for(i = 0;i < BUFFER_COUNT;i++) { // extract data to float buffers
    // order is important here: must go right first then left
       *pR++ = *pBuf++;
       *pL++ = *pBuf++;
    }

    // reinitialize pointer before FOR loop
    pBuf = buffer[ready_index];
      
////////////////////////////////////////
// Implement FIR filter
// Ensure COEFF.C is part of project
////////////////////////////////////////  
   for(i=0;i < BUFFER_COUNT;i++){ 
      yLeft  = 0;                      // initialize the LEFT output value
      yRight = 0;                      // initialize the RIGHT output value
      
      for(j=0,k=i;j <= N;j++,k++){ 
        yLeft  += Left[k] * B[j];        // perform the LEFT dot-product
        yRight += Right[k] * B[j];        // perform the RIGHT dot-product
      }
      
      // pack into buffer after bounding (must be right then left)
      *pBuf++ = _spint(yRight * 65536) >> 16;
      *pBuf++ = _spint(yLeft * 65536) >> 16;
   }  
  
   // save end values at end of buffer array for next pass
   //  by placing at beginning of buffer array
   for(i=BUFFER_COUNT,j=0;i < BUFFER_COUNT+N;i++,j++){ 
      Left[j]=Left[i];
      Right[j]=Right[i];
   }

//////// end of FIR routine ///////////  

    // reinitialize pointer
    pBuf = buffer[ready_index];

    buffer_ready = 0; // signal we are done
}

///////////////////////////////////////////////////////////////////////
// Purpose:   Access function for buffer ready flag 
//
// Input:     None
//
// Returns:   Non-zero when a buffer is ready for processing
//
// Calls:     Nothing
//
// Notes:     None
///////////////////////////////////////////////////////////////////////
int IsBufferReady()
{
    return buffer_ready;
}

///////////////////////////////////////////////////////////////////////
// Purpose:   Access function for buffer overrun flag 
//
// Input:     None
//
// Returns:   Non-zero if a buffer overrun has occurred
//
// Calls:     Nothing
//
// Notes:     None
///////////////////////////////////////////////////////////////////////
int IsOverRun()
{
    return over_run;
}
 
interrupt void EDMA_ISR()
///////////////////////////////////////////////////////////////////////
// Purpose:   EDMA interrupt service routine.  Invoked on every buffer 
//            completion 
//
// Input:     None
//
// Returns:   Nothing
//
// Calls:     Nothing
//
// Notes:     None
///////////////////////////////////////////////////////////////////////
{
	*(volatile Uint32 *)CIPR = 0xf000; // clear all McBSP events
    if(++ready_index >= NUM_BUFFERS) // update buffer index
        ready_index = 0;
    if(buffer_ready == 1) // set a flag if buffer isn't processed in time 
        over_run = 1;
    buffer_ready = 1; // mark buffer as ready for processing
}

