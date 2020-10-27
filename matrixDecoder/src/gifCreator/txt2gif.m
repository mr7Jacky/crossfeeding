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
    concen_A = cell(1,length(files));
    concen_B = cell(1,length(files));
    for i=1:length(files)
        fileName = strcat(inDir,files{1,i});
        cur_mat = decodeMatrix(fileName, 3);
        fprintf('Working on %s.\n',fileName)
        cells{1,i} = cur_mat{1};
        concen_A{1,i} = cur_mat{2};
        concen_B{1,i} = cur_mat{3};
    end
    fprintf('Creating gif for bacteria.\n')
    gifCreate(cells,strcat(outputName,'cells.gif'),1);
    fprintf('Creating gif for concentration A.\n')
    gifCreate(concen_A,strcat(outputName,'concen_A.gif'),0);
    fprintf('Creating gif for concentration B.\n')
    gifCreate(concen_B,strcat(outputName,'concen_B.gif'),0);
end

