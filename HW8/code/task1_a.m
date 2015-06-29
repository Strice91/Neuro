close all;

loFreq = 200;
hiFreq = 20000;
n_ff = 1000;

% Lese Signal ein
% x  = Signal
% fs = Abtastrate
[x,fs] = read_audio_mono('audio/test.wav');
t = (0:length(x)-1) / fs;
x = lp_filter(x,30,fs);

%% 8 Kanäle
nChan = 8;
[filtOut8, H8, Gr8, w8, w_gd8] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

HT8 = hilbert(filtOut8);
env8 = abs(HT8);

figure;
for f = 1:8
    subplot(2,4,f);
    plot(t,env8(:,f));
    title(sprintf('Kanal %i',f));
    xlabel('Zeit in s');
    ylabel('Druck in pa');
end

%% 16 Kanäle
nChan = 16;
[filtOut16, H16, Gr16, w16, w_gd16] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

HT16 = hilbert(filtOut16);
env16 = abs(HT16);

figure;
for f = 1:16
    subplot(4,4,f);
    plot(t,env16(:,f));
    title(sprintf('Kanal %i',f));
    xlabel('Zeit in s');
    ylabel('Druck in pa');
end