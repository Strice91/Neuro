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


%% b)
active_compart = 80;
iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
[V,t,i_ion,gate] = compartNeuron(V0,t0,dt,dur,iStim,T,comparts);