function [M,R] = trainModel(cells,M,R,traj,time_lag)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
h = waitbar(0,'Training model');

%total number of timesteps
total_steps = length(traj)-time_lag;

% can reduce learning rat over time if wish
start_alpha = 1e-4;
end_alpha = 1e-4;
% in which case linearly change learning rats
alpha = (1:total_steps)*(end_alpha-start_alpha)/(total_steps) + start_alpha;

% random foraging so never any rewards
r = 0;
for t = 1:total_steps
    waitbar(t/(length(traj)-time_lag))
    % get the two locations to learn between
    x = traj(t,1);
    y = traj(t,2);
    n_x = traj(t+time_lag,1);
    n_y = traj(t+time_lag,2);
    
    % get the firinng rates
    phi = GetRates(ceil(x), ceil(y), cells);
    n_phi = GetRates(ceil(n_x), ceil(n_y), cells);
    
    % excute learning rule
    [M, R] = SR_Update(r,phi, n_phi, M,R, alpha(t));
end
colorbar

close(h)
end

