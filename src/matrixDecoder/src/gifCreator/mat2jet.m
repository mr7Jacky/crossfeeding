function img = mat2jet(data)
[data,~] = gray2ind(data);
img = ind2rgb(data,jet(150));
end

