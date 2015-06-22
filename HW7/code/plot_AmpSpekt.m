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


