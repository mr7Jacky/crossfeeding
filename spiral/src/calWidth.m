function width = calWidth(data,ctype)
    [~,col] = size(data);
    width = zeros(1,col-1);
    for i = 1 : col-1
        fprintf('Working on %d|%d.\n',i,col-1)
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
        k = radius(cur_cell,1);
        if sum(size(k)) == 1
            width(i) = 0;
            continue
        end
        width(i) = k;
    end
end

function rad = radius(data,type)
    [row,col] = size(data);
    mid = floor(row/2);
    dist = zeros(row,col);
    for i=1:row
        for j=1:col
            if data(i,j) == type
                dist(i,j) = sqrt((i-mid)^2+(j-mid)^2);
            end
        end
    end
    max_dist = max(max(nonzeros(dist)));
    min_dist = min(min(nonzeros(dist)));
    rad = max_dist-min_dist;
end
           