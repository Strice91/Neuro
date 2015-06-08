function [ X,Y,Phi ] = calcPotentialComp(z,dimPlane,l_comp,I)

rho_medium = 300e+4;

[X,Y] =  meshgrid(-dimPlane(1)/2:l_comp:dimPlane(1)/2,-dimPlane(2)/2:l_comp:dimPlane(2)/2);

r = sqrt(X.^2 + Y.^2 + z^2);
r(end) = [];

Phi = (1 ./ (4 * pi .* r))' * (rho_medium * I);
end

