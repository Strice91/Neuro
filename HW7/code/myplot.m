% Ploten des Amplitudenspektrums

    % FFT des Signals
    n = floor(length(x)/2);
    %FFT (Normiert [0 1] bzg. Anzahl der Abtastpunkte)
    FFTtmp = fft(x');
    FFT = abs(FFTtmp(:,1:n+1)./n);% Real Anteil und Skalierung (Hz)
    f=(0:n)/n*fs/2;
    semilogx(f, FFT) % mit logarithmierter Frequenz Achse
    % Darzustellender Bereich (f_min f_max FFT_min FFT_max)
    axis([50 10000 min(FFT) max(FFT)]);
    xlabel('\fontsize{16}Frequency (Hz)');
    ylabel('\fontsize{16}\fontsize{16}p^{2} [pa^{2}]')
    grid on
    
% % Ploten des Frequenzgang in KHz und dB
% plot((w/1e3),20*log10(abs(H)),'LineWidth',2.0)
% % Ploten des Spectrogram
% % fs: Abtastfrequenz
% % Länge des Hamming Fensters in Abtastpunkten (hier 10 ms)
% N_Fenster=10e-3*fs;
% % Länge der Fensterüberlappung in Abtastpunkten (hier 5 ms)
% Ueberlapp=5e-3*fs;
% % Länge der Ausgabewerte B und f
% n_out=1024;
% % Berechnung des Spectrogram von ‚signal’
% [B,f,t]=specgram(signal, n_ou, fs, N_Fenster, Ueberlapp);
% % Darstellung des Spectrogram in dB im Bereich zwischen dem
% % Maximalwert und -60 dB dessen.
% bmin= max(max(abs(B))) *10^-(60/20); % -60 dB des Max. Wertes
% imagesc(t, f, 20*log10( max(abs(B), bmin)/bmin ) );
% % Alternativ auch mit:
% pcolor (t, f, 20*log10 (P)
% % Da die Funktion specgram nur ein lineares Spektrum darstellt ist
% % zur Darstellung von Sprachsignale die folgende die Funktion besser
% % geeignet (zu downloaden unter Lehre):
% logfsgram(signal, n_out,fs, N_Fenster, Uberlap, loFreq,1000);
% caxis([-30 30])
