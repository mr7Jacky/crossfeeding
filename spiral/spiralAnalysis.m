
inDir = 'data/';
%% INITIALIZATION
dirName = strcat(inDir,'*.txt');
files = dir(dirName);
files = natsortfiles({files.name});
cells = cell(1,length(files));
for i=1:length(files)
    fileName = strcat(inDir,files{1,i});
    cur_mat = decodeMatrix(fileName, 3);
    fprintf('Working on %s.\n',fileName)
    cells{1,i} = cur_mat{1};
end
%%
inDir = 'data/';

dirName = strcat(inDir,'*.txt');
files = dir(dirName);
files = natsortfiles({files.name});
cells = cell(1,length(files));
for i=1:length(files)
    fileName = strcat(inDir,files{1,i});
    cur_mat = decodeMatrix(fileName, 3);
    fprintf('Working on %s.\n',fileName)
    cells{1,i} = cur_mat{1};
end

%%
%load('cells.mat');
width = calWidth(cells,1);
% save('width2.mat','width')
width = rmoutliers(width);
[~,col] = size(width);
x = 1:col;
P = polyfit(x,width,1);
P2 = polyfit(x,width,2);
figure
hold on
wfit = P(1)*x+P(2);
wfit2 = P2(1)*x.^2+P2(2)*x+P2(3);
plot(x,wfit);
plot(x,wfit2);
caption1 = sprintf('Fit line: y = %f * x + %f', P(1), P(2));
caption2 = sprintf('Fit line: y = %f * x^2 + %f * x + %f', P2(1), P2(2),P2(3));
title("Width vs Time");
plot(x,width,'.');
legend(caption1,caption2, 'Data points');
hold off
%%
%load('cells.mat');
theta1 = plotTheta(cells,1);
theta1 = linearFluc(theta1);
% save('theta1.mat','theta1')
[~,col] = size(theta1);
x = 1:col;
figure
set(gca,'xscale','log','yscale','log')
hold on
p1 = polyfit(x,theta1,1);
y1 = p1(1)*x+p1(2);
plot(x,y1)
plot(x,theta1,'.');
theta2 = plotTheta(cells,2);
theta2 = linearFluc(theta2);
% save('theta2.mat','theta2')
[~,col] = size(theta2);
p2 = polyfit(x,theta2,1);
y2 = p2(1)*x+p2(2);
plot(x,y2)
plot(x,theta2,'.')
caption1 = sprintf('Fit line 1: y = %f * x + %f', p1(1),p1(2));
caption2 = sprintf('Fit line 2: y = %f * x + %f', p2(1),p2(2));
%caption22 = sprintf('Fit line 2: y = %f * x^2 + %f * x + %f', p22(1), p22(2),p22(3));
legend( caption12,'type1', caption2,'type2')
hold off


