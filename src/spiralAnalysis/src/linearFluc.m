function ret = linearFluc(data)
    len = length(data);
    ret = 1:len-1;
    counter = 0;
    isAscend = 1;
    if mode(gradient(data) < 0)
        isAscend = 0;    
    end
    for i = 1 : len - 1
        if (i > 2) && (abs(data(i) - data(i-1)) > pi)
            counter = counter + 1;
        end
        if isAscend
            ret(i) = data(i) + 2*pi*counter;
        else
            ret(i) = data(i) - 2*pi*counter;
        end
    end
end
