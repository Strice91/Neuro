function [ V,t ] = heun(V0,t0,dt,dur,fkt)

steps = ceil(dur/dt);
t = t0:dt:t0+steps*dt;
V = zeros(1,steps+1);
V(1) = V0; 

for k = 1:steps
    A = fkt(V(k),t(k));
    V_temp = V(k) + A*dt;
    B = fkt(V_temp,t(k+1));
    V(k+1) = V(k) + (A + B)/2*dt;
end


end

