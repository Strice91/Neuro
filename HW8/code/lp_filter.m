function [ out ] = lp_filter(signal, eckfreq, fs)

f_Ny=fs/2;

[b,a] = butter(2,eckfreq/f_Ny);

out = filter(b,a,signal);

end

