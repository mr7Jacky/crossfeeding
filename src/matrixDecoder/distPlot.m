%plot distribution
function distPlot(cells,type, gap)
    if type == 'A'
        pos = 3;
    elseif type == 'B'
        pos = 2;
    end
    figure
    x = 1:1500;
    hold on
    for i=1:length(cells)
        if (mod(i,gap) == 0)
            cur_mat = cells{1,i}{pos,1};
            fprintf('Working on %d.\n',i)
            data = smoothdata(cur_mat(750,:));
            plot(x,data)
        end
    end
    hold off
    leg = gap:gap:length(cells);
    leg = split(cellstr(num2str(leg)));
    legend(leg)
    title(['Nutrient ',type,' distribution at middle line'])
        
end

