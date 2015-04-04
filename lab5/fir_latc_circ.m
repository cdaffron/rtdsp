sampling_freq = 48000;
signal_freq = 12000;
N = 59;

time = (0:1/sampling_freq:0.05)';

audio_in = sin(2 * pi * signal_freq * time);
audio_out = zeros(size(audio_in));

working_data_a = zeros(N+1,1);
working_data_b = zeros(N+1,2);
audio_in_prev = 0;

wDataBase = 1;

for j=1:length(audio_in)
    
    wDataPtr = wDataBase;
    
    working_data_a(1) = audio_in(j) + (-K(1))*audio_in_prev;
    working_data_b(1,wDataPtr) = (-K(1))*audio_in(j) + audio_in_prev;
    
    for i=2:N
        wTemp = wDataPtr - 1;
        if( wTemp < 1 )
            wTemp = 2;
        end
        working_data_a(i) = working_data_a(i-1) + (-K(i))*working_data_b(i-1,wTemp);
        working_data_b(i,wDataPtr) = (-K(i))*working_data_a(i-1) + working_data_b(i-1,wTemp);
    end
    
    audio_out(j) = working_data_a(N) * G;
    audio_in_prev = audio_in(j);

    wDataBase = wDataBase + 1;
    if( wDataBase > 2 )
        wDataBase = 1;
    end
    
end

plot(audio_in);
axis([0 2400 -1 1]);
title('Original Signal');
figure();
plot(audio_out);
axis([0 2400 -1 1]);
title('Filtered Signal');