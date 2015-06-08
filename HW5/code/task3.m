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
f = figure('position', [1366, 0, 640, 1080]);
c_array =  [0.6,1.5,1.9];
for i = 1:3
    Para.c = c_array(i);
    
    % Simulation
    active_compart = 1;
    iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
    [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

    subplot(3,1,i);
    imagesc(V);
    title(strcat(sprintf('c = %.2f',Para.c),'\muF/cm^2'))
    ylabel('Compartment NR.');
    xlabel('t in ms');
    set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
    c = colorbar;
    ylabel(c, 'V in mV');
end
print(f,'-dpng','../tex/img/change_c.png')

%% Change rho
Para = Default;
f = figure('position', [1366, 0, 640, 1080]);
roh_array =  [0.05,0.1,0.2];
for i = 1:3
    Para.roh = roh_array(i);
    
    % Simulation
    active_compart = 1;
    iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
    [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

    subplot(3,1,i);
    imagesc(V);
    title(strcat('\rho',sprintf(' = %.2f',Para.roh),'k\Omegacm'));
    ylabel('Compartment NR.');
    xlabel('t in ms');
    set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
    c = colorbar;
    ylabel(c, 'V in mV');
end
print(f,'-dpng','../tex/img/change_rho.png')
    
%% Change r axon
Para = Default;
f = figure('position', [1366, 0, 640, 1080]);
r_array =  [1.5e-4,2e-4,3e-4];
for i = 1:3
    Para.r = r_array(i);
    
    % Simulation
    active_compart = 1;
    iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
    [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

    subplot(3,1,i);
    imagesc(V);
    title(sprintf('r_{axon} = %.1e cm',Para.r))
    ylabel('Compartment NR.');
    xlabel('t in ms');
    set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
    c = colorbar;
    ylabel(c, 'V in mV');
end
print(f,'-dpng','../tex/img/change_r.png')

%% Change l comp
Para = Default;
f = figure('position', [1366, 0, 640, 1080]);
l_array =  [0.05e-4,0.16e-4,0.2e-4];
for i = 1:3
    Para.l = l_array(i);
    
    % Simulation
    active_compart = 1;
    iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
    [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

    subplot(3,1,i);
    imagesc(V);
    title(sprintf('l_{comp} = %.2e cm',Para.l))
    ylabel('Compartment NR.');
    xlabel('t in ms');
    set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
    c = colorbar;
    ylabel(c, 'V in mV');
end
print(f,'-dpng','../tex/img/change_l.png')

%% Change temperature
Para = Default;
f = figure('position', [1366, 0, 640, 1080]);
T_array =  [0,8,12];
for i = 1:3
    Para.T = T_array(i);
    
    % Simulation
    active_compart = 1;
    iStim = pulseGen(dur,dt,pulseWidth,pulseDelay,amps,comparts,active_compart);
    [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStim,T,comparts,Para);

    subplot(3,1,i);
    imagesc(V);
    title(strcat(sprintf('T = %.2f',Para.T),'^\circC'))
    ylabel('Compartment NR.');
    xlabel('t in ms');
    set(gca, 'XTick', 1:500:4001, 'XTickLabel', 0:12.5:100);
    c = colorbar;
    ylabel(c, 'V in mV');
end
print(f,'-dpng','../tex/img/change_T.png')