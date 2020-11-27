function plotRad(inDir)
% Goal: Plot the radius as a function of time for a set of data
% Input: 
% dir: the name of the directory
    dirName = strcat(inDir,'*.txt');
    files = dir(dirName);
    files = natsortfiles({files.name});
    concentrates = cell(1,length(files));
    rad_y = zeros(1,length(files));
    for i=1:length(files)
        fileName = strcat(inDir,files{1,i});
        [~,cur_concen] = decodeMatrix(fileName);
        fprintf('Working on %s.\n',fileName)
        concentrates{1,i} = cur_concen;
        rad_y(1,i) = radius(concentrates{1,i});
        if isnan(rad_y(1,i))
            rad_y(1,i) = 0;
        end
    end
    rad_x = 1:length(files);
    figure
    plot(rad_x,rad_y)
    title('Concentration radius growth')
end

