outName = 'diffB200';
dirName = '../output/';

%% Load the data Create the gif
txt2gif(outName,dirName);

%% Plot the radius
plotRad(dirName);

%% Plot the population
plotPop(dirName);