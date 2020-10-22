outName = 'excreB10';
dirName = 'data/';

%% Load the data Create the gif
txt2gif(outName,dirName);

%% Plot the radius
plotRad(dirName);

%% Plot the populatio
plotPop(dirName,1,3);

%%
distPlot(dirName);

%%
plotTotNutrient(dirName);