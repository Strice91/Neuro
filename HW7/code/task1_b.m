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
t = (0:length(filtOut6)-1) / fs;

fig = figure;
for f = 1:6
    subplot(3,2,f);
    plot(t,filtOut6(:,f));
    title(sprintf('Kanal %i',f));
    xlabel('Zeit in s');
    ylabel('Druck in pa');
end
print(fig,'-dpng','../tex/img/fb_6.png')

%% 12 Kanäle
nChan = 12;
[filtOut12, H12, Gr12] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

fig = figure;
for f = 1:12
    subplot(4,3,f);
    plot(t,filtOut12(:,f));
    title(sprintf('Kanal %i',f));
    xlabel('Zeit in s');
    ylabel('Druck in pa');
end
print(fig,'-dpng','../tex/img/fb_12.png')

