function size = calPopulation(mat,type)
    idx = mat==type;
    size = sum(idx(:));
end

