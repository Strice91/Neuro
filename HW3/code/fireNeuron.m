function [V,t] = fireNeuron(V0,t0,dt,steps,I)

t = t0:dt:t0+steps*dt;
V = zeros(1,steps+1);
V(1) = V0; 
Vthr = -20e-3;
Vrest = -60e-3;
Vspike = 20e-3;
Cm = 1e-6;
gl = 100e-6;


for k = 1:steps
    
    
    if V(k) >= Vthr && V(k) < Vspike
        V(k+1) = Vspike;
    elseif V(k) == Vspike;
        V(k+1) = Vrest;
    else
        V(k+1) = V(k) + dt/Cm * (-gl * (V(k)-Vrest) + I(t(k)));
    end
end

end

