// Welch, Wright, & Morrow, 
// Real-time Digital Signal Processing, 2011

/* coeff.c                             */
/* FIR filter coefficients             */
/* exported by MATLAB using FIR_DUMP2C */


/* Equiripple FIR LPF with passband to */
/* 5 kHz assuming Fs=48 kHz            */


#include "coeff.h"

float SOS[nSections][6] = {
		{1,  4.44089209850063e-16, -0.999999999999999,  1,  -0.141475422543136, 0.665915800181715},
		{1,  1.12909702920455,      1.00000000000000,   1,   0.398220503701660, 0.801314006827437},
		{1, -1.33889549467908,      0.999999999999999,  1,  -0.680109746360016, 0.810260129420495},
		{1,  0.827749074875837,     1.00000000000000,   1,   0.613337721231956, 0.951152114219966},
		{1, -1.08900681098941,      1.00000000000000,   1,  -0.896323368737722, 0.954203923997317},

//		{1, 0.000166030258087035, -1.22174613045062	,  1,  -0.0483448578745825, 0.377246238821879},
//		{1, -0.00130560308459848, -0.813426649818771,  1,  -0.185484541890015,  0.380880121147422},
//		{1, 2.19375142925388,      1.20483897210010	,  1,  0.0849091018433160,  0.398389730364976},
//		{1, -2.19294283921689,     1.20397039572325	,  1,  -0.319808851797880,  0.408691277266803},
//		{1, 2.14521401395072,      1.15620572922083	,  1,  0.208997896467562,  0.442120641134148},
//		{1, -2.14363574682198,     1.15451157620990	,  1,  -0.446104821623034,  0.457502561712755},
//		{1, 2.07385381384841,      1.08464995014196	,  1,  0.321490129196196,  0.505279474862646},
//		{1, -2.07217383907979,     1.08279945422658	,  1,  -0.562081694249309,  0.523590443468230},
//		{1, 1.99301371447334,      1.00353746807182	,  1,  0.422054743815172,  0.585490794089978},
//		{1, -1.99207004390840,     1.00238583569141	,  1,  -0.667640527180904,  0.604332622069681},
//		{1, 1.81591798280194,      0.825729279648017,  1,  0.511123257064786,  0.681832270147358},
//		{1, -1.81818668840360,     0.827745850157259,  1,  -0.763565342136204,  0.698687451516092},
//		{1, 1.85511283146275,      0.865093429996776,  1,  0.588918791559505,  0.794843782245177},
//		{1, -1.85649606554631,     0.866234189237604,  1,  -0.850597972728741,  0.807077902430573},
//		{1, 1.91647782081786,      0.926710380685413,  1,  0.654833293333273,  0.926379878401119},
//		{1, -1.91669681080545,     0.926700091172572,  1,  -0.928883992889690,  0.931196707740518},
};

float G = 0.0224461094829602;
 
 
