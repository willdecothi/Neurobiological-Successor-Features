function plotBVC(cells,n,m,env)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
figure
hold on
for i = 1:n*m
    subplot(n,m,i)
    h = imagesc(cells{i}.fmap); colormap jet;
    set(h,'AlphaData',env.L > 1)
    axis off
    title(sprintf('bvc %i',i))
end
set(gcf,'Position',[100 100 m*100 n*100])
end

