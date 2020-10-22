function rgh = roughness(data, hasPlot, shrink)
    [row,~] = size(data);
    mid = floor(row/2);
    [x,y] = find(data ~= 0);
    k = boundary(x,y,shrink); %default shrink = 0.5
    rgh = std(sqrt((x(k)-mid).^2+(y(k)-mid).^2));
    if hasPlot
        figure 
        hold on
        plot(x,y,'.');
        plot(x(k),y(k),'LineWidth',3);
        s = sprintf('Boundary Roughness = %.2f',rgh);
        legend('Data Points',s)
    end
end
           