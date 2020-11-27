%plot distribution
function distPlot(inDir,type, gap)
    if type == 'A'
        pos = 3;
    elseif type == 'B'
        pos = 2;
    end
    figure
    dirName = strcat(inDir,'*.txt');
    files = dir(dirName);
    files = natsortfiles({files.name});
    x = 1:1500;
    hold on
    for i=1:length(files)
        if (mod(i,gap) == 0)
            fileName = strcat(inDir,files{1,i});
            cur_mat = decodeMatrix(fileName, 3);
            fprintf('Working on %s.\n',fileName)
            data = smoothdata(cur_mat{pos}(750,:));
            plot(x,data)
        end
    end
    hold off
    leg = gap:gap:length(files);
    leg = split(cellstr(num2str(leg)));
    legend(leg)
    title(['Nutrient ',type,' distribution at middle line'])
        
end

