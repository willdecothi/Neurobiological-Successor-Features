function [cells] = getGrid(cells,M,env)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%smoothing sigma
smth_sig = 3;

% do eigndecomposition of SF matrix
[V,~] = eig(M);

for i = 1:length(cells)
    % initialise grid map
    grid_map = zeros(size(cells{1}.fmap));
    
    % get BVC to grid cell weights
    ev = V(:,i);
    
    % sum place cell inputs
    for j = 1:length(cells)
        grid_map = grid_map + ev(j) * cells{j}.fmap;
    end
    
    % normalise, smooth and threshold        
    grid_map = grid_map./max(grid_map(:));
    grid_map = imgaussfilt(grid_map,smth_sig)./imgaussfilt(1*(env.L==2),smth_sig);
    grid_map(env.L <= 1) = NaN;
    grid_map = max(grid_map-0,0);
    cells{i}.grid = grid_map;
end
end

