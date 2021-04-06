function [new_M, R] = SR_Update(r,phi,n_phi,M,R,alpha)
%SR_UPDATE Summary of this function goes here
%   Detailed explanation goes here
% discount factor
gamma = 0.995;
% reward learning rate
r_alpha = 1e-6;

new_M = M + alpha * (phi' + gamma * M * n_phi' - M * phi') * phi;

R = R + r_alpha * M * phi' .* (r + gamma * dot(M * n_phi', R) - dot(M * phi', R));

end

