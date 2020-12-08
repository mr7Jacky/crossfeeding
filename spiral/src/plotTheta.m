function theta_p = plotTheta(data,ctype)
    theta_p = 1:length(data);
    for i = 1:length(data)-1
        raw = data{1,i+1}-data{1,i};
        if (sum(any(raw)) == 0)
            theta_p(i) = 0;
            continue
        end
        % remove unused data
        raw = ismember(raw,ctype);
        % find largest population cluster
        cur_cell = bwlabel(raw,8);
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
        theta_p(i) = calTheta(cur_cell,1);
    end
end

function the = calTheta(data,cell_type)
    
    mid = 750;
    [x,y] = find(data == cell_type);
    [row,~] = size(x);
    dist = zeros(row,1);
    for i=1:row
        [cur,~] = cart2pol(y(i)-mid,x(i)-mid);
        if cur < 0
            cur = cur + 2*pi;
        end
        dist(i) = cur;
    end
    the = max(max(dist));
end

