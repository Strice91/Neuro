close all;

I_THR=2e-3;
I_MCL=20e-3;

druck = 0:1e-3:0.25;

kennlinie1 = comp_dyn(druck,1000);

figure;
plot(kennlinie1);

figure;
semilogx(kennlinie1);