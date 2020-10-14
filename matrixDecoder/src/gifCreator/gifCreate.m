function gifCreate(dataset,filename, isColor)
% Goal: Create a gif with given dataset. There are color mode
% and gray scale mode for gif
% Input: 
% dataset: the dataset to create gif
% filename: the filename for the .fig file
% isColor: determine whether output with color(1) or gray scale(0)
% Output: two gif file stored in current directory with 
% the given name, one for the placement, and one for concentration.
    set(gcf,'renderer','OpenGL');
	[~,col] = size(dataset);
    for n = 1:col
        cur_data = dataset{1,n};
        
        if (isColor)
            [cur_data,~] = gray2ind(cur_data);
            cur_data=ind2rgb(cur_data,jet(150));
            [cur_data,map] = rgb2ind(cur_data,256);
            if n == 1
                imwrite(cur_data,map,filename,'gif', 'Loopcount',inf);
            else
                imwrite(cur_data,map,filename,'gif','WriteMode','append');
            end
        else
%             cur_data = dlarray(cur_data);
%             cur_data = (cur_data);
%             cur_data = sigmoid(cur_data)*150;
%             cur_data = extractdata(cur_data);
            max_value = max(max(cur_data));
            cur_data = cur_data.*(255/max_value);
            if n == 1
                imwrite(cur_data,filename,'gif', 'Loopcount',inf);
            else
                imwrite(cur_data,filename,'gif','WriteMode','append');
            end
        end
        
    end
end