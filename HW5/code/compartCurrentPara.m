function [i_ion,gate] = compartCurrentPara(V,dt,last_gate,T,Para)


k = 3 ^ ((Para.T-6.3)/10);

am = (2.5 - 0.1*V)  ./ (exp(2.5 - 0.1*V) - 1);
an = (0.1 - 0.01*V) ./ (exp(1 - 0.1*V) - 1);
ah = 0.07 * exp(-V/20);

bm = 4     * exp(-V/18);
bn = 0.125 * exp(-V/80);
bh = 1   ./ (exp(3-0.1*V) + 1);

% Zeitkonstanten
tau_m = 1 ./((am + bm)*k);
tau_n = 1 ./((an + bn)*k);
tau_h = 1 ./((ah + bh)*k);

% GG Werte
m_steady = am ./(am + bm);
n_steady = an ./(an + bn);
h_steady = ah ./(ah + bh);

% Werte Exp Euler
A = @(tau) -1./tau;
B = @(tau,x_steady) 1./tau .* x_steady;

% Konstanten
VNa   = Para.VNa; % 115;
VK    = Para.VK;  % -12;
VL    = Para.VL;  % 10.6;
gNa   = Para.gNa; % 120;
gK    = Para.gK;  % 36;
gL    = Para.gL;  % 0.3;

% Variablen aus der letzten Itteration
m_old = last_gate(:,1);
n_old = last_gate(:,2);
h_old = last_gate(:,3);

% Gateingvariablen
m = exp_euler_step(m_old,A(tau_m),B(tau_m,m_steady),dt);
n = exp_euler_step(n_old,A(tau_n),B(tau_n,n_steady),dt);
h = exp_euler_step(h_old,A(tau_h),B(tau_h,h_steady),dt);

% Strom
iNa = gNa * m.^3 .* h .* (V-VNa);
iK  = gK * n.^4 .* (V-VK);
iL  = gL * (V-VL);

% Zusammenfassung der Ergebnisse
i_ion = [iNa,iK,iL];
gate  = [m,n,h];


end

