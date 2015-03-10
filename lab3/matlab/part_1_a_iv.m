%% Kaiserord function
fsamp = 48000;
fcuts = [6000 8400 14400 15600];
mags = [0 1 0];
devs = [0.01 0.05 0.01];

[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);
n = n + rem(n,2);   % make sure n is even
window = kaiser(n+1,beta);
%freqz(window);
hh = fir1(n,Wn,ftype,window,'noscale');

[H,f] = freqz(hh,1,1024,fsamp);
plot(f,abs(H))
grid