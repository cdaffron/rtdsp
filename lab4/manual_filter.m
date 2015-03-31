n = 38;
[z,p,k] = buttap(n);
[A,B,C,D] = zp2ss(z,p,k);

u1 = 0.35 * 2 * pi;
u2 = 0.6 * 2 * pi;
Bw = u2 - u1;
Wo = sqrt(u1 * u2);
[At,Bt,Ct,Dt] = lp2bp(A,B,C,D,Wo,Bw);
[b,a]=ss2tf(At,Bt,Ct,Dt);
freqs(b,a);
[bz,az]=impinvar(b,a,2);
figure();
freqs(bz,az);
% figure();
% 
% [Ad,Bd,Cd,Dd] = bilinear(At,Bt,Ct,Dt,2,0.1);
% [bz,az] = ss2tf(Ad,Bd,Cd,Dd);
% freqs(bz,az);