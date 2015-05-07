close all;

dur = 100;
dt  = 0.01;
steps = dur/dt;

%Anfangsbedingungen
t0 = 0;
V0 = 0;

%% 2.1
T = 6.3;

% Stimulus
pulseWidth = 5;
pulseDelay = 10;
amps = [1,2,3,4,5];
iStimulus = pulseGen(dur,dt,pulseWidth,pulseDelay,amps);

[V,t,i_ion,gate] = hhNeuron(V0,t0,dt,steps,iStimulus,T);

figure;
plot(t,iStimulus);
title('Stimulus');
xlabel('t in ms');
ylabel('i_{stimulus} in \muA/cm^2')
box on;
ylim([0,6]);
matlab2tikz('../tex/img/Stiumulus6.tikz')

figure;
plot(t,V);
title('Membranpotential bei 6.3^\circ C');
xlabel('t in ms');
ylabel('V in mV');
box on;
matlab2tikz('../tex/img/Membranpotential6.tikz')

figure;
hold all;
plot(t,gate(1,:));
plot(t,gate(2,:));
plot(t,gate(3,:));
legend('m','n','h');
title('Gating Variablen bei 6.3^\circ C');
xlabel('t in ms');
ylabel('WSK');
box on;
matlab2tikz('../tex/img/Gating6.tikz')

figure;
hold all;
plot(t,i_ion(1,:));
plot(t,i_ion(2,:));
legend('i_{Na}','i_K');
title('Stromdichten bei 6.3^\circ C');
xlabel('t in ms');
ylabel('i in \mu A / cm^2');
box on;
matlab2tikz('../tex/img/Stromdichten6.tikz')

figure;
hold all;
plot(V,i_ion(1,:));
plot(V,i_ion(2,:));
plot(V,i_ion(3,:));
legend('i_{Na}','i_K','i_L');
title('Phasenportrait bei 6.3^\circ C');
xlabel('V in mV');
ylabel('i in \mu A / cm^2');
box on;
matlab2tikz('../tex/img/Phasenportrait6.tikz')

%% 2.2
T = 28;

% Stimulus
pulseWidth = 5;
pulseDelay = 10;
amps = [2,4,8,16,32];
iStimulus = pulseGen(dur,dt,pulseWidth,pulseDelay,amps);

[V,t,i_ion,gate] = hhNeuron(V0,t0,dt,steps,iStimulus,T);

figure;
plot(t,iStimulus);
title('Stimulus');
xlabel('t in ms');
ylabel('i_{stimulus} in \muA/cm^2')
box on;
ylim([0,33]);
matlab2tikz('../tex/img/Stiumulus28.tikz')

figure;
plot(t,V);
title('Membranpotential bei 28^\circ C');
xlabel('t in ms');
ylabel('V in mV');
box on;
matlab2tikz('../tex/img/Membranpotential28.tikz')

figure;
hold all;
plot(t,gate(1,:));
plot(t,gate(2,:));
plot(t,gate(3,:));
legend('m','n','h');
title('Gating Variablen bei 28^\circ C');
xlabel('t in ms');
ylabel('WSK');
box on;
matlab2tikz('../tex/img/Gating28.tikz')

figure;
hold all;
plot(t,i_ion(1,:));
plot(t,i_ion(2,:));
legend('i_{Na}','i_K');
title('Stromdichten bei 28^\circ C');
xlabel('t in ms');
ylabel('i in \mu A / cm^2');
box on;
matlab2tikz('../tex/img/Stromdichten28.tikz')

figure;
hold all;
plot(V,i_ion(1,:));
plot(V,i_ion(2,:));
plot(V,i_ion(3,:));
legend('i_{Na}','i_K','i_L');
title('Phasenportrait bei 28^\circ C');
xlabel('V in mV');
ylabel('i in \mu A / cm^2');
box on;
matlab2tikz('../tex/img/Phasenportrait28.tikz')