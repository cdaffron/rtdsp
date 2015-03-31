Wp = [0.35*pi 0.6*pi];
Ws = [0.25*pi 0.65*pi];
Rp = -20 * log10( 0.95 );
Rs = -20 * log10( 0.01 );

%% Butterworth Impulse Invariance Section
% [n,Wn] = buttord(Wp, Ws, Rp, Rs, 's');
% [b,a] = butter(n, Wn, 'bandpass', 's');
% freqz(b,a);
% figure()
% [bz, az] = impinvar( b, a, 1 );
% %[Hz, Wz] = freqz(bz,az);
% freqz(bz,az);

%% Butterworth Bilinear Transformation Section
[n,Wn] = buttord(Wp, Ws, Rp, Rs, 's');
[b,a] = butter(n, Wn, 'bandpass', 's');
freqz(b,a);
figure();
[bz, az] = bilinear( b, a, 1);
%[Hz, Wz] = freqz(bz,az);
freqz(bz,az);

%% Elliptic Bilinear Transformation Section
% [n,Wn] = ellipord(Wp, Ws, Rp, Rs, 's');
% [b,a] = ellip(n, Rp, Rs, Wp, 's');
% freqz(b,a);
% figure();
% [bz,az] = bilinear( b, a, 1 );
% % [Hz, Wz] = freqz(bz,az);
% freqz(bz,az);