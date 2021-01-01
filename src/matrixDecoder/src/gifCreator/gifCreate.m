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
if ~isColor
    global_max = 0;
    for n = 1:col
        cur_data = dataset{1,n};
        local_max = max(max(cur_data));
        if local_max > global_max
            global_max = local_max;
        end
    end
end
h = figure;
for n = 1:col
    cur_data = dataset{1,n};
    
    if (isColor)
        dist = mat2jet(cur_data);
        im_t2 = createNote(50,200,2,'Type 2');
        im_t1 = createNote(50,200,1,'Type 1');
        img = cat(1,im_t1,im_t2);
        X = 20;
        Y = 20;
        dist((1:size(img,1))+X,(1:size(img,2))+Y,:) = img;
        img = image(dist);
        [img,map] = rgb2ind(img.CData,256);
        if n == 1
            imwrite(img,map,filename,'gif', 'Loopcount',inf);
        else
            imwrite(img,map,filename,'gif','WriteMode','append');
        end
    else
%         cur_data = cur_data.*(255/global_max);
%         
%         if n == 1
%             imwrite(cur_data,filename,'gif', 'Loopcount',inf);
%         else
%             imwrite(cur_data,filename,'gif','WriteMode','append');
%         end
        
        imagesc(cur_data,[0,global_max]);
        c = colorbar('Location','south','color','w');
        c.Label.String = 'Nutrient Concentration';
        frame = getframe(h); 
        im = frame2im(frame); 
        [imind,cm] = rgb2ind(im,256); 
        % Write to the GIF File 
        if n == 1 
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
        else 
            imwrite(imind,cm,filename,'gif','WriteMode','append'); 
        end 
    end

end
end