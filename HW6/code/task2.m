close all;

dt = 0.025;
dur = 30;

pulseWidth = 1;
pulseDelay = 5;

comparts = 100;

V0 = 0;
t0 = 0;
T = 6.3;
l_comp = 0.5;

%% 1)
amps = -0.25;
I = pulseGen(dur,dt,pulseWidth,pulseDelay,amps);
[X,Y,Ve] = calcPotentialComp(10,[50,0],l_comp,I);

[V,t,i_ion,gate] = compartNeuron(V0,t0,dt,dur,T,comparts,Ve);

f = figure;
imagesc(V);
title('mono-phasic -0.25mA')
ylabel('Compartment NR.');
xlabel('t in ms');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
c = colorbar;
ylabel(c, 'V in mV');
print(f,'-dpng','../tex/img/mono_neg_025_1.png')

f = figure;
mesh(V);
title('mono-phasic -0.25mA')
ylabel('Compartment NR.');
xlabel('t in ms');
zlabel('V in mV');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
print(f,'-dpng','../tex/img/mono_neg_025_2.png')

%% 2)
amps = -1;
I = pulseGen(dur,dt,pulseWidth,pulseDelay,amps);
[X,Y,Ve] = calcPotentialComp(10,[50,0],l_comp,I);

[V,t,i_ion,gate] = compartNeuron(V0,t0,dt,dur,T,comparts,Ve);

f = figure;
imagesc(V);
title('mono-phasic -1mA')
ylabel('Compartment NR.');
xlabel('t in ms');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
c = colorbar;
ylabel(c, 'V in mV');
print(f,'-dpng','../tex/img/mono_neg_1_1.png')

f = figure;
mesh(V);
title('mono-phasic -1mA')
ylabel('Compartment NR.');
xlabel('t in ms');
zlabel('V in mV');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
print(f,'-dpng','../tex/img/mono_neg_1_2.png')

%% 3)
amps = 0.5;
I = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,1);
[X,Y,Ve] = calcPotentialComp(10,[50,0],l_comp,I);

[V,t,i_ion,gate] = compartNeuron(V0,t0,dt,dur,T,comparts,Ve);

f = figure;
imagesc(V);
title('bi-phasic 0.5mA')
ylabel('Compartment NR.');
xlabel('t in ms');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
c = colorbar;
ylabel(c, 'V in mV');
print(f,'-dpng','../tex/img/bi_05_1.png')

f = figure;
mesh(V);
title('bi-phasic 0.5mA')
ylabel('Compartment NR.');
xlabel('t in ms');
zlabel('V in mV');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
print(f,'-dpng','../tex/img/bi_05_2.png')

%% 4)
amps = 2;
I = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,1);
[X,Y,Ve] = calcPotentialComp(10,[50,0],l_comp,I);

[V,t,i_ion,gate] = compartNeuron(V0,t0,dt,dur,T,comparts,Ve);

f = figure;
imagesc(V);
title('bi-phasic 2mA')
ylabel('Compartment NR.');
xlabel('t in ms');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
c = colorbar;
ylabel(c, 'V in mV');
print(f,'-dpng','../tex/img/bi_2_1.png')

f = figure;
mesh(V);
title('bi-phasic 2mA')
ylabel('Compartment NR.');
xlabel('t in ms');
zlabel('V in mV');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
print(f,'-dpng','../tex/img/bi_2_2.png')

%% 5)
amps = 0.25;
I = pulseGen(dur,dt,pulseWidth,pulseDelay,amps);
[X,Y,Ve] = calcPotentialComp(10,[50,0],l_comp,I);

[V,t,i_ion,gate] = compartNeuron(V0,t0,dt,dur,T,comparts,Ve);

f = figure;
imagesc(V);
title('mono-phasic 0.25mA')
ylabel('Compartment NR.');
xlabel('t in ms');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
c = colorbar;
ylabel(c, 'V in mV');
print(f,'-dpng','../tex/img/mono_pos_025_1.png')

f = figure;
mesh(V);
title('mono-phasic 0.25mA')
ylabel('Compartment NR.');
xlabel('t in ms');
zlabel('V in mV');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
print(f,'-dpng','../tex/img/mono_pos_025_2.png')

%% 5)
amps = 5;
I = pulseGen(dur,dt,pulseWidth,pulseDelay,amps);
[X,Y,Ve] = calcPotentialComp(10,[50,0],l_comp,I);

[V,t,i_ion,gate] = compartNeuron(V0,t0,dt,dur,T,comparts,Ve);

f = figure;
imagesc(V);
title('mono-phasic 5mA')
ylabel('Compartment NR.');
xlabel('t in ms');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
c = colorbar;
ylabel(c, 'V in mV');
print(f,'-dpng','../tex/img/mono_pos_5_1.png')

f = figure;
mesh(V);
title('mono-phasic 5mA')
ylabel('Compartment NR.');
xlabel('t in ms');
zlabel('V in mV');
set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
print(f,'-dpng','../tex/img/mono_pos_5_2.png')