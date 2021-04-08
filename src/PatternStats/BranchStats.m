%% Check current set
load('branch.mat');
% fprintf(['Total number of data: %d\n'...
%     'Number of spiral pattern: %d\n' ...
%     'Number of engulf pattern: %d\n'...
%     'Ratio is (spiral / engulf): %d\n'], ...
%     sum(bran_counter), bran_counter)
bar(bran_counter)
title(['Total number of data: ', num2str(sum(bran_counter))], 'FontSize',20);
text(1:length(bran_counter),bran_counter,num2str(bran_counter'),'vert','bottom','horiz','center','FontSize',15); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',15)
xticklabels({'2','4','6','8','10','12','14','16','18','20'})
%% Clear data
% num_spiral = 0;
% num_engulf = 0;
% save('ns.mat', 'num_spiral');
% save('ne.mat', 'num_engulf')
load('Patterns1029.mat')
%% Detect Spiral 


load('branch.mat');
for i = 1001:numel(Patterns)
    cur = Patterns{i};
    if isSpiral(cur) == 1
        numBran = getNumBranches(cur);
        m = floor(i/9) + 1;
        figure(m)
        n = mod(i,9)+1;
        subplot(3,3,n)
        imagesc(cur);
        title(num2str(numBran))
        idx = int8(numBran/2);
        if idx == 0
            continue
        end
        bran_counter(idx) =  bran_counter(idx) + 1;
    end
end
save('branch.mat', 'bran_counter');
%% 2 branches -1
tb = tb - 1;
%% 4 branches -1
fb = fb - 1;
%% 2 branches +1
tb = tb + 1;
%% 4 branches +1
fb = fb + 1;
%% 6 branches -1
sb = sb - 1;
%% 8 branches -1
eb = eb - 1;
%% Adjust


load('branch.mat');
bran_counter = adj(floor(4/2),fb,bran_counter);
bran_counter = adj(floor(2/2),tb,bran_counter);
bran_counter = adj(floor(6/2),sb,bran_counter);
bran_counter = adj(floor(8/2),eb,bran_counter);
save('branch.mat', 'bran_counter');
tb = 0;
fb = 0;
sb = 0;
eb = 0;
function bran = adj(idx, fac, bran)
     bran(idx) =  bran(idx) + fac;
end
