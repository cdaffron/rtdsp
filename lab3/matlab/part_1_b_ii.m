fsamp = 16000;
fcuts = [2000 2800 4800 5200];
mags = [0 1 0];
devs = [0.01 0.05 0.01];

[n,fo,ao,w] = firpmord(fcuts,mags,devs,fsamp);
b = firpm(n,fo,ao,w);
freqz(b,1,1024,fsamp);