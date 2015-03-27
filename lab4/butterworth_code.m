delta_p = 0.05;
delta_s = 0.01;
hdelta_p = 2 * delta_p / (1 + delta_p);
hdelta_s = delta_s / (1 / delta_s);

Wp = [0.35 0.6];
Ws = [0.25 0.65];
Rp = -20 * log10(1 - hdelta_p);
Rs = -20 * log10(hdelta_s);

%% Butterworth Impulse Invariance Section
[n,Wn] = buttord(Wp, Ws, Rp, Rs, 's');
[b,a] = butter(n, Wn, 'bandpass', 's');
% freqz(b,a);
[bz, az] = impinvar( b, a , 10);
%[Hz, Wz] = freqz(bz,az);
freqz(bz,az);

%% Butterworth Bilinear Transformation Section
% [n,Wn] = buttord(Wp, Ws, Rp, Rs);
% [b,a] = butter(n, Wn, 'bandpass');
% [bz, az] = bilinear( b, a, 1 );
% %[Hz, Wz] = freqz(bz,az);
% freqz(bz,az);

%% Elliptic Bilinear Transformation Section
% [n,Wn] = ellipord(Wp, Ws, Rp, Rs);
% [b,a] = ellip(n, Rp, Rs, Wp);
% [bz,az] = bilinear( b, a, 1 );
% %[Hz, Wz] = freqz(bz,az);
% freqz(bz,az);