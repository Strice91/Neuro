close all;

loFreq = 200;
hiFreq = 20000;
n_ff = 1000;
fs = 48000;

[x,Fs1] = audioread('boo_yah.wav');
fs = Fs1
figure;
% FFT des Signals
n = floor(length(x)/2);
%FFT (Normiert [0 1] bzg. Anzahl der Abtastpunkte)
FFTtmp = fft(x');
FFT = abs(FFTtmp(:,1:n+1)./n);% Real Anteil und Skalierung (Hz)
f=(0:n)/n*fs/2;
% semilogx(f, FFT) % mit logarithmierter Frequenz Achse
% % Darzustellender Bereich (f_min f_max FFT_min FFT_max)
% %axis([50 10000 min(FFT) max(FFT)]);
% xlabel('\fontsize{16}Frequency (Hz)');
% ylabel('\fontsize{16}\fontsize{16}p^{2} [pa^{2}]')
% grid on
% hold on;


%% a)
nChan = 22;
[filtOut3, H3, Gr3, w3, w_gd3] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

% Ploten des Frequenzgang in KHz und dB
ax = plotyy(f,FFT, (w3),20*log10(abs(H3)))
set(ax,'XScale','log');
%plot((w3),20*log10(abs(H3)),'LineWidth',2.0)

nChan = 22;
[filtOut22, H22, Gr22, w22, w_gd22] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

%% b)

nChan = 6;
[filtOut6, H6, Gr6] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

figure;
for f = 1:6
    subplot(2,3,f);
    plot(filtOut6(:,f));
end

nChan = 12;
[filtOut12, H12, Gr12] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

figure;
for f = 1:12
    subplot(3,4,f);
    plot(filtOut12(:,f));
end


%% c)
signal = sum(filtOut12,2);

figure;
plot(signal);

figure;
% Ploten des Spectrogram
% fs: Abtastfrequenz
% Länge des Hamming Fensters in Abtastpunkten (hier 10 ms)
N_Fenster=10e-3*fs;
% Länge der Fensterüberlappung in Abtastpunkten (hier 5 ms)
Ueberlapp=5e-3*fs;
% Länge der Ausgabewerte B und f
n_out=1024;
% Berechnung des Spectrogram von ‚signal’
[B,f,t]=specgram(signal, n_out, fs, N_Fenster, Ueberlapp);
% Darstellung des Spectrogram in dB im Bereich zwischen dem
% Maximalwert und -60 dB dessen.
bmin= max(max(abs(B))) *10^-(60/20); % -60 dB des Max. Wertes
imagesc(t, f, 20*log10( max(abs(B), bmin)/bmin ) );
% Alternativ auch mit:
%pcolor (t, f, 20*log10(P))
% Da die Funktion specgram nur ein lineares Spektrum darstellt ist
% zur Darstellung von Sprachsignale die folgende die Funktion besser
% geeignet (zu downloaden unter Lehre):
logfsgram(signal, n_out,fs, N_Fenster, Ueberlapp, loFreq,1000);
caxis([-30 30])


