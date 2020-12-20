function plotFrontCell(inDir)
    dirName = strcat(inDir,'*.txt');
    files = dir(dirName);
    files = natsortfiles({files.name});
    front1 = zeros(1,length(files));
    front2 = zeros(1,length(files));
    for i=1:length(files)
        fileName = strcat(inDir,files{1,i});
        cur_mat = decodeMatrix(fileName,3);
        fprintf('Working on %s.\n',fileName)
        front1(1,i) = calFront(cur_mat{1},1);
        front2(1,i) = calFront(cur_mat{1},2);
    end
    time = 1:length(files);
    figure
    hold on
    plot(time,front1,'.-')
    plot(time,front2,'.-')
    legend('Type 1','Type 2')
    title('Front cell population')
    hold off
end

function count = calFront(matrix,type)
    [x,y] = find(matrix == type);
    b = boundary(x,y,1);
    count = length(unique(b));
%     M = zeros(size(matrix));
%     for i = 1:length(x)
%         M(:) = 0;
%         M(x(i),y(i)) = 1;
%         sur = matrix(conv2(M,[0,1,0;1,0,1;0,1,0],'same')>0);
%         if (prod(sur) == 0)
%             count = count + 1;
%         end
%         
%     end
end

