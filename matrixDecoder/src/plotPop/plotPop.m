function plotPop(inDir,isLog, thres)
% Goal: Plot the size of population of certain type
% as a function of time for a set of data:
% Type is denoted by the number
% Input: 
% dir: the name of the directory
    dirName = strcat(inDir,'*.txt');
    files = dir(dirName);
    files = natsortfiles({files.name});
    size1 = zeros(1,length(files));
    size2 = zeros(1,length(files));
    for i=1:length(files)
        fileName = strcat(inDir,files{1,i});
        cur_mat = decodeMatrix(fileName,3);
        fprintf('Working on %s.\n',fileName)
        size1(1,i) = calPopulation(cur_mat{1},1);
        size2(1,i) = calPopulation(cur_mat{1},2);
    end
    if isLog == 1
        size1 = log(size1);
        size2 = log(size2);
    end
    time = 1:length(files);
    figure
    hold on 
    semilogy(time,size1,'.')
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
    
    semilogy(time,size2,'.')
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
        legend('Type 1',caption1,'Type 2',caption2)
    else
        legend('Type 1','Type 2')
    end
    hold off
    grid
    title('Population growth')
end

