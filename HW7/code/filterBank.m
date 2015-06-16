function [ output_args ] = filterBank( loFreq,hiFreq,numChannels,n_ff,fs,x )

% Greenwood Parameters (1990)
EarQ = 7.23824;
minBW = 22.8509;
order = 1;

% Berechnung der ERB & Mittenfrequenzen
% numChannels: Anzahl der Kanäle
% loFreq: Niedrigste Frequenz (zb. 100 Hz)-> Erster Filter
% hiFreq: Höchste Frequenz (zb. 8000 Hz) -> Letzter Filter
ERBlo = ((loFreq/EarQ)^order + minBW^order) ^ (1/order);
ERBhi = ((hiFreq/EarQ)^order + minBW^order) ^ (1/order);
overlap = (ERBhi/ERBlo)^(1/(numChannels-1));

% Equivalent Rectangular Bandwidth
ERB = ERBlo * (overlap.^(0:numChannels-1));

% Mittenfrequenzen
cf = EarQ*(((ERB.^order) - (minBW.^order)).^(1/order));
cf_l = cf - ERB/2;
cf_h = cf + ERB/2;

% Erzeugen der Bandpassfilter (als IIR)
ftype = 'bandpass';
f_Ny=fs/2; % Nyquist Frequenz

N_l_Cf = cf_l / f_Ny;
N_u_Cf = cf_h / f_Ny;

for i=1:numChannels
    % Filter Ordnung 2
    % N_l_Cf : untere Grenzfrequenz (!!Grenzfrequenz sind
    % normiert auf die Nyquist Frequenz)
    [b,a]=butter(2,[N_l_Cf(i) N_u_Cf(i)],ftype);

    % Signal Filtern
    Filterausgang(:,i)=filter(b,a,x);
    % Frequenzgang und Gruppenlaufzeit
    [H(:,i),w] = freqz(b, a, n_ff, fs);
    [Gr(:,i), w_gd] = grpdelay (b, a, n_ff, fs);
end
% Achtung !!!!!! Bei Filtern Höherer Ordnung (>2)
% Transfer Function Design kann instabile Filter verursachen
% (Numerische Limitation in Matlab)in diesem Fall ist ein
% Zero-Pole-Gain Design zu bevorzugen

end

