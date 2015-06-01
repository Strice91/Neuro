% close all;

dt = 0.025;
dur = 100;

pulseWidth = 5;
pulseDelay = 0;
amps = 10;

comparts = 100;

V0 = 0;
t0 = 0;
T = 6.3;

% Parameter
Para.c = 1;       % 1;
Para.roh = 0.1;      % 0.1;
Para.r = 2e-4;      %2e-4;
Para.l = 0.1e-4;       %0.1e-4;

Para.VNa = 115;
Para.VK = -12;
Para.VL = 10.6;
Para.Vrest = -70;

Para.gNa = 120;
Para.gK = 36;
Para.gL = 0.3;

Para.T = 6.3;

% Simulation
active_compart = 1;
iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
[V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

f = figure;
imagesc(V);
title('Stimulus bei Compartment 1')
ylabel('Compartment NR.');
xlabel('t in ms');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
c = colorbar;
ylabel(c, 'V in mV');
%print(f,'-dpng','../tex/img/compart1.png')