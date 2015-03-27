// Welch, Wright, & Morrow,
// Real-time Digital Signal Processing, 2011

/* coeff.c                             */
/* FIR filter coefficients             */
/* exported by MATLAB using FIR_DUMP2C */


/* Equiripple FIR LPF with passband to */
/* 5 kHz assuming Fs=48 kHz            */


#include "coeff.h"

float B[N+1] = {
 0.000032863802443769357,
 0,
-0.00032863802443769348,
 0,
 0.0014788711099696207,
 0,
-0.003943656293252322,
 0,
 0.0069013985131915635,
 0,
-0.0082816782158298755,
 0,
 0.0069013985131915635,
 0,
-0.003943656293252322,
 0,
 0.0014788711099696207,
 0,
-0.00032863802443769348,
 0,
 0.000032863802443769357,

};

float A[N+1] = {
 1,
-1.212901528380115,
 4.950664125685889,
-5.0449273177766081                 ,
 11.616607559733126,
-10.07465586336729,
 16.673316372673725                  ,
-12.335384078382013,
 16.069403690973232,
-10.083155019072567,
 10.793925055457862,
-5.6598986101190452,
 5.0902631738685411,
-2.1692586637441664,
 1.6557680232271594,
-0.54498340699296266                ,
 0.35369587708057254,
-0.081147312745992919               ,
 0.044534960052331388,
-0.0054395034379633566              ,
 0.00249057233041466 ,
};