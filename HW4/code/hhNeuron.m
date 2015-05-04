function [V,t,i_ion,gate] = hhNeuron(V0,t0,dt,steps,iStimulus,T)

t = t0:dt:t0+steps*dt;
V = zeros(1,steps+1);
V(1) = V0; 
c = 1;

gate  = zeros(3,steps+1);
i_ion = zeros(3,steps+1);

% Anfangsbedingung im Steady State
[i_ion(:,1),gate(:,1)] = steadyState(V(1));

for k = 1:steps
    % Berechne Strom und Gating Variablen
    [i_ion(:,k+1),gate(:,k+1)] = hh_current(V(k),dt,gate(:,k),T);
    % Berechnen Membranspannung
    V(k+1) = V(k) + dt/c * (- sum(i_ion(:,k)) + iStimulus(k));
end

end

