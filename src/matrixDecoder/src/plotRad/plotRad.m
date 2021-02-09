function rad_y = plotRad(cells)
% Goal: Plot the radius as a function of time for a set of data
% Input: 
% dir: the name of the directory
    concentrates = cell(1,length(cells));
    rad_y = zeros(1,length(cells));
    for i=1:length(cells)
        fprintf('Working on %d.\n',i)
        concentrates{1,i} = cells{1,i}{1,1};
        rad_y(1,i) = radius(concentrates{1,i});
        if isnan(rad_y(1,i))
            rad_y(1,i) = 0;
        end
    end
    rad_x = 1:length(cells);
%     f = figure('visible','off');
%     plot(rad_x,rad_y);
%     title('Concentration radius growth');
%     savefig(f,'radius_growth.fig')
end

