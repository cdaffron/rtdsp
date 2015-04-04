sampling_freq = 48000;
signal_freq = 12000;
N = 3;

section = zeros(length(SOS),3);
nSections = 30;

time = (0:1/sampling_freq:0.05)';

audio_in = sin(2 * pi * signal_freq * time);
audio_out = zeros(size(audio_in));

working_data = zeros(N+1,1);
wDataBase = 1;
wDataPtr = 1;

sDataBase = 1;
sDataPtr = 1;

for j=1:length(audio_in)
    working_data(wDataBase)=audio_in(j);
    wDataPtr = wDataBase;
    sDataPtr = sDataBase;
    
    section(1,sDataPtr) = SOS(1,1)*working_data(wDataPtr);
    wDataPtr = wDataPtr - 1;
    if( wDataPtr < 1 )
        wDataPtr = N;
    end
    
    section(1,sDataPtr) = section(1,sDataPtr) + SOS(1,2)*working_data(wDataPtr);
    wDataPtr = wDataPtr - 1;
    if( wDataPtr < 1 )
        wDataPtr = N;
    end
    
    section(1,sDataPtr) = section(1,sDataPtr) + SOS(1,3)*working_data(wDataPtr);
    
    for i=2:nSections
        sTemp = sDataPtr;
        section(i,sDataPtr) = SOS(i,1)*section(i-1,sDataPtr);
        sTemp = sTemp - 1;
        if( sTemp < 1 )
            sTemp = N;
        end
        section(i,sDataPtr) = section(i,sDataPtr) + SOS(i,2)*section(i-1,sTemp);
        sTemp = sTemp - 1;
        if( sTemp < 1 )
            sTemp = N;
        end
        section(i,sDataPtr) = section(i,sDataPtr) + SOS(i,3)*section(i-1,sTemp);
    end
    
    audio_out(j) = section(nSections,sDataPtr) * G;
    
    sDataBase = sDataBase + 1;
    if( sDataBase > N )
        sDataBase = 1;
    end

    wDataBase = wDataBase + 1;
    if( wDataBase > N )
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