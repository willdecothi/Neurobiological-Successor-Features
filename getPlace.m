function [cells] = getPlace(cells,M,env)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%smoothing sigma
smth_sig = 3;

for i = 1:length(cells)
    % initialise place map
    cells{i}.place = zeros(size(cells{1}.fmap));
    place_map = zeros(size(cells{1}.fmap));
    
    % get BVC to place cell weights
    w = M(i,:);
    
    % sum place cell inputs
    for j = 1:length(cells)
        place_map = place_map + cells{j}.fmap * w(j);
    end
    
    % normalise, smooth and threshold        
    place_map = place_map./max(place_map(:));
    place_map = max(place_map - 0.8,0);
    place_map = imgaussfilt(place_map,smth_sig)./ imgaussfilt(1*(env.L==2),smth_sig);
    place_map(env.L <= 1) = NaN;
    cells{i}.place = place_map./max(place_map(:));
end

end

