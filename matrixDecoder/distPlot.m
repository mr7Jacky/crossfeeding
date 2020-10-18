%plot distribution
function distPlot(inDir)
    gap = 5;
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
            data = smoothdata(cur_mat{3}(750,:));
            plot(x,data)
        end
    end
    legend('1','2','3','4','5','6')
    hold off
        
end

