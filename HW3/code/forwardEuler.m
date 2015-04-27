function [V,t] = forwardEuler(V0,t0,dt,steps,fkt)

t = t0:dt:t0+steps*dt;
V = zeros(1,steps+1);
V(1) = V0; 

for k = 1:steps
    V(k+1) = V(k) + dt*fkt(V(k),t(k));
end

end

