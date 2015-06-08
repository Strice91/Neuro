function [x] = exp_euler_step(x_old,A,B,dt)

x = x_old .* exp(A*dt) - (B./A) .* (1-exp(A*dt));

end

