// Welch, Wright, & Morrow, 
// Real-time Digital Signal Processing, 2011

// fft.h 

// define the COMPLEX structure
typedef struct {
    float real, imag;
} COMPLEX;

void fft_c(int, COMPLEX*, COMPLEX*);
void init_W(int, COMPLEX*);
void init_W_neg(int, COMPLEX*);
