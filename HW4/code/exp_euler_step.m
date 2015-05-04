function [m] = exp_euler_step(m_old,A,B,dt)

m = m_old * exp(A*dt) - (B/A) * (1-exp(A*dt));

end

