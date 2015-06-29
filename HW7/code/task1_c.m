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

%% 12 Kanal
nChan = 12;
[filtOut12, H12, Gr12] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

signal = sum(filtOut12,2);

% FFT des Originals
n = floor(length(x)/2);
%FFT (Normiert [0 1] bzg. Anzahl der Abtastpunkte)
FFTtmp_x = fft(x');
% Real Anteil und Skalierung (Hz)
FFT_x = abs(FFTtmp_x(:,1:n+1)./n);
f=(0:n)/n*fs/2;

% FFT des Rekonstruierten Signals
n = floor(length(signal)/2);
%FFT (Normiert [0 1] bzg. Anzahl der Abtastpunkte)
FFTtmp_s = fft(signal');
% Real Anteil und Skalierung (Hz)
FFT_s = abs(FFTtmp_s(:,1:n+1)./n);


figure;
plot(t,x);
title('Original Signal');
xlabel('Zeit in s');
ylabel('Druck in pa');
grid on;

figure;
plot(t,signal);
title('Rekonstruiertes Signal (12 Kanal)');
xlabel('Zeit in s');
ylabel('Druck in pa');
grid on;

figure;
logfsgram(x, n_out, fs, N_Fenster, Ueberlapp, loFreq, 1000);
title('Spektrogram Original');
caxis([-30 30])

figure;
logfsgram(signal, n_out, fs, N_Fenster, Ueberlapp, loFreq, 1000);
title('Spektrogram Rekonstruiert (12 Kanal)');
caxis([-30 30])

figure;
semilogx(f,FFT_x);
title('FFT Original');
xlabel('Frequenz in Hz');
ylabel('Druck in pa');
xlim([10,10000]);
grid on;

figure;
semilogx(f,FFT_s);
title('FFT Rekonstruiert (12 Kanal)');
xlabel('Frequenz in Hz');
ylabel('Druck in pa');
xlim([10,10000]);
grid on;

%% 3 Kanal
nChan = 3;
[filtOut3, H3, Gr3] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

signal = sum(filtOut3,2);

% FFT des Originals
n = floor(length(x)/2);
%FFT (Normiert [0 1] bzg. Anzahl der Abtastpunkte)
FFTtmp_x = fft(x');
% Real Anteil und Skalierung (Hz)
FFT_x = abs(FFTtmp_x(:,1:n+1)./n);
f=(0:n)/n*fs/2;

% FFT des Rekonstruierten Signals
n = floor(length(signal)/2);
%FFT (Normiert [0 1] bzg. Anzahl der Abtastpunkte)
FFTtmp_s = fft(signal');
% Real Anteil und Skalierung (Hz)
FFT_s = abs(FFTtmp_s(:,1:n+1)./n);

figure;
plot(t,signal);
title('Rekonstruiertes Signal (3 Kanal)');
xlabel('Zeit in s');
ylabel('Druck in pa');
grid on;

figure;
logfsgram(signal, n_out, fs, N_Fenster, Ueberlapp, loFreq, 1000);
title('Spektrogram Rekonstruiert (3 Kanal)');
caxis([-30 30])

figure;
semilogx(f,FFT_s);
title('FFT Rekonstruiert (3 Kanal)');
xlabel('Frequenz in Hz');
ylabel('Druck in pa');
xlim([10,10000]);
grid on;
