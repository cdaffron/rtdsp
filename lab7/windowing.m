sampling_freq = 48000;
signal_freq = 12000;

time = (0:1/sampling_freq:0.05)';

% audio_in = sin(2 * pi * signal_freq * time);
% audio_in = zeros(length(time),1);
% noisy = awgn(audio_in,-30);
S = load('gong');
audio_in = S.y;

w = hamming(length(audio_in));

windowed = audio_in .* w;

freq = fft(audio_in);
freq_window = fft(windowed);

plot(abs(freq_window));
figure();
plot(abs(freq));