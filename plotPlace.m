function plotPlace(cells,n,m,env)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
figure
hold on
for i = 1:n*m
    subplot(n,m,i)
    h = imagesc(cells{i}.place); colormap jet;
    set(h,'AlphaData',env.L > 1)
    axis off
    title(sprintf('place %i',i))
    pbaspect([env.dim_x,env.dim_y,1])
end
set(gcf,'Position',[100 100 m*100 n*100])
end

