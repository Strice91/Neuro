close all;

loFreq = 200;
hiFreq = 20000;
n_ff = 1000;

% Lese Signal ein
% x  = Signal
% fs = Abtastrate
[x,fs] = read_audio_mono('audio/test.wav');

%% 6 Kanäle
nChan = 6;
[filtOut6, H6, Gr6] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

figure;
for f = 1:6
    subplot(2,3,f);
    plot(filtOut6(:,f));
end

%% 12 Kanäle
nChan = 12;
[filtOut12, H12, Gr12] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

figure;
for f = 1:12
    subplot(3,4,f);
    plot(filtOut12(:,f));
end

