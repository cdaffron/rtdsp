sampling_freq = 48000;
signal_freq = 12000;
N = 5;

nSections = 5;
section = zeros(nSections,3);
w = zeros(nSections,3);

time = (0:1/sampling_freq:0.05)';

audio_in = sin(2 * pi * signal_freq * time);
audio_out = zeros(size(audio_in));

sDataBase = 1;

for j=1:length(audio_in)
    working_data = audio_in(j) * G;
    
    sTemp = sDataBase;
    sTemp = sTemp - 1;
    if( sTemp < 1 )
        sTemp = 3;
    end
    w(1,sDataBase) = working_data - SOS(1,5)*w(1,sTemp);
    
    sTemp = sTemp - 1;
    if( sTemp < 1 )
        sTemp = 3;
    end
    w(1,sDataBase) = w(1,sDataBase) - SOS(1,6)*w(1,sTemp);
    
    sTemp = sDataBase;
    sTemp = sTemp - 1;
    if( sTemp < 1 )
        sTemp = 3;
    end
    section(1,sDataBase) = SOS(1,1)*w(1,sDataBase) + SOS(1,2)*w(1,sTemp);
    sTemp = sTemp - 1;
    if( sTemp < 1 )
        sTemp = 3;
    end
    section(1,sDataBase) = section(1,sDataBase) + SOS(1,3)*w(1,sTemp);
    
    for i=2:nSections
        sTemp = sDataBase - 1;
        if( sTemp < 1 )
            sTemp = 3;
        end
        w(i,sDataBase) = section(i-1,sDataBase) - SOS(i,5)*w(i,sTemp);
        
        sTemp = sTemp - 1;
        if( sTemp < 1 )
            sTemp = 3;
        end
        w(i,sDataBase) = w(i,sDataBase) - SOS(i,6)*w(i,sTemp);
        
        sTemp = sDataBase - 1;
        if( sTemp < 1 )
            sTemp = 3;
        end
        section(i,sDataBase) = SOS(i,1)*w(i,sDataBase) + SOS(i,2)*w(i,sTemp);
        
        sTemp = sTemp - 1;
        if( sTemp < 1 )
            sTemp = 3;
        end
        section(i,sDataBase) = section(i,sDataBase) + SOS(i,3)*w(i,sTemp);
    end
   
    audio_out(j) = section(nSections,sDataBase);
    
    sDataBase = sDataBase + 1;
    if( sDataBase > 3 )
        sDataBase = 1;
    end
end

plot(audio_in);
axis([0 2400 -1 1]);
title('Original Signal');
figure();
plot(audio_out);
axis([0 2400 -1 1]);
title('Filtered Signal');