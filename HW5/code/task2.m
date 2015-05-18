close all;

dt = 0.025;
dur = 100;

pulseWidth = 5;
pulseDelay = 0;
amps = 10;

comparts = 100;

V0 = 0;
t0 = 0;
T = 6.3;

%% a)
active_compart = 20;
iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
[V,t,i_ion,gate] = compartNeuron(V0,t0,dt,dur,iStim,T,comparts);

figure;
imagesc(V);
title('Stimulus bei Compartment 20')
ylabel('Compartment NR.');
xlabel('t in ms');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
c = colorbar;
ylabel(c, 'V in mV');


%% b)
active_compart = 80;
iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
[V,t,i_ion,gate] = compartNeuron(V0,t0,dt,dur,iStim,T,comparts);

figure;
imagesc(V);
title('Stimulus bei Compartment 80')
ylabel('Compartment NR.');
xlabel('t in ms');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
c = colorbar;
ylabel(c, 'V in mV');