close all;

loFreq = 200;
hiFreq = 20000;
n_ff = 1000;

% Lese Signal ein
% x  = Signal
% fs = Abtastrate
[x,fs] = read_audio_mono('audio/test.wav');

nChan = 12;
[filtOut12, H12, Gr12] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

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
% Berechnung des Spectrogram von signal
[B,f,t]=specgram(signal, n_out, fs, N_Fenster, Ueberlapp);
% Darstellung des Spectrogram in dB im Bereich zwischen dem
% Maximalwert und -60 dB dessen.
bmin= max(max(abs(B))) *10^-(60/20); % -60 dB des Max. Wertes
imagesc(t, f, 20*log10( max(abs(B), bmin)/bmin ) );
% Alternativ auch mit:
% pcolor (t, f, 20*log10(P))
% Da die Funktion specgram nur ein lineares Spektrum darstellt ist
% zur Darstellung von Sprachsignale die folgende die Funktion besser
% geeignet (zu downloaden unter Lehre):
logfsgram(signal, n_out,fs, N_Fenster, Ueberlapp, loFreq,1000);
caxis([-30 30])


