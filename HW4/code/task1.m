am = @(V) (2.5 - 0.1*V) ./ (exp(2.5 - 0.1*V) - 1);
an = @(V) (0.1 - 0.01*V) ./ (exp(1 - 0.1*V) - 1 );
ah = @(V) 0.07 * exp(-V/20);

bm = @(V) 4 * exp(-V/18);
bn = @(V) 0.125 * exp(-V/80);
bh = @(V) 1 ./ (exp(3-0.1*V) + 1);

tau = @(a,b,k) 1 ./((a + b)*k);
x_steady = @(a,b) a ./ (a+b);
k = @(T) 3 ^ (T-6.3)/10;

V = (-100:100);

T = 6.3;

tm = tau(am(V),bm(V),k(T));
tn = tau(an(V),bn(V),k(T));
th = tau(ah(V),bh(V),k(T));

close all;

figure;
hold all;
plot(V,tm);
plot(V,tn);
plot(V,th);
legend('\tau_m','\tau_n','\tau_h')
xlabel('V in mV')
ylabel('\tau_x in ms')
title('Zeitkonstanten bei 6.3^\circ C')

T = 28;

tm = tau(am(V),bm(V),k(T));
tn = tau(an(V),bn(V),k(T));
th = tau(ah(V),bh(V),k(T));

figure;
hold all;
plot(V,tm);
plot(V,tn);
plot(V,th);
legend('\tau_m','\tau_n','\tau_h')
xlabel('V in mV')
ylabel('\tau_x in ms')
title('Zeitkonstanten bei 28^\circ C')

m_steady = x_steady(am(V),bm(V));
n_steady = x_steady(an(V),bn(V));
h_steady = x_steady(ah(V),bh(V));

figure;
hold all;
plot(V,m_steady);
plot(V,n_steady);
plot(V,h_steady);
legend('m_\infty','n_\infty','h_\infty')
xlabel('V in mV')
ylabel('x_\infty')
title('Gating Variablen bei 6,3^\circ C und 28^\circ C')
