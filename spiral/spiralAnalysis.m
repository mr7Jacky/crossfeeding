
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
c = cell(1,length(cells));
for i = 1 : length(cells)
     c{i} = cells{1,i}{1,1};
end
ctype = 1;
%% Plot Width
w = spiralWidth(c,1); 
save('3.mat','w');
%% Angle

[the,rad, x, y] = calTheta(c,ctype);
the = linearFluc(the);

figure(1)
%set(gca,'xscale','log','yscale','log')
x = 1:length(the);
plot(x,the,'.-');

%% Width vs Angle
c = cell(1,length(cells));
for i = 1 : length(cells)
    c{i} = cells{1,i}{1,1};
end
width = calWidth(c,1);
[width_r,TF] = rmoutliers(width);

fprintf('Working on plot theta\n')
theta = plotTheta(c,1);
theta = linearFluc(theta);

j = 0;
for i = 1 : length(TF)
    if TF(i) == 1
        theta(i-j) = [];
        j = j + 1;
    end
end
figure
set(gca,'xscale','log')
hold on
plot(width_r,theta,'ro')
plot(width_r,theta,'b-')
hold off
%% Angle * Radius vs Time
% Reduction by 1 is because angle is calculated by subtraction between two
% frames
c = cell(1,length(cells));
for i = 1 : length(cells)
    c{i} = cells{1,i}{1,1};
end
ctype = 1;
rad_y = zeros(1,length(c));
for i=2:length(c)
    fprintf('Working on %d.\n',i)
    rad_y(1,i-1) = radius(c{1,i});
    if isnan(rad_y(1,i-1))
        rad_y(1,i-1) = 0;
    end
end
theta1 = plotTheta(c,1);
%theta1 = linearFluc(theta1);
rad_x = 1:length(c) - 1;
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


