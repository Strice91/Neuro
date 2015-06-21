function [p] = pulseGen(dur,dt,pulseWidth,pluseDelay,amps,bi_phase)

steps = dur/dt;
pulseCnt = length(amps);
p = zeros(1,steps+1);

widthSteps = pulseWidth/dt;
delaySteps = pluseDelay/dt;

if nargin < 6
    cnt = 1;
    for i = 1:pulseCnt
        cnt = cnt + delaySteps;
        p(cnt:cnt+widthSteps) = amps(i);
        cnt = cnt + widthSteps;
    end
else
    cnt = 1;
    for i = 1:pulseCnt
        cnt = cnt + delaySteps;
        p(cnt:cnt+widthSteps) = -amps(i);
        cnt = cnt + widthSteps;
        p(cnt:cnt+widthSteps) = amps(i);
        cnt = cnt + widthSteps;
    end    
end

end

