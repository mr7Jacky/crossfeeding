function cells = readTxtMatrix(inDir,numMatrix)
%readTxtMatrix Read the matrix data from txt file
%   read all txt file of given directory and read all the txt files in that
%   direactory and save into an cell object
    dirName = strcat(inDir,'*.txt');
    files = dir(dirName);
    files = natsortfiles({files.name});
    cells = cell(1,length(files));
    for i=1:length(files)
        fileName = strcat(inDir,files{1,i});
        cur_mat = decodeMatrix(fileName, numMatrix);
        fprintf('Working on %s.\n',fileName)
        cells{1,i} = cur_mat;
    end
end

