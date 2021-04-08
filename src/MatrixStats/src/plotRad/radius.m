function rad = radius(data)
    [row,col] = size(data);
    mid = floor(row/2);
    dist = zeros(row,col);
    for i=1:row
        for j=1:col
            if data(i,j) == 0
                dist(i,j) = 0;
            else
                dist(i,j) = sqrt((i-mid)^2+(j-mid)^2);
            end
        end
    end
    max_dist = nonzeros(max(dist));
    rad = mean(max_dist);
end
           