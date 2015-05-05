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
subplot(2,1,1);
plot(t*1000,V);
hold on;
plot(t*1000,Vthr,'r--');
text(1,-18e-3,'V_{thr}','color','r');
xlabel('t in ms');
ylabel('V in V');
title('Neuron with I_{input} = 10\muA');
subplot(2,1,2);
plot(t*1000,ones(size(t))*I(t)*10e+5,'g');
xlabel('t in ms');
ylabel('I_{input} in \muA');
matlab2tikz('../tex/img/neuron1.tikz')

%%
I = @(t) 20e-6;
[V,t] = fireNeuron(V0,t0,dt,steps,I);

figure;
subplot(2,1,1);
plot(t*1000,V);
hold on;
plot(t*1000,Vthr,'r--');
text(1,-18e-3,'V_{thr}','color','r');
xlabel('t in ms');
ylabel('V in V');
title('Neuron with I_{input} = 20\muA');
subplot(2,1,2);
plot(t*1000,ones(size(t))*I(t)*10e+5,'g');
xlabel('t in ms');
ylabel('I_{input} in \muA');
matlab2tikz('../tex/img/neuron2.tikz')

%%
I = @(t) abs(sin(2*pi*50*t) * 10e-6);
[V,t] = fireNeuron(V0,t0,dt,steps,I);

figure;
subplot(2,1,1);
plot(t*1000,V);
hold on;
plot(t*1000,Vthr,'r--');
text(1,-18e-3,'V_{thr}','color','r');
xlabel('t in ms');
ylabel('V in V');
title('Neuron with I_{input} = 10\muA sin 50Hz');
subplot(2,1,2);
plot(t*1000,I(t)*10e+5,'g');
xlabel('t in ms');
ylabel('I_{input} in \muA');
matlab2tikz('../tex/img/neuron3.tikz')

%%
I = @(t) abs(sin(2*pi*50*t) * 30e-6);
[V,t] = fireNeuron(V0,t0,dt,steps,I);

figure;
subplot(2,1,1);
plot(t*1000,V);
hold on;
plot(t*1000,Vthr,'r--');
text(1,-18e-3,'V_{thr}','color','r');
xlabel('t in ms');
ylabel('V in V');
title('Neuron with I_{input} = 30\muA sin 50Hz');
subplot(2,1,2);
plot(t*1000,I(t)*10e+5,'g');
xlabel('t in ms');
ylabel('I_{input} in \muA');
matlab2tikz('../tex/img/neuron4.tikz')