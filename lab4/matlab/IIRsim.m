sampling_freq = 48000;
signal_freq = 16000;
N = 20;

num = [
 0.000032863802443769357
 0
-0.00032863802443769348
 0
 0.0014788711099696207
 0
-0.003943656293252322
 0
 0.0069013985131915635
 0
-0.0082816782158298755
 0
 0.0069013985131915635
 0
-0.003943656293252322
 0
 0.0014788711099696207
 0
-0.00032863802443769348
 0
 0.000032863802443769357
];

denom = [
 1
-1.212901528380115
 4.950664125685889
-5.0449273177766081                 
 11.616607559733126
-10.07465586336729
 16.673316372673725                  
-12.335384078382013
 16.069403690973232
-10.083155019072567
 10.793925055457862
-5.6598986101190452
 5.0902631738685411
-2.1692586637441664
 1.6557680232271594
-0.54498340699296266                
 0.35369587708057254
-0.081147312745992919               
 0.044534960052331388
-0.0054395034379633566              
 0.00249057233041466
];

time = (0:1/sampling_freq:0.05)';

audio_in = sin(2 * pi * signal_freq * time );
audio_out = zeros(size(audio_in));

working_data_in = zeros(N+1,1);
working_data_out = zeros(N+1,1);

for j=1:length(audio_in)
    working_data_in(1)=audio_in(j);
    temp = 0;
    
    temp = temp + (num(1)*working_data_in(1));
    
    for i=2:N+1
       temp = temp + (num(i)*working_data_in(i)) - (denom(i)*working_data_out(i));
    end
    
%     for i=1:(length(working_data_in)/2)
%         temp = temp + working_data_in(i)*coeffs(i) + working_data_in(N+2-i)*coeffs(i);
%         disp('Adding')
%         disp(i)
%         disp(N+2-i)
%     end
    
%     if mod(N,2) == 0
%         temp = temp + working_data_in(floor((N/2)+1))*coeffs(floor((N/2)+1));
%         disp('Adding')
%         disp((N/2)+1)
%     end
    
    for i=N+1:-1:2
        working_data_in(i) = working_data_in(i - 1);
        working_data_out(i) = working_data_out(i - 1);
    end
    working_data_out(1) = temp;
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