function width = spiralWidth(data,ctype)
    l = length(data);
    width = zeros(1,l-1);
    for i = 1 : l-1
        cur_cell = data{1,i+1}-data{1,i};
        cur_cell = ismember(cur_cell,ctype);
        cur_cell = bwlabel(cur_cell,8);
        upper = max(max(cur_cell));
        ma = 0;
        idx = 0;
        for j = 1 : upper
            mat = ismember(cur_cell, j);
            s = sum(sum(mat));
            if s > ma
                ma = s;
                idx = j;
            end
        end
        cur_cell = ismember(cur_cell,idx);
        [val,maxarg, minarg] = calWidth(cur_cell);
        if isempty(val)
            width(i) = 0;
            continue
        end
        width(i) = val;
    end
end

function [width, maxarg, minarg] = calWidth(data)
    [x,y] = find(data == 1);
    mid = floor(length(data)/2);
    dist = sqrt((x-mid).^2+(y-mid).^2);
    [maxval, maxarg] = max(dist);
    [minval, minarg] = min(dist);
    width = maxval - minval;
    maxarg = [x(maxarg) y(maxarg)];
    minarg = [x(minarg) y(minarg)];
end

           