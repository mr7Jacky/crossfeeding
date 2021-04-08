
dirName = 'data/';
cells = readTxtMatrix(dirName,1);
save('c.mat','cells','cells', '-v7.3');
%% Load the data Create the gif
n = 'strip_diff20_0.mat';
load(n);
outName = n;
txt2gif(cells, outName);
%%
fprintf('Reading data.\n')
filename = 'random_grow5_0.mat';
outname = strcat(filename,'B.gif');
load(filename);
set(gcf,'renderer','OpenGL');
fprintf('Get global max.\n')
global_max = zeros(1,length(cells{1}));
for i = 1:length(cells)
    cur_data = cells{1,i};
    for j = 1:length(cur_data)
        local_max = max(max(cur_data{j}));
        if local_max > global_max(j)
            global_max(j) = local_max;
        end
    end
end
labels = {'nutrient B','k0','k1','k2','k3','k4','k5','k6','k7',...
    'k8','k9','k10','nutrient A'};
param = [1 7 8 9 12 2];
fprintf('Create gif.\n')
for i = 1:length(cells)
    h = figure('visible','off','units','normalized','outerposition',[0 0 1 1]);
    cur_data = cells{1,i};
    pos = 1;
    for j = 1:length(cur_data)
        if any(param(:) == j)
            subplot(2,3,pos);
            pos = pos + 1;
            ulim = global_max(j);
            if ulim == 0
                ulim = 1;
            end
            imagesc(cur_data{j},[0,ulim]);
            if j == 1
                c = colorbar('Location','south','color','w','Ticks',[0,1,2], ...
                    'TickLabels',{'None','Type 1','Type 2'});
                c.Label.String = 'Cell Colony';
            else
                c = colorbar('Location','south','color','w');
                c.Label.String = labels{j-1};
            end
        end
    end
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if i == 1 
        imwrite(imind,cm,outname,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,outname,'gif','WriteMode','append'); 
    end 
end
%% Plot the radius
rad = plotRad(cells);

%% Plot the populatio
plotPop(cells,0,3);

%%
distPlot(cells,'B',10);
distPlot(cells,'A',10);

%%
plotTotNutrient(cells);

%%
plotFrontCell(cells);

%%
fprintf('Reading data.\n')
filename = 'random_diff20_0.mat';
outname = strcat(filename,'A.gif');
load(filename);
set(gcf,'renderer','OpenGL');
growth = cell(1,length(cells));
for i = 1:length(cells)
    cur_data = cells{1,i}{3};
    cur_grow = cur_data./(cur_data+1);
    growth{i} = cur_grow;
end

cells = growth;
fprintf('Get global max.\n')
global_max = 0;
for i = 1:length(cells)
    cur_data = cells{1,i};
    local_max = max(max(cur_data));
    if local_max > global_max
        global_max = local_max;
    end
end


fprintf('Create gif.\n')
for i = 1:length(cells)
    h = figure('visible','off','units','normalized','outerposition',[0 0 1 1]);
    cur_data = cells{1,i};
    imagesc(cur_data,[0,global_max]);
    c = colorbar('Location','south','color','w');
    c.Label.String = 'growth rate';
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File 
    if i == 1 
        imwrite(imind,cm,outname,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,outname,'gif','WriteMode','append'); 
    end 
end