function [data,map] = mat2jet(data)
[data,~] = gray2ind(data);
data = ind2rgb(data,jet(150));
[data,map] = rgb2ind(data,256);
end

