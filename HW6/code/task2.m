close all;

dt = 0.025;
dur = 30;

pulseWidth = 1;
pulseDelay = 5;
amps = 5;

comparts = 100;

V0 = 0;
t0 = 0;
T = 6.3;
l_comp = 0.5;

%% a)

I = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,1);
[X,Y,Ve] = calcPotentialComp(10,[50,0],l_comp,I);

[V,t,i_ion,gate] = compartNeuron(V0,t0,dt,dur,T,comparts,Ve);

f = figure;
imagesc(V);
title('Stimulus bei Compartment 1')
ylabel('Compartment NR.');
xlabel('t in ms');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
c = colorbar;
ylabel(c, 'V in mV');
% print(f,'-dpng','../tex/img/compart1.png')