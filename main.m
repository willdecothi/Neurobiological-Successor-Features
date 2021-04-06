load('environment.mat')
load('cells.mat')
load('trajectory.mat')

n_cells = length(cells);

% initialise SF matrix
M = ones(n_cells);
% intitialise reward vector (not used unless reward in env)
R = zeros(n_cells,1);
% time_scale for learning (sampled at 50Hz)
time_lag = 1;

[M,R] = trainModel(cells, M, R, traj, time_lag);

cells = getPlace(cells,M,env);
cells = getGrid(cells,M,env);

plotBVC(cells,10,16,env);
plotPlace(cells,10,16,env)
plotGrid(cells,10,16,env)