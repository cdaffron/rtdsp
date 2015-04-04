sampling_freq = 48000;
signal_freq = 16000;
N = 3;

section = zeros(length(SOS),3);
nSections = 30;

time = (0:1/sampling_freq:0.05)';

audio_in = sin(2 * pi * signal_freq * time);
audio_out = zeros(size(audio_in));

working_data = zeros(N,1);

for j=1:length(audio_in)
    working_data(1)=audio_in(j);
    
    section(1,1) = SOS(1,1)*working_data(1) + SOS(1,2)*working_data(2) + SOS(1,3)*working_data(3);
    
    for i=2:nSections
        section(i,1) = SOS(i,1)*section(i-1,1) + SOS(i,2)*section(i-1,2) + SOS(i,3)*section(i-1,3);
    end
    
    audio_out(j) = section(nSections,1) * G;
    
    for i=N:-1:2
        working_data(i) = working_data(i-1);
    end
    
    for i=1:nSections
        section(i,3) = section(i,2);
        section(i,2) = section(i,1);
    end
end

plot(audio_in);
axis([0 2400 -1 1]);
title('Original Signal');
figure();
plot(audio_out);
axis([0 2400 -1 1]);
title('Filtered Signal');