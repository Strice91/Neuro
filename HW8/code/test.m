% parameters of linear up/down-sweep
freq1 = 20;
freq2 = 20000;
fs = 44100;

% length of a sweep in one direction
endTime = 0.1;

% number of samples of a sweep in one sweep direction
N = endTime * fs;

% instantaneous frequency at each point in time ...
% ... first increasing for N points, then decreasing for N points
inst_f = [linspace(freq1, freq2, N) linspace(freq2, freq1, N)];

% since (in continuous time) instantaneous frequency is derivative of
% phase, we have to compute the "integral" to get the phase for sin().
phi = 2 * pi * cumsum(inst_f) / fs;
sweep = sin(phi);

% plotting
plot(sweep);