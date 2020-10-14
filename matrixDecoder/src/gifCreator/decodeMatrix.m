function [upper,lower] = decodeMatrix(filename)
% Goal: Read the matrix from txt file and seperate into two halves.
% Input: 
% filename: the file to process
% Output: the upper half and the lower half the the matrix
    data = dlmread(filename);
    [row,~] = size(data);
    mid = floor(row/2);
    upper = data(1:mid,:);
    lower = data(mid+1:row,:);
end