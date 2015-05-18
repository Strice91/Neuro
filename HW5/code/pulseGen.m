function [Pulse] = pulseGen(dur,dt,pulseWidth,pluseDelay,amps,comparts_nr,active_comparts)

steps = dur/dt;
pulseCnt = length(amps);
p = zeros(1,steps+1);

widthSteps = pulseWidth/dt;
delaySteps = pluseDelay/dt;

cnt = 1;
for i = 1:pulseCnt
    cnt = cnt + delaySteps;
    p(cnt:cnt+widthSteps) = amps(i);
    cnt = cnt + widthSteps;
end

Pulse = zeros(comparts_nr,steps+1);

for c = 1:length(active_comparts)
   Pulse(active_comparts(c),:) = p; 
end

end

