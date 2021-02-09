function [theta,rad, x, y] = calTheta(c,ctype)
    pos = zeros(2,length(c)-1);
    for i = 1:length(c)-1
        raw = c{i+1}-c{i};
        if (sum(any(raw)) < 10)
            pos(:,i) = 750;
            continue
        end
        % remove unused data
        raw = ismember(raw,ctype);
        % find largest population cluster
        cur_cell = bwlabel(raw,4);
        upper = max(max(cur_cell));
        idx = 1;
        ma = 0;
        for j = 1 : upper
            mat = ismember(cur_cell, j);
            s = sum(sum(mat));
            if s > ma
                ma = s;
                idx = j;
            end
        end
        cur_cell = ismember(cur_cell,idx);
        % Get The center of mass of the largest population
        data = regionprops(cur_cell);
        pos(:,i) = data.Centroid;
    end
    x = nonzeros(pos(1,:));
    y = nonzeros(pos(2,:));
    theta = mod(cart2pol(x-750,y-750),2*pi);
    rad = sqrt((x-750).^2 + (y-750).^2);
end

