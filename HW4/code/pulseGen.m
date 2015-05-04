function [ output_args ] = pulseGen( input_args )

% Construct a train of 2 GHz rectangular pulses sampled at a rate of 100 GHz at a spacing of 7.5nS.
fs = 100E9;                    % sample freq
D = [2.5 10 17.5]' * 1e-9;     % pulse delay times
t = 0 : 1/fs : 2500/fs;        % signal evaluation time
w = 1e-9;                      % width of each pulse
yp = pulstran(t,D,@rectpuls,w);


end

