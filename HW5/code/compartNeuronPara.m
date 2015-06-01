function [V,t,i_ion,gate] = compartNeuronPara(V0,t0,dt,dur,iStimulus,T,comparts,Para)

steps = dur/dt;
t = t0:dt:t0+steps*dt;
V = zeros(comparts,steps+1);
V(:,1) = V0; 
c = Para.c;          %1;

roh_axon = Para.roh; % 0.1;
r_axon = Para.r;     % 2e-4;
l_comp = Para.l;     % 0.1e-4;

Ra = roh_axon * l_comp / (r_axon^2 * pi);


% Connection Matrix
C = diag(ones(comparts,1)*-2);
C = C + diag(ones(comparts-1,1),1);
C = C + diag(ones(comparts-1,1),-1);
C(1,1) = -1;
C(end,end) = -1;

gate  = zeros(comparts,steps+1,3);
i_ion = zeros(comparts,steps+1,3);

% Anfangsbedingung im Steady State
[i_ion(:,1,:),gate(:,1,:)] = steadyState(V(:,1));

for k = 1:steps
    % Berechne Strom und Gating Variablen
    [i_ion(:,k+1,:),gate(:,k+1,:)] = compartCurrentPara(V(:,k),dt,gate(:,k,:),T,Para);
    % Berechnen Membranspannung
    B = V(:,k) + dt/c * (- sum(i_ion(:,k,:),3) + iStimulus(:,k));
    A = (eye(comparts) - dt/(c * Ra) * C);
    V(:,k+1) = A\B;
end

end

