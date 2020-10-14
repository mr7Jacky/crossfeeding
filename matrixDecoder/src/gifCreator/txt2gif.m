function txt2gif(outputName,inDir)
% Goal: Create a gif from given directory, where 
% matrix contains in txt file. Each matrix is a 3000-by-1500.
% The upper half matrix records placement of bacteria
% The lower half matrix records the concentration of neutrient
% Input: 
% outputName: the name for the gif file
% dir: the name of the directory
% Output: two gif file stored in current directory with 
% the given name, one for the placement, and one for concentration.
    dirName = strcat(inDir,'*.txt');
    files = dir(dirName);
    files = natsortfiles({files.name});
    cells = cell(1,length(files));
    concentrates = cell(1,length(files));
    for i=1:length(files)
        fileName = strcat(inDir,files{1,i});
        [cur_cell,cur_concen] = decodeMatrix(fileName);
        fprintf('Working on %s.\n',fileName)
        cells{1,i} = cur_cell;
        concentrates{1,i} = cur_concen;
    end
    fprintf('Creating gif for bacteria.\n')
    gifCreate(cells,strcat(outputName,'-cells.gif'),1);
    fprintf('Creating gif for concentration.\n')
    gifCreate(concentrates,strcat(outputName,'-concentrates.gif'),0);
end

