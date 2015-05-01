close all;

v = linspace(-5,5,30);
t = linspace(-5,5,30);
[t_gird, v_grid] = meshgrid(t,v);

ode_rhs1 = @(V,t,C,R,Imax) 1/C * (Imax * sin(t) - V/R);
ode_rhs2 = @(V,t,C,R,Imax) 1/C * (Imax * sin(t) - V/R + 2);
ISO = @(dVdt,C,R,Imax,D,t) (Imax*sin(t) - dVdt*C + D) * R;

C = 1;
R = 1;

%% 2.1.1
lng = sqrt(ode_rhs1(v_grid,t_gird,C,R,0).^2 + 1);
dt = 1./lng;
dv = ode_rhs1(v_grid,t_gird,C,R,0) ./ lng;

f = figure;
hold all;
quiver(t,v,dt,dv);
plot(t,ISO(-2,C,R,0,0,t));
plot(t,ISO(-1,C,R,0,0,t));
plot(t,ISO(0,C,R,0,0,t));
plot(t,ISO(1,C,R,0,0,t));
plot(t,ISO(2,C,R,0,0,t));
xlabel('t in s');
ylabel('V in V');
title('I_{max} = 0A, D = 0A')
legend('dV/dt','ISO -2','ISO -1','ISO 0','ISO 1','ISO 2');
ylim([-5,5]);
xlim([-5,5]);
box on;
print(f,'-dpng','../tex/img/slopefield1.png')

%% 2.1.2
lng = sqrt(ode_rhs1(v_grid,t_gird,C,R,1).^2 + 1);
dt = 1./lng;
dv = ode_rhs1(v_grid,t_gird,C,R,1) ./ lng;

f = figure;
hold all;
quiver(t,v,dt,dv);
plot(t,ISO(-2,C,R,1,0,t));
plot(t,ISO(-1,C,R,1,0,t));
plot(t,ISO(0,C,R,1,0,t));
plot(t,ISO(1,C,R,1,0,t));
plot(t,ISO(2,C,R,1,0,t));
xlabel('t in s');
ylabel('V in V');
title('I_{max} = 1A, D = 0A')
legend('dV/dt','ISO -2','ISO -1','ISO 0','ISO 1','ISO 2');
ylim([-5,5]);
xlim([-5,5]);
box on;
print(f,'-dpng','../tex/img/slopefield2.png')

%% 2.1.3
lng = sqrt(ode_rhs2(v_grid,t_gird,C,R,0).^2 + 1);
dt = 1./lng;
dv = ode_rhs2(v_grid,t_gird,C,R,0) ./ lng;

f = figure;
hold all;
quiver(t,v,dt,dv);
plot(t,ISO(-2,C,R,0,2,t));
plot(t,ISO(-1,C,R,0,2,t));
plot(t,ISO(0,C,R,0,2,t));
plot(t,ISO(1,C,R,0,2,t));
plot(t,ISO(2,C,R,0,2,t));
xlabel('t in s');
ylabel('V in V');
title('I_{max} = 0A, D = 2A')
legend('dV/dt','ISO -2','ISO -1','ISO 0','ISO 1','ISO 2');
ylim([-5,5]);
xlim([-5,5]);
box on;
print(f,'-dpng','../tex/img/slopefield3.png')

%% 2.1.4
lng = sqrt(ode_rhs2(v_grid,t_gird,C,R,1).^2 + 1);
dt = 1./lng;
dv = ode_rhs2(v_grid,t_gird,C,R,1) ./ lng;

f = figure;
hold all;
quiver(t,v,dt,dv);
plot(t,ISO(-2,C,R,1,2,t));
plot(t,ISO(-1,C,R,1,2,t));
plot(t,ISO(0,C,R,1,2,t));
plot(t,ISO(1,C,R,1,2,t));
plot(t,ISO(2,C,R,1,2,t));
xlabel('t in s');
ylabel('V in V');
title('I_{max} = 1A, D = 2A')
legend('dV/dt','ISO -2','ISO -1','ISO 0','ISO 1','ISO 2');
ylim([-5,5]);
xlim([-5,5]);
box on;
print(f,'-dpng','../tex/img/slopefield4.png')