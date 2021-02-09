function plotPop(cells,isLog, thres)
% Goal: Plot the size of population of certain type
% as a function of time for a set of data:
% Type is denoted by the number
% Input: 
% dir: the name of the directory
    size1 = zeros(1,length(cells));
    size2 = zeros(1,length(cells));
    for i=1:length(cells)
        fprintf('Working on %d.\n',i)
        cur_mat = cells{1,i}{1,1};
        size1(1,i) = calPopulation(cur_mat,1);
        size2(1,i) = calPopulation(cur_mat,2);
    end
    figure(1)
    set(gca,'yscale','log')
    hold on 
    time = 1:length(cells);
    
    plot(time,size1,'.')
    if isLog == 1
        grad = gradient(size1);
        threshold = find(grad > max(grad)/thres);
        threshold = threshold(diff(threshold) == 1);
        lower = min(threshold);
        upper = max(threshold);
        x = lower:upper;
        y = size1(lower:upper);
        P = polyfit(x,y,1);
        yfit1 = P(1)*x+P(2);
        plot(x,yfit1)
        caption1 = sprintf('fit-line-1: y = %f * x + %f', P(1), P(2));
    end
    
    plot(time,size2,'.')
    if isLog == 1
        grad2 = gradient(size2);
        threshold2 = find(grad2 > max(grad2)/thres);
        threshold2 = threshold2(diff(threshold2) == 1);
        lower = min(threshold2);
        upper = max(threshold2);
        x2 = lower:upper;
        y2 = size2(lower:upper);
        P = polyfit(x2,y2,1);
        yfit2 = P(1)*x2+P(2);
        plot(x2,yfit2)
        caption2 = sprintf('fit-line-2: y = %f * x + %f', P(1), P(2));
        legend('Type 1',caption1,'Type 2',caption2,'Location','southeast')
    else
        legend('Type 1','Type 2','Location','southeast')
    end
    hold off
    grid on
    title('Population growth')
end

