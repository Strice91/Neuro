function [ V,t ] = expEuler(V0,t0,dt,dur,A,B)

steps = ceil(dur/dt);
t = t0:dt:t0+steps*dt;
V = zeros(1,steps+1);
V(1) = V0; 

for k = 1:steps
    V(k+1) = V(k) * exp(A(t(k))*dt) + (B(V(k),t(k)) / A(t(k))) * (1-exp(-A(t(k))*dt));
end

end

