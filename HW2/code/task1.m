close all;

%% 1.1
f = figure;
v = linspace(-5,5,30);
t = linspace(-5,5,30);
[t_gird, v_grid] = meshgrid(t,v);
fkt1 = @(V,t) 1 - V - t;
lng = sqrt(fkt1(v_grid,t_gird).^2 + 1);
dt = 1./lng;
dv = fkt1(v_grid,t_gird) ./ lng;

quiver(t, v, dt, dv);
iso1 = 3 - t;       % isokline -2
iso2 = 2 - t;       % isokline -1
iso3 = 1 - t;       % isokline 0
iso4 = -t;          % isokline 1
iso5 = -1 - t;      % isokline 2

hold all;
plot(t,iso1);
plot(t,iso2);
plot(t,iso3);
plot(t,iso4);
plot(t,iso5);
title('Vd/dt = 1 - V - t');
legend('dV/dt','ISO -2','ISO -1','ISO 0','ISO 1','ISO 2')
xlabel('t in s');
ylabel('V in V');
ylim([-5,5]);
xlim([-5,5]);
print(f,'-dpng','../tex/img/fkt1.png') 

%% 1.2
f = figure;
v = linspace(-5,5,30);
t = linspace(-5,5,30);
[t_gird, v_grid] = meshgrid(t,v);
fkt2 = @(V,t) sin(t) - V/1.5;
lng = sqrt(fkt2(v_grid,t_gird).^2 + 1);
dt = 1./lng;
dv = fkt2(v_grid,t_gird) ./ lng;

quiver(t, v, dt, dv);
iso1 = 1.5*(sin(t)+2);       % isokline -2
iso2 = 1.5*(sin(t)+1);       % isokline -1
iso3 = 1.5*(sin(t));       % isokline 0
iso4 = 1.5*(sin(t)-1);          % isokline 1
iso5 = 1.5*(sin(t)-2);      % isokline 2

hold all;
plot(t,iso1);
plot(t,iso2);
plot(t,iso3);
plot(t,iso4);
plot(t,iso5);
legend('dV/dt','ISO -2','ISO -1','ISO 0','ISO 1','ISO 2')
xlabel('t in s');
ylabel('V in V');
title('Vd/dt = sin(t) - V/1.5');
ylim([-5,5]);
xlim([-5,5]);

print(f,'-dpng','../tex/img/fkt2.png')