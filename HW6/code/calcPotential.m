function [ X,Y,Phi ] = calcPotential(z,dimPlane,I)

rho_medium = 300e+4;

[X,Y] =  meshgrid(-dimPlane(1)/2:0.1:dimPlane(1)/2,-dimPlane(2)/2:0.1:dimPlane(2)/2);

r = sqrt(X.^2 + Y.^2 + z^2);

Phi = (rho_medium * I) ./ (4 * pi .* r);
end

