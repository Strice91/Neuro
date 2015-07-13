function [ Envelops_Dy_Comp ] = comp_dyn(Env_Tp,comp_rate)

% Dynamik Kompression
SPL_Schwelle=30;
 % Hoerschwelle in [dB]
SPL_Dynamic=50;
 % Dynamikbereich in [dB]
I_THR=0.25e-3;     %I_THR=2e-3;
I_MCL=2.5e-3;    %I_MCL=20e-3;
% [A] Threshold
% [A] Most Confortabel Level
%-----------------------------------------------------------
% A_log=500; % Kompensation MedEl : 250 500 750 1000
%----------------------------------------------------------
%comp_rate=500;  % Compression rate

%[pa] Untere _Dynamik Schwelle
p_min=10^( (SPL_Schwelle) / 20 ) * 20e-6;   %[pa]
%[pa] Obere _Dynamik Schwelle
p_max=10^( (SPL_Schwelle+SPL_Dynamic) / 20 ) * 20e-6;   %[pa]

% Map Rule
% Akustisches Signal normieren
p_normed = (Env_Tp - p_min) / (p_max - p_min); % [0 1]

% "Clipping" der Werte außerhalb des Mapping Bereichs vermeiden
p_normed(p_normed>1) = 1;

if comp_rate == 0
    % c = 0 bedeutet lineares Mapping (siehe Handbuch MedEL)
    % [pa]  [0 1]  [A]
    Envelops_Dy_Comp = (I_MCL - I_THR) * p_normed + I_THR;
else
    % nicht lineares Mapping (siehe Handbuch MedEL)
    % [pa]  [0 1]  [A]
    Envelops_Dy_Comp = (I_MCL - I_THR) * log10(1 + comp_rate * p_normed) / ...
    log10(comp_rate + 1) + I_THR;
end

% Unterschwellige Werte auf 0 setzen
Envelops_Dy_Comp (Envelops_Dy_Comp < I_THR) = 0;


end

