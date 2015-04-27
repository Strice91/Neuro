close all;

V0 = -60e-3;
t0 = 0;
dt = 25e-6;
steps = 2000; % für 50 ms
Vthr = ones(2001,1) * (-20e-3);
%%
I = @(t) 10e-6;
[V,t] = fireNeuron(V0,t0,dt,steps,I);

figure;
plot(t*1000,V);
hold on;
plot(t*1000,Vthr,'r--');
text(1,-18e-3,'V_{thr}','color','r');
xlabel('t in ms');
ylabel('V in V');
title('Neuron with I_{input} = 10µA');

%%
I = @(t) 20e-6;
[V,t] = fireNeuron(V0,t0,dt,steps,I);

figure;
plot(t*1000,V);
hold on;
plot(t*1000,Vthr,'r--');
text(1,-18e-3,'V_{thr}','color','r');
xlabel('t in ms');
ylabel('V in V');
title('Neuron with I_{input} = 20µA');

%%
I = @(t) abs(sin(2*pi*50*t) * 10e-6);
[V,t] = fireNeuron(V0,t0,dt,steps,I);

figure;
plot(t*1000,V);
hold on;
plot(t*1000,Vthr,'r--');
text(1,-18e-3,'V_{thr}','color','r');
xlabel('t in ms');
ylabel('V in V');
title('Neuron with I_{input} = 10µA sin 50Hz');

%%
I = @(t) abs(sin(2*pi*50*t) * 30e-6);
[V,t] = fireNeuron(V0,t0,dt,steps,I);

figure;
plot(t*1000,V);
hold on;
plot(t*1000,Vthr,'r--');
text(1,-18e-3,'V_{thr}','color','r');
xlabel('t in ms');
ylabel('V in V');
title('Neuron with I_{input} = 30µA sin 50Hz');