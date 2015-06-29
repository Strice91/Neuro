close all;

loFreq = 200;
hiFreq = 20000;
n_ff = 1000;

% Lese Signal ein
% x  = Signal
% fs = Abtastrate
[x,fs] = read_audio_mono('audio/piano.wav');

%% 6 Kan�le
nChan = 6;
[filtOut6, H6, Gr6] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);
t = (0:length(filtOut6)-1) / fs;

figure;
for f = 1:6
    subplot(2,3,f);
    plot(t,filtOut6(:,f));
    title(sprintf('Kanal %i',f));
    xlabel('Zeit in s');
    ylabel('Druck in pa');
end

%% 12 Kan�le
nChan = 12;
[filtOut12, H12, Gr12] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

figure;
for f = 1:12
    subplot(3,4,f);
    plot(t,filtOut12(:,f));
    title(sprintf('Kanal %i',f));
    xlabel('Zeit in s');
    ylabel('Druck in pa');
end

