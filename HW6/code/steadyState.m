function [i_ion,gate] = steadyState(V)

comparts = size(V,1);

% Konstanten
VNa   = 115;
VK    = -12;
VL    = 10.6;
gNa   = 120;
gK    = 36;
gL    = 0.3;

am = (2.5 - 0.1*V)  ./ (exp(2.5 - 0.1*V) - 1);
an = (0.1 - 0.01*V) ./ (exp(1 - 0.1*V) - 1);
ah = 0.07 * exp(-V/20);

bm = 4     * exp(-V/18);
bn = 0.125 * exp(-V/80);
bh = 1   ./ (exp(3-0.1*V) + 1);

% Gating Variablen im Steady State
m = am ./ (am + bm);
n = an ./ (an + bn);
h = ah ./ (ah + bh);

% Strom
iNa = gNa * m.^3 .* h .* (V-VNa);
iK  = gK * n.^4 .* (V-VK);
iL  = gL * (V-VL);

i_ion = [iNa,iK,iL];
gate = [m,n,h];

end

