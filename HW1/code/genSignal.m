function [f, t ] = GenSignal( Freq, Amp, Dur, Rate )

t = 0:1/Rate:Dur;
X = (Freq' * t)';
f = Amp(1) + Amp(2:end) * sin(2*pi*X)'; 

end

