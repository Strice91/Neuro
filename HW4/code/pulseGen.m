function [p] = pulseGen(dur,dt,pulseWidth,pluseDelay,amps)

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


end

