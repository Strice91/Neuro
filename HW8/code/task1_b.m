close all;

loFreq = 200;
hiFreq = 20000;
n_ff = 1000;

% Lese Signal ein
% x  = Signal
% fs = Abtastrate
[x,fs] = read_audio_mono('audio/test.wav');
t = (0:length(x)-1) / fs;

% Länge des Hamming Fensters in Abtastpunkten (hier 10 ms)
N_Fenster=10e-3*fs;
% Länge der Fensterüberlappung in Abtastpunkten (hier 5 ms)
Ueberlapp=5e-3*fs;
% Länge der Ausgabewerte B und f
n_out=1024;

% FFT des Signals
n = floor(length(x)/2);
%FFT (Normiert [0 1] bzg. Anzahl der Abtastpunkte)
FFTtmp = fft(x');
% Real Anteil und Skalierung (Hz)
FFT = abs(FFTtmp(:,1:n+1)./n);
f=(0:n)/n*fs/2;

fig = figure;
plot(t,x);
title('Original Signal');
xlabel('Zeit in s');
ylabel('Druck in pa');
grid on;
print(fig,'-dpng','../tex/img/sig_orig.png')

fig = figure;
% Ploten des Frequenzgang in KHz und dB
[ax] = semilogx(f,FFT);
ylabel('Frequenzspektrum in pa') % left y-axis
xlabel('Frequenz in Hz');
xlim([1,1e4]);
grid on
print(fig,'-dpng','../tex/img/freq_orig.png')

fig = figure;
[y] = logfsgram(x, n_out, fs, N_Fenster, Ueberlapp, loFreq, 1000);
title('Spektrum Original');
caxis([-30 30]);
print(fig,'-dpng','../tex/img/spec_orig.png')



%% 8 Kanäle
nChan = 8;
[filtOut8, H8, Gr8, w8, w_gd8] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

HT8 = hilbert(filtOut8);
env8 = lp_filter(abs(HT8),30,fs);

sum_spek8 = mean(env8);

fig = figure;
bar(sum_spek8);
title('Summenspektrum')
ylabel('Durck in pa');
xlabel('Kanal Nr.');
print(fig,'-dpng','../tex/img/sum_ch8.png')

fig = figure;
imagesc(env8(:,8:-1:1)');
title('Envelope');
ylabel('Kanal Nr.');
xlabel('Zeit in s');
set(gca, 'XTick', 1:fs:length(x), 'XTickLabel', 0:1:t(end));
set(gca, 'YTick', 1:1:8, 'YTickLabel', 8:-1:1);
print(fig,'-dpng','../tex/img/spec_env8.png')

%% 16 Kanäle
nChan = 16;
[filtOut16, H16, Gr16, w16, w_gd16] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

HT16 = hilbert(filtOut16);
env16 = lp_filter(abs(HT16),30,fs);

sum_spek16 = mean(env16);

fig = figure;
bar(sum_spek16);
title('Summenspektrum')
ylabel('Durck in pa');
xlabel('Kanal Nr.');
print(fig,'-dpng','../tex/img/sum_ch16.png')

fig = figure;
imagesc(env16(:,16:-1:1)');
title('Envelope');
ylabel('Kanal Nr.');
xlabel('Zeit in s');
set(gca, 'XTick', 1:fs:length(x), 'XTickLabel', 0:1:t(end));
set(gca, 'YTick', 1:1:16, 'YTickLabel', 16:-1:1);
print(fig,'-dpng','../tex/img/spec_env16.png')