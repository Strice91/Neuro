close all;
V0 = -4;
t0 = -4,5;
steps = 1000;
fkt = @(V,t) 1-V-t;
A = @(t) -1;
B = @(V,t) 1-t;

dt = [1,0.5,0.1,0.012];
style = {'-*','-o','-+','-'};
figure;
hold on;
for i = 1:4
   [V,t] = forwardEuler(V0,t0,dt(i),steps,fkt) ;
   plot(t,V,style{i});
end
xlim([-5,6]);
ylim([-5,6]);
legend('dt = 1s','dt = 0.5s','dt = 0.1','dt = 0.012')
xlabel('t in s');
ylabel('V in V');
title('Forward Euler');

figure;
hold all;
for i = 1:4
   [V,t] = heun(V0,t0,dt(i),steps,fkt) ;
   plot(t,V,style{i});
end
xlim([-5,6]);
ylim([-5,6]);
legend('dt = 1s','dt = 0.5s','dt = 0.1','dt = 0.012')
xlabel('t in s');
ylabel('V in V');
title('Heun');

figure;
hold all;
for i = 1:4
   [V,t] = expEuler(V0,t0,dt(i),steps,A,B) ;
   plot(t,V,style{i});
end
xlim([-5,6]);
ylim([-5,10]);
legend('dt = 1s','dt = 0.5s','dt = 0.1','dt = 0.012')
xlabel('t in s');
ylabel('V in V');
title('Exponential Euler');