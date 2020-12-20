
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

%% Plot Width
% Load the data from file
%load('cells.mat');

figure
hold on

% Calculate the width
width = calWidth(cells,1);
width2 = calWidth(cells,2);

% Remove outliers
width = rmoutliers(width);
width2 = rmoutliers(width2);

% save('width1.mat','width')
% save('width2.mat','width2')
[~,col] = size(width);
x = 1:col;
plot(x,width,'.');
[~,col] = size(width2);
x = 1:col;
plot(x,width2,'.');



% Fit the data
[~,col] = size(width);
x = 1:col;
P1 = polyfit(x,width,1);
%P12 = polyfit(x,width,2);
[~,col] = size(width2);
x = 1:col;
P2 = polyfit(x,width2,1);
%P22 = polyfit(x,width2,2);

% Generate the fit line
wfit1 = P1(1)*x+P1(2);
%wfit12 = P12(1)*x.^2+P12(2)*x+P12(3);
plot(x,wfit1);
%plot(x,wfit12);
caption1 = sprintf('Type 1 Fit line: y = %f * x + %f', P1(1), P1(2));
%caption12 = sprintf('Fit line: y = %f * x^2 + %f * x + %f', P12(1), P12(2),P12(3));

wfit2 = P2(1)*x+P2(2);
%wfit22 = P22(1)*x.^2+P22(2)*x+P22(3);
plot(x,wfit2);
%plot(x,wfit22);
caption2 = sprintf('Type 2 Fit line: y = %f * x + %f', P2(1), P2(2));
%caption22 = sprintf('Fit line: y = %f * x^2 + %f * x + %f', P22(1), P22(2),P22(3));

% Add title and legend
title("Width vs Time");
legend({caption1, caption2, 'Type 1 Data points', 'Type 2 Data points'},'FontSize',14);
hold off
%% Plot linear theta
%load('cells.mat');
theta1 = plotTheta(cells,1);
theta1 = linearFluc(theta1);
% save('theta1.mat','theta1')

figure
%set(gca,'xscale','log','yscale','log')
hold on
% Remove the outliers and plot the fitting line
fit1 = rmoutliers(theta1);
[~,col] = size(fit1);
x = 1:col;
p1 = polyfit(x,fit1,1);
y1 = p1(1)*x+p1(2);
plot(x,y1)
% Plot the original data
[~,col] = size(theta1);
x = 1:col;
plot(x,theta1,'.');
% Obtain the raw data
theta2 = plotTheta(cells,2);
theta2 = linearFluc(theta2);
% Remove the outliers and plot the fitting line
fit1 = rmoutliers(theta2);
[~,col] = size(fit1);
x = 1:col;
p2 = polyfit(x,rmoutliers(theta2),1);
y2 = p2(1)*x+p2(2);
plot(x,y2)
% Plot the original data
[~,col] = size(theta1);
x = 1:col;
plot(x,theta2,'.')
caption1 = sprintf('Fit line 1: y = %f * x + %f', p1(1),p1(2));
caption2 = sprintf('Fit line 2: y = %f * x + %f', p2(1),p2(2));
%caption22 = sprintf('Fit line 2: y = %f * x^2 + %f * x + %f', p22(1), p22(2),p22(3));
legend( caption1,'type1', caption2,'type2')
hold off

%% Width vs Angle
width = calWidth(cells,1);
[width_r,TF] = rmoutliers(width);

fprintf('Working on plot theta\n')
theta = plotTheta(cells,1);
theta = linearFluc(theta);

j = 0;
for i = 1 : length(TF)
    if TF(i) == 1
        theta(i-j) = [];
        j = j + 1;
    end
end
hold on
plot(width_r,theta,'ro')
plot(width_r,theta,'b-')
hold off
%% Angle * Radius vs Time
% Reduction by 1 is because angle is calculated by subtraction between two
% frames
ctype = 1;
rad_y = zeros(1,length(cells)-1);
for i=2:length(cells)
    fprintf('Working on %d.\n',i)
    rad_y(1,i-1) = radius(cells{1,i});
    if isnan(rad_y(1,i-1))
        rad_y(1,i-1) = 0;
    end
end
theta1 = plotTheta(cells,1);
theta1 = linearFluc(theta1);
rad_x = 1:length(cells) - 1;
clear angle_radius

angle_radius(1,:) = theta1;
angle_radius(2,:) = rad_y;
angle_radius = prod(angle_radius);
figure
set(gca,'yscale','log')
set(gca,'xscale','log')
hold on
plot(rad_x,abs(angle_radius), 'ro')
plot(rad_x,abs(angle_radius), 'b-')
hold off
%% Plot oscillation theta
%load('cells.mat');
theta1 = plotTheta(cells,1);

figure
hold on
% Plot the original data
[~,col] = size(theta1);
x = 1:col;
plot(x,theta1,'.-');
% Obtain the raw data
theta2 = plotTheta(cells,2);
% Plot the original data
[~,col] = size(theta2);
x = 1:col;
plot(x,theta2,'.-')
legend('type1', 'type2')
hold off


