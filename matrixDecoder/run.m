outName = 'equal_param';
dirName = 'data/';

%% Load the data Create the gif
txt2gif(outName,dirName);

%% Plot the radius
plotRad(dirName);

%% Plot the population
plotPop(dirName);
%%
distPlot(dirName);