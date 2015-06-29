close all;

loFreq = 200;
hiFreq = 20000;
n_ff = 1000;

% Lese Signal ein
% x  = Signal
% fs = Abtastrate
[x,fs] = read_audio_mono('audio/test.wav');

% FFT des Signals
n = floor(length(x)/2);
%FFT (Normiert [0 1] bzg. Anzahl der Abtastpunkte)
FFTtmp = fft(x');
% Real Anteil und Skalierung (Hz)
FFT = abs(FFTtmp(:,1:n+1)./n);
f=(0:n)/n*fs/2;

%% 3 Kan�le
nChan = 3;
[filtOut3, H3, Gr3, w3, w_gd3] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

figure;
% Ploten des Frequenzgang in KHz und dB
[ax] = plotyy(f,FFT,w3,20*log10(abs(H3)));
set(ax,'XScale','log');
ylabel(ax(1),'Frequenzspektrum in pa') % left y-axis
ylabel(ax(2),'Amplitudengang in dB') % right y-axis
ylim(ax(2), [-100,0])
xlabel('Frequenz in Hz');
grid on
% xlabel('\fontsize{16}Frequency (Hz)');
% ylabel('\fontsize{16}\fontsize{16}p^{2} [pa^{2}]')
% axis([50 10000 min(FFT) max(FFT)]);


%% 22 Kan�le
nChan = 22;
[filtOut22, H22, Gr22, w22, w_gd22] = filterBank(loFreq,hiFreq,nChan,n_ff,fs,x);

figure;
% Ploten des Frequenzgang in KHz und dB
ax = plotyy(f,FFT,w22,20*log10(abs(H22)));
set(ax,'XScale','log');
ylabel(ax(1),'Frequenzspektrum (Druck) in pa') % left y-axis
ylabel(ax(2),'Amplitudengang in dB') % right y-axis
ylim(ax(2), [-100,0])
xlabel('Frequenz in Hz');
grid on
