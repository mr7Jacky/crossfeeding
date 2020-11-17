addpath('src/');
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
load('cells.mat');
fprintf('Creating gif for bacteria.\n')
[~,col]=size(cells);
delta = cell(1,col);
for i=1:col - 1
    fprintf('Working on %d|%d.\n',i,col-1)
    delta{1,i} = cells{1,i+1} - cells{1,i};
end
gifCreate(delta,'cells.gif',1);
%%
load('cells.mat');
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
load('cells.mat');
theta1 = plotTheta(cells,1);
theta1 = linearFluc(theta1);
% save('theta1.mat','theta1')
[~,col] = size(theta1);
x = 1:col;
figure
set(gca,'xscale','log')
hold on
p12 = polyfit(x,theta1,2);
y12 = p12(1)*x.^2+p12(2)*x+p12(3);
plot(x,theta1);
plot(x,theta1,'.');
theta2 = plotTheta(cells,2);
theta2 = linearFluc(theta2);
% save('theta2.mat','theta2')
[~,col] = size(theta2);
x = 1:col;
y22 = p22(1)*x.^2+p22(2)*x+p22(3);
plot(x,theta2)
plot(x,theta2,'.')
caption12 = sprintf('Fit line 1: y = %f * x^2 + %f * x + %f', p12(1), p12(2),p12(3));
caption22 = sprintf('Fit line 2: y = %f * x^2 + %f * x + %f', p22(1), p22(2),p22(3));
legend( caption12,'type1', caption22,'type2')
hold off

%%
data = cells;
c1 = cells{1,1};
c2 = cells{1,2};
c3 = cells{1,3};
sum(sum(c1))
if(all(c1))
    disp('hh')
end


