sampling_freq = 48000;
signal_freq = 16000;
N = 59;

% coeffs = [ 		0.017203033005470221
% 		0.04875687072873372
% 		-0.0053633528013805271
% 		-0.089792035226627556
% 		0.0057860776118659604
% 		0.31272538663292021
% 		0.49366878054812385
% 		0.31272538663292021
% 		0.0057860776118659604
% 		-0.089792035226627556
% 		-0.0053633528013805271
% 		0.04875687072873372
% 		0.017203033005470221 ];

coeffs = [-0.0049123250992086183
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

time = (0:1/sampling_freq:0.05)';

audio_in = sin(2 * pi * signal_freq * time );
audio_out = zeros(size(audio_in));

working_data = zeros(N+1,1);

for j=1:length(audio_in)
    working_data(1)=audio_in(j);
    temp = 0;
    
    %for i=1:N+1
    %    temp = temp + working_data(i)*coeffs(i);
    %end
    
    for i=1:(length(working_data)/2)
        temp = temp + working_data(i)*coeffs(i) + working_data(N+2-i)*coeffs(i);
%         disp('Adding')
%         disp(i)
%         disp(N+2-i)
    end
    
    if mod(N,2) == 0
        temp = temp + working_data(floor((N/2)+1))*coeffs(floor((N/2)+1));
%         disp('Adding')
%         disp((N/2)+1)
    end
    
    for i=N+1:-1:2
        working_data(i) = working_data(i - 1);
    end
    audio_out(j) = temp;
%     break;
end

plot(audio_in);
axis([0 2400 -1 1]);
title('Original Signal');
figure();
plot(audio_out);
axis([0 2400 -1 1]);
title('Filtered Signal');