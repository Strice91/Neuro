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

% Parameter
Para.c = 1;         % 1;
Para.roh = 0.1;     % 0.1;
Para.r = 2e-4;      % 2e-4;
Para.l = 0.1e-4;    % 0.1e-4;
Para.T = 6.3;       % 6.3

% Konstanten
Para.VNa = 115;
Para.VK = -12;
Para.VL = 10.6;
Para.Vrest = -70;

Para.gNa = 120;
Para.gK = 36;
Para.gL = 0.3;

Default = Para;

%% Change c
Para = Default;
f = figure;
c_array =  [0.5,1,5];
for i = 1:3
    Para.c = c_array(i);
    
    % Simulation
    active_compart = 1;
    iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
    [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

    subplot(3,1,i);
    imagesc(V);
    title(sprintf('c = %.2f',Para.c))
    ylabel('Compartment NR.');
    xlabel('t in ms');
    set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
    c = colorbar;
    ylabel(c, 'V in mV');
end
%print(f,'-dpng','../tex/img/compart1.png')

%% Change rho
Para = Default;
f = figure;
roh_array =  [0.05,0.1,0.2];
for i = 1:3
    Para.roh = roh_array(i);
    
    % Simulation
    active_compart = 1;
    iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
    [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

    subplot(3,1,i);
    imagesc(V);
    title(sprintf('rho = %.2f',Para.roh))
    ylabel('Compartment NR.');
    xlabel('t in ms');
    set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
    c = colorbar;
    ylabel(c, 'V in mV');
end
%print(f,'-dpng','../tex/img/compart1.png')
    
%% Change r axon
Para = Default;
f = figure;
r_array =  [1.5e-4,2e-4,3e-4];
for i = 1:3
    Para.r = r_array(i);
    
    % Simulation
    active_compart = 1;
    iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
    [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

    subplot(3,1,i);
    imagesc(V);
    title(sprintf('r_{axon} = %.1e',Para.r))
    ylabel('Compartment NR.');
    xlabel('t in ms');
    set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
    c = colorbar;
    ylabel(c, 'V in mV');
end
%print(f,'-dpng','../tex/img/compart1.png')

%% Change l comp
Para = Default;
f = figure;
l_array =  [0.05e-4,0.1e-4,0.2e-4];
for i = 1:3
    Para.l = l_array(i);
    
    % Simulation
    active_compart = 1;
    iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
    [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

    subplot(3,1,i);
    imagesc(V);
    title(sprintf('l_{comp} = %.2e',Para.l))
    ylabel('Compartment NR.');
    xlabel('t in ms');
    set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
    c = colorbar;
    ylabel(c, 'V in mV');
end
%print(f,'-dpng','../tex/img/compart1.png')

%% Change temperature
Para = Default;
f = figure;
T_array =  [0,6.3,12];
for i = 1:3
    Para.T = T_array(i);
    
    % Simulation
    active_compart = 1;
    iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
    [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

    subplot(3,1,i);
    imagesc(V);
    title(sprintf('T = %.2f',Para.T))
    ylabel('Compartment NR.');
    xlabel('t in ms');
    set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
    c = colorbar;
    ylabel(c, 'V in mV');
end
%print(f,'-dpng','../tex/img/compart1.png')