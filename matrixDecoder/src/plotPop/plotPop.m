function plotPop(inDir)
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
        [cur_cell,~] = decodeMatrix(fileName);
        fprintf('Working on %s.\n',fileName)
        size1(1,i) = calPopulation(cur_cell,1);
        size2(1,i) = calPopulation(cur_cell,2);
    end
    time = 1:length(files);
    figure
    plot(time,size1)
    hold on 
    plot(time,size2)
    legend('Type 1','Type 2')
    title('Population growth')
end

