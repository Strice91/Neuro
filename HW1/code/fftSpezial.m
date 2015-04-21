function [ F ] = fftSpezial( sig,rate )

F = fft(sig) / length(sig);         % FFT auf l‰nge normiert
F = F(1:rate/2);                    % nur positive Frequenzen
F(2:end) = F(2:end) * 2;            % Skaliere alle Freq. auﬂer DC

end

