function plotTotNutrient(inDir)
% Type A = 0
% Type B = 1
    dirName = strcat(inDir,'*.txt');
    files = dir(dirName);
    files = natsortfiles({files.name});
    nutrientA = zeros(1,length(files));
    nutrientB = zeros(1,length(files));
    for i=1:length(files)
        fileName = strcat(inDir,files{1,i});
        cur_mat = decodeMatrix(fileName,3);
        fprintf('Working on %s.\n',fileName)
        nutrientA(1,i) = sum(sum(cur_mat{3}));
        nutrientB(1,i) = sum(sum(cur_mat{2}));
    end
    time = 1:length(files);
    figure
    hold on
    plot(time,nutrientA)
    plot(time,nutrientB)
    legend('Nutrient A','Nutrient B')
    title('Nutrient growth')
    hold off
end


