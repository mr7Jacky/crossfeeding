function ret = linearFluc(data)
    [~,col] = size(data);
    ret = 1:col-1;
    counter = 0;
    isAscend = 1;
    if sum(gradient(data)) < 0
        isAscend = 0;
    end
    for i = 1 : col - 1
        if (i > 2) && (abs(data(i) - data(i-1)) > pi)
            counter = counter + 1;
        end
        if isAscend
            ret(i) = data(i) + 2*pi*counter;
        else
            ret(i) = data(i) - 2*pi*counter;
        end
%         if degMode
%             % not working
%             data(i) = rad2deg(data(i) + pi*counter);
%         end
    end
end
