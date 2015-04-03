clear all;

B = [
-0.004912325099208618
-0.014619079916495251
 0.0060757570503416243
 0.01952535804916462
 0.0024331187695853683
-0.0098746099102310358
-0.0037963320758576859
-0.012010346542919192
-0.01035742425347112
 0.01992326384135619
 0.021487608632075595
-0.0036831076567773926
-0.0025285456210165994
-0.010532837642683505
-0.034386903509944826
-0.0011850529678652522
 0.039757652237396482
 0.014026994706631228
 0.0043585313963652086
 0.014292489095961029
-0.04562980713703095
-0.062041754213086692
 0.02997771785352504
 0.041487703139491801
 0.0066936154158850807
 0.087583480119140356
 0.030241608546776121
-0.23544107929841201
-0.15849062460484048
 0.26627195921759944
 0.26627195921759944
-0.15849062460484048
-0.23544107929841201
 0.030241608546776121
 0.087583480119140356
 0.0066936154158850807
 0.041487703139491801
 0.02997771785352504
-0.062041754213086692
-0.04562980713703095
 0.014292489095961029
 0.0043585313963652086
 0.014026994706631228
 0.039757652237396482
-0.0011850529678652522
-0.034386903509944826
-0.010532837642683505
-0.0025285456210165994
-0.0036831076567773926
 0.021487608632075595
 0.01992326384135619
-0.01035742425347112
-0.012010346542919192
-0.0037963320758576859
-0.0098746099102310358
 0.0024331187695853683
 0.01952535804916462
 0.0060757570503416243
-0.014619079916495251
-0.0049123250992086183 ];

% K = tf2latc(B);
[SOS, G] = tf2sos(B,1);
[Z,P,K] = sos2zp(SOS,G);

for i=1:length(Z)
    if abs(Z(i)) == 1
%         disp('On unit circle')
%         disp(Z(i))
        Z(i) = Z(i) + 0.01;
%         disp(Z(i))
%         disp(abs(Z(i)))
    end
end

[SOS, G] = zp2sos(Z,P,K);
[Bn,An] = sos2tf(SOS,G);
K = tf2latc(Bn);

sampling_freq = 48000;
signal_freq = 16000;
time = (0:1/sampling_freq:0.05)';
audio_in = sin(2 * pi * signal_freq * time);

[audio_out, temp] = latcfilt(K,audio_in);
audio_out = audio_out * G;
plot(audio_out);