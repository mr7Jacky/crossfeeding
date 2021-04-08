function [ret,x,y] = isSpiral(mat)
    [x,y] = find(mat ~= 0);
    p = boundary(x,y,1);
    x = x(p);
    y = y(p);
    init = mat(x(1),y(1));
    for i = 1:length(p)
        val = mat(x(i),y(i));
        if val ~= init 
            ret = 1;
            return
        end
    end
    ret = 0;
end

