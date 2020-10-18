function [matrices] = decodeMatrix(filename,numMat)
% Goal: Read the matrix from txt file and seperate into two halves.
% Input: 
% filename: the file to process
% numMat: the total number of matrix containing
% Output: a list of matrix in a cell
    data = dlmread(filename);
    [row,~] = size(data);
    divPt = floor(row/numMat);
    matrices = cell(numMat,1);
    for i=1:numMat
        lower = i * divPt - divPt + 1;
        upper = divPt*i;
        matrices{i} = data(lower:upper,:);
    end
end